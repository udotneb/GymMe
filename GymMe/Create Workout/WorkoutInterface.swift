//
//  WorkoutInterface.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/18/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import Foundation

struct Workout {
    let workoutID: String
    let userID: String
    let excerciseLst: [Excercise]
    let time: Date
}

struct Excercise {
    let lstSets: [ExcerciseSet]
    let excerciseName: String // TODO: Change this to an enum so we can have pictures/videos of excercises
}

struct ExcerciseSet {
    let reps: Int
    let weight: Int
}
