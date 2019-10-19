//
//  WorkoutInterface.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/18/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import Foundation

struct Workout {
    let excerciseLst: [Excercise]
    let userID: UUID
    let workoutID: UUID
    let time: Date
}

struct Excercise {
    let lstSets: [ExcerciseSet]
    let excerciseType: Int // Enum
}

struct ExcerciseSet {
    let reps: Int
    let weight: Int
}
