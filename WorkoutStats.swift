//
//  WorkoutStats.swift
//  GymMe
//
//  Created by Chuck Tang on 10/27/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import Foundation

func totalWeightsPushed(workOutLst: [Workout]) -> Int {
    var total:Int = 0
    for workOut in workOutLst {
        for exercise in workOut.excerciseLst {
            for exerciseSet in exercise.lstSets {
                total += exerciseSet.reps * exerciseSet.weight
            }
        }
    }
    return total
}

func personalRecordsDict(workOutLst: [Workout]) -> [String: Int] {
    var personalRecords:[String: Int] = [:]
    for workOut in workOutLst {
        for exercise in workOut.excerciseLst {
            var total:Int = 0
            for exerciseSet in exercise.lstSets {
                total += exerciseSet.reps * exerciseSet.weight
            }
            if let x = personalRecords[exercise.excerciseName] {
                personalRecords[exercise.excerciseName] = max(x, total)
            } else {
                personalRecords[exercise.excerciseName] = total
            }
        }
    }
    return personalRecords
}
