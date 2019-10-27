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

func downloadImage(pictureID: String, imageView: UIImageView, completion: @escaping (Bool) -> () ) {
    // returns whether we can update imageView.image with the downloaded image
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let storageRef = appDelegate.storageRef.child("Images").child(pictureID)
    storageRef.getData(maxSize: 1000000, completion: { (data, error) in
        // Get download URL from snapshot
        if error != nil {
            print(" we couldnt upload the img")
            completion(false)
        } else {
            if let imgData = data {
                if let img = UIImage(data: imgData) {
                    imageView.image = img
                    print("updated image!")
                    completion(true)
                }
            }
        }
        completion(false)
    })
    print("finished download image")
}

func getAllPosts(completion: @escaping ([FeedPost]?) -> () ) {
    // returns all post ID's after time
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    getAllWorkouts() { workoutLstWrapped in
        if let workoutLst = workoutLstWrapped {
            appDelegate.databaseRef.child("Posts").queryOrdered(byChild: "time").observeSingleEvent(of: .value, with:{ (snapshot) in
                    guard let value = snapshot.value as? NSDictionary else {
                        print("can't convert value to dictionary")
                        return
                    }
                
                    var returnedFeedPostList: [FeedPost]? = []
                
                    for v in value.keyEnumerator() {
                        let postID = v as! String
                        let postDict = value[v] as! NSDictionary
                        let dateTime = convertStringToDate(date: postDict["time"]! as! String)!
                        if let p = dictionaryToFeedPost(postID: postID, postIDDictionary: postDict, workoutLst: workoutLst) {
                            returnedFeedPostList?.append(p)
                        }
                    }
                    completion(returnedFeedPostList)
                    })
        }
        completion(nil)
    }
}


private func dictionaryToFeedPost(postID: String, postIDDictionary: NSDictionary, workoutLst: [Workout]) -> FeedPost? {
    
    guard let description = postIDDictionary["description"] as? String else {
        print("cant get description")
        return nil
    }
    
    guard let time = postIDDictionary["time"] as? String else {
        print("cant get time")
        return nil
    }
    
    guard let title = postIDDictionary["title"] as? String else {
        print("cant get title")
        return nil
    }
    
    guard let userID = postIDDictionary["userID"] as? String else {
        print("cant get userID")
        return nil
    }
    
    guard let workoutID = postIDDictionary["workoutID"] as? String else {
        print("cant get workoutID")
        return nil
    }
    
    
    var workout = workoutLst[0]
    for w in workoutLst {
        if workout.workoutID == workoutID {
            workout = w
        }
    }
    
    guard let dateTime = convertStringToDate(date: time) else {
        print("time can't be converted")
        return nil
    }
    
    // TODO: Stop hardcoding pictureIDs
    guard let pictureIDs = postIDDictionary["pictureID"] as? [String] else {
        print("cant get picture IDs")
        return nil
    }
    

    return FeedPost(postID: postID,
                            workout: workout,
                            userID: userID,
                            pictures: nil,
                            pictureID: pictureIDs,
                            title: title,
                            description: description,
                            time: dateTime)
}





