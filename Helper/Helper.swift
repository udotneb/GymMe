//
//  Helper.swift
//  
//
//  Created by Benjamin Ulrich on 10/26/19.
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
    let excerciseLst = [getMockedExcercise(weight: 1, name: "Abs", numSets: 1), getMockedExcercise(weight: 2, name: "abs", numSets: 2), getMockedExcercise(weight: 200, name: "Bench Press", numSets: 5)]
    let time = Date()
    return Workout(workoutID: workoutID, userID: userID, excerciseLst: excerciseLst, time: time)
}

func getMockedSampleFeedPost() -> FeedPost {
    let userID = "userID"
    let workoutID = getMockedSampleWorkout()
    let description = "Dropped the bar on my kneck xD"
    let postID = "postId"
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    let time = Date() //TO DO: edit to constant
    return FeedPost(postID: postID, workout: workoutID, userID: userID, pictures: [UIImage.init(named: "BenPic")!], pictureID: nil, title: "this is a title", description: description, time: time)
}

func getMockedProfile() -> Profile {
    return Profile(userID: "userID", name: "name", age: 100, photo: UIImage.init(named: "BenPic"))
}
