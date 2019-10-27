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
    let workoutID = feedPost.workoutID
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
    let time = feedPost.time.asString(dateFormat: "MM/dd/yyyy HH:mm")
    
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

private func downloadImage(id: String) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let storageRef = appDelegate.storageRef.child("Images").child(id)
    storageRef.getData(maxSize: 1000000, completion: { (data, error) in
        // Get download URL from snapshot
        if error != nil {
            
            print(" we couldnt upload the img")
            
        } else {
            
            if let imgData = data {
                
                if let img = UIImage(data: imgData) {
                    
                    print("image found")
                }
            }
        }
        })
    print("finished download image")
    }
    
    


func getFeedPost(postID: String) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    appDelegate.databaseRef.child("Posts").child(postID).observeSingleEvent(of: .value, with: { (snapshot) in
        // Get user value
        guard let value = snapshot.value as? NSDictionary else {
            print("can't convert value to dictionary")
            return
        }
        
        guard let description = value["description"] as? String else {
            print("cant get description")
            return
        }
        
        guard let pictureIDs = value["pictureID"] as? [String] else {
            print("cant get picture IDs")
            return
        }
        
        downloadImage(id: pictureIDs[0])
        
        guard let time = value["time"] as? String else {
            print("cant get time")
            return
        }
        
        guard let title = value["title"] as? String else {
            print("cant get title")
            return
        }
        
        guard let userID = value["userID"] as? String else {
            print("cant get userID")
            return
        }
        
        guard let workoutID = value["workoutID"] as? String else {
            print("cant get workoutID")
            return
        }
        
        // pull pictureID here
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        guard let dateTime = dateFormatter.date(from: time) else {
            print("time can't be converted")
            return
        }
        
        
        let feedPost = FeedPost(postID: postID,
                                workoutID: workoutID,
                                userID: userID,
                                pictures: nil,
                                title: title,
                                description: description,
                                time: dateTime)
        
        print(feedPost)
    }) { (error) in
        print(error.localizedDescription)
    }

}

