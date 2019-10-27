//
//  PostWorkout.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/25/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit
import Firebase

func postWorkout(workout: Workout) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let userID = workout.userID
    let workoutID = workout.workoutID
    let time = workout.time.asString(dateFormat: "MM/dd/yyyy HH:mm")
    appDelegate.databaseRef.child("Workouts").child(workoutID).setValue(["userID": userID, "time": time])
    
    for excercise in workout.excerciseLst {
        let excerciseName = excercise.excerciseName
        var weightRepsLst : [[Int]] = []
        for excerciseSet in excercise.lstSets {
            weightRepsLst.append(marshalExcerciseSet(excerciseSet: excerciseSet))
        }
        appDelegate.databaseRef.child("Workouts").child(workoutID).child("Excercises").setValue([excerciseName: weightRepsLst])
    }
}



func getWorkout(workoutID: String, completion: @escaping (Workout?) -> () ) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    appDelegate.databaseRef.child("Workouts").child(workoutID).observeSingleEvent(of: .value, with: { (snapshot) in
        // Get user value
        guard let value = snapshot.value as? NSDictionary else {
            print("can't convert value to dictionary")
            completion(nil)
            return
        }
        
        let workout = idDictionaryToWorkout(value: value, workoutID: workoutID)
        completion(workout)
        
    }) { (error) in
        print(error.localizedDescription)
        completion(nil)
    }
}



func getAllWorkouts(completion: @escaping ([Workout]?) -> () ) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    appDelegate.databaseRef.child("Workouts").observeSingleEvent(of: .value, with: { (snapshot) in
        guard let workoutIDDict = snapshot.value as? NSDictionary else {
            print("can't convert value to dictionary")
            completion(nil)
            return
        }
        
        var allWorkouts: [Workout] = []
        for (workoutID,_) in workoutIDDict {
            guard let value = workoutIDDict[workoutID] as? NSDictionary else {
                print("can't convert value to dictionary")
                completion(nil)
                return
            }
            if let workout = idDictionaryToWorkout(value:value, workoutID: workoutID as! String) {
                allWorkouts.append(workout)
            }
        }
        completion(allWorkouts)
    }) { (error) in
        print(error.localizedDescription)
        completion(nil)
    }
    
}
private func idDictionaryToWorkout(value: NSDictionary, workoutID: String) -> Workout? {

    
    guard let time = value["time"] as? String else {
        print("cant get time")
        return nil
    }
    
    guard let userID = value["userID"] as? String else {
        print("cant get user ID")
        return nil
    }
    
    guard let excercises = value["Excercises"] as? NSDictionary else {
        print("cant get excercises")
        return nil
    }
    
    var excerciseLst: [Excercise] = []
    for excercise in excercises {
        guard let excerciseName = excercise.key as? String else {
            print("excercise name cant be forced to string")
            return nil
        }
        var excerciseSetLst: [ExcerciseSet] = []
        
        guard let lstRepsWeight = excercise.value as? [[Int]] else {
            print("cant convert excercise.key")
            return nil
        }
        
        for excerciseSet in lstRepsWeight {
            excerciseSetLst.append(unmarshalExcerciseSet(tupInt: excerciseSet))
        }
        excerciseLst.append(Excercise(lstSets: excerciseSetLst, excerciseName: excerciseName))
    }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
    guard let dateTime = dateFormatter.date(from: time) else {
        print("time can't be converted")
        return nil
    }
    
    return Workout(workoutID: workoutID, userID: userID, excerciseLst: excerciseLst, time: dateTime)
}

private func marshalExcerciseSet(excerciseSet: ExcerciseSet) -> [Int] {
    return [excerciseSet.weight, excerciseSet.reps]
}

private func unmarshalExcerciseSet(tupInt : [Int]) -> ExcerciseSet {
    return ExcerciseSet(reps: tupInt[1], weight: tupInt[0])
}

