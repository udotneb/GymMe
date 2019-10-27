//
//  Helpers.swift
//  GymMe
//
//  Created by Chuck Tang on 10/26/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import Foundation
import UIKit

func getMockedExcercise(weight: Int, name: String, numSets: Int) -> Excercise {
    var myLst = [ExcerciseSet]()
    for _ in 1...numSets {
        myLst.append(getMockedExerciseSet(weight: weight))
    }
    return Excercise(lstSets: myLst, excerciseName: name)
}

func getMockedExerciseSet(weight: Int) -> ExcerciseSet {
    return ExcerciseSet(reps:weight, weight: weight)
}

func getMockedSampleWorkout() -> Workout {
    let userID = "userID"
    let workoutID = "workoutID"
    let excerciseLst = [getMockedExcercise(weight: 1, name: "abs", numSets: 1), getMockedExcercise(weight: 2, name: "abs", numSets: 2)]
    let time = Date()
    return Workout(workoutID: workoutID, userID: userID, excerciseLst: excerciseLst, time: time)
}

func getMockedSampleFeedPost() -> FeedPost {
    let userID = "userID"
    let workoutID = getMockedSampleWorkout()
    let description = "description"
    let postID = "postId"
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    let time = Date() //TO DO: edit to constant
    return FeedPost(postID: postID, workout: workoutID, userID: userID, pictures: [UIImage.init(named: "BenPic")!], title: "this is a title", description: description, time: time)
}

func getMockedProfile() -> Profile {
    return Profile(userID: "userID", name: "name", age: 100, photo: UIImage.init(named: "BenPic"))
}
