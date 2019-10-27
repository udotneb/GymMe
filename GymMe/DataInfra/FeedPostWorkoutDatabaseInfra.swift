//
//  FeedPostWorkoutDatabaseInfra.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/26/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

func postFeedPost(feedPost: FeedPost) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let postID = feedPost.postID
    let workoutID = feedPost.workout.workoutID
    let userID = feedPost.userID
    
    var pictureIDs: [String] = []
    if let pictures = feedPost.pictures {
        for picture in pictures {
            let picUUID = UUID.init().uuidString
            uploadImage(image: picture, id: picUUID)
            pictureIDs.append(picUUID)
        }
    }
    
    let title = feedPost.title
    let description = feedPost.description
    let time = convertDateToString(date: feedPost.time)
    
    appDelegate.databaseRef.child("Posts").child(postID).setValue(["workoutID": workoutID,
                                                                   "userID": userID,
                                                                   "pictureID": pictureIDs,
                                                                   "title": title,
                                                                   "description": description,
                                                                   "time": time,
                                                                   ])
    print("finished posting")
}

private func uploadImage(image: UIImage, id: String) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let storageRef = appDelegate.storageRef.child("Images").child(id)
    if let uploadData = image.jpegData(compressionQuality: 0.5) {
        storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
            if error != nil {
                print("error")
                return
            } else {
                storageRef.downloadURL(completion: { (url, error) in
                    return
                })
            }
        }
    }
}

private func downloadImage(id: String, completion: @escaping (UIImage?) -> () ) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let storageRef = appDelegate.storageRef.child("Images").child(id)
    storageRef.getData(maxSize: 1000000, completion: { (data, error) in
        // Get download URL from snapshot
        if error != nil {
            
            print(" we couldnt upload the img")
            completion(nil)
        } else {
            
            if let imgData = data {
                
                if let img = UIImage(data: imgData) {
                    completion(img)
                }
            }
        }
    })
    print("finished download image")
}

func getFeedPost(postID: String, completion: @escaping (FeedPost?) -> () ) {
    
    // if completion type is nil, then there is no feed post of postID
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    appDelegate.databaseRef.child("Posts").child(postID).observeSingleEvent(of: .value, with: { (snapshot) in
        // Get user value
        guard let postIDDictionary = snapshot.value as? NSDictionary else {
            print("can't convert value to dictionary")
            completion(nil)
            return
        }
        dictionaryToFeedPost(postID: postID, postIDDictionary:postIDDictionary) { (post) in
            completion(post)
        }
    })
    
}


func getPostsAfterTime(timeCutoff: Date, completion: @escaping ([FeedPost]?) -> () ) {
    // returns all post ID's after time
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let sorted = appDelegate.databaseRef.child("Posts").queryOrdered(byChild: "time").observeSingleEvent(of: .value, with:{ (snapshot) in
        
        guard let value = snapshot.value as? NSDictionary else {
            print("can't convert value to dictionary")
            return
        }
        
        var returnedFeedPostList: [FeedPost]? = []
        
        for v in value.keyEnumerator().reversed() {
            let postID = v as! String
            let postDict = value[v] as! NSDictionary
            let dateTime = convertStringToDate(date: postDict["time"]! as! String)!
            if dateTime > timeCutoff {
                let group = DispatchGroup()
                print("thread")
                print(Thread.current.threadName)
                dictionaryToFeedPost(postID: postID, postIDDictionary: postDict) { (post) in
                    print("thread")
                    print(Thread.current.threadName)
                    if let p = post {
                        print("appended")
                        returnedFeedPostList?.append(p)
                    } else {
                        print("bad")
                    }
                }
                print(dateTime)
            } else {
                break
            }
        }
        print("completed")
        completion(returnedFeedPostList)
    })
}


private func dictionaryToFeedPost(postID: String, postIDDictionary: NSDictionary, completion: @escaping (FeedPost?) -> () ) {
    
    guard let description = postIDDictionary["description"] as? String else {
        print("cant get description")
        return
    }
    
    guard let time = postIDDictionary["time"] as? String else {
        print("cant get time")
        completion(nil)
        return
    }
    
    guard let title = postIDDictionary["title"] as? String else {
        print("cant get title")
        completion(nil)
        return
    }
    
    guard let userID = postIDDictionary["userID"] as? String else {
        print("cant get userID")
        completion(nil)
        return
    }
    
    guard let workoutID = postIDDictionary["workoutID"] as? String else {
        print("cant get workoutID")
        completion(nil)
        return
    }
    
    guard let dateTime = convertStringToDate(date: time) else {
        print("time can't be converted")
        completion(nil)
        return
    }
    
    // TODO: Stop hardcoding pictureIDs
    guard let pictureIDs = postIDDictionary["pictureID"] as? [String] else {
        print("cant get picture IDs")
        completion(nil)
        return
    }
    
    getWorkout(workoutID: workoutID) { (workout) in
        downloadImage(id: pictureIDs[0]) { (image) in
            if let unwrappedWorkout = workout{
                if let pictures = image {
                    let feedPost = FeedPost(postID: postID,
                                            workout: unwrappedWorkout,
                                            userID: userID,
                                            pictures: [pictures],
                                            title: title,
                                            description: description,
                                            time: dateTime)
                    completion(feedPost)
                } else {
                    completion(nil)
                }
            }
        }
    }
    
}





