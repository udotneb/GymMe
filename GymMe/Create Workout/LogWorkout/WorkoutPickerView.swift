//
//  WorkoutPickerView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/23/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class WorkoutPickerView: UIPickerView {
    let workoutList = ["Ab Crunches", "Bench Press", "Military Press", "Squat"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return workoutList.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return workoutList[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int){
        self.endEditing(true)
    }
}
