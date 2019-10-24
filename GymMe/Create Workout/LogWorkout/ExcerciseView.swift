//
//  ExcerciseView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/22/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class ExcerciseView: UIView {
    private var excerciseName: String
    
    private let excerciseNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        return label
    }()
    
    private let workoutSetNamesView = ExcerciseSetNamesView()
    private var workoutSetViewLst: [ExcercseSetView] = [ExcercseSetView(setNumber: 1)]
    private var c: [NSLayoutConstraint] = []
    
    private let addSetButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addSetButtonPressed), for: .touchUpInside)
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.setTitle("+ Add Set", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    init(excerciseName: String) {
        self.excerciseName = excerciseName
        super.init(frame: UIScreen.main.bounds)
        
        excerciseNameLabel.text = self.excerciseName
        updateAnchors()
    }
    
    private func updateAnchors() {
        for constraint in c {
            constraint.isActive = false
        }
        c = []
        
        if !excerciseNameLabel.isDescendant(of: self) {
            self.addSubview(excerciseNameLabel)
        }
        excerciseNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        c.append(excerciseNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor))
        c.append(excerciseNameLabel.topAnchor.constraint(equalTo: self.topAnchor))
        c.append(excerciseNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor))
        c.append(excerciseNameLabel.heightAnchor.constraint(equalToConstant: 25))
        
        if !workoutSetNamesView.isDescendant(of: self) {
            self.addSubview(workoutSetNamesView)
        }
        workoutSetNamesView.translatesAutoresizingMaskIntoConstraints = false
        
        c.append(workoutSetNamesView.topAnchor.constraint(equalTo: excerciseNameLabel.bottomAnchor, constant: 10))
        c.append(workoutSetNamesView.leftAnchor.constraint(equalTo: self.leftAnchor))
        c.append(workoutSetNamesView.rightAnchor.constraint(equalTo: self.rightAnchor))
        c.append(workoutSetNamesView.heightAnchor.constraint(equalToConstant: 25))

        for i in 0..<workoutSetViewLst.count {
            let workoutSet = workoutSetViewLst[i]
            workoutSet.translatesAutoresizingMaskIntoConstraints = false
            
            if !workoutSet.isDescendant(of: self) {
                self.addSubview(workoutSet)
            }
            
            if i == 0 {
                c.append(workoutSet.topAnchor.constraint(equalTo: workoutSetNamesView.bottomAnchor))
            } else {
                c.append(workoutSet.topAnchor.constraint(equalTo: workoutSetViewLst[i-1].bottomAnchor, constant:5))
            }
            
            c.append(workoutSet.leftAnchor.constraint(equalTo: self.leftAnchor))
            c.append(workoutSet.rightAnchor.constraint(equalTo: self.rightAnchor))
            c.append(workoutSet.heightAnchor.constraint(equalToConstant: 40))
        }
        
        if !addSetButton.isDescendant(of: self) {
            self.addSubview(addSetButton)
        }
        addSetButton.translatesAutoresizingMaskIntoConstraints = false
        
        c.append(addSetButton.topAnchor.constraint(equalTo: workoutSetViewLst[workoutSetViewLst.count - 1].bottomAnchor, constant: 10))
        c.append(addSetButton.leftAnchor.constraint(equalTo: self.leftAnchor))
        c.append(addSetButton.rightAnchor.constraint(equalTo: self.rightAnchor))
        c.append(addSetButton.heightAnchor.constraint(equalToConstant: 40))
        for constraint in c {
            constraint.isActive = true
        }

    }
    
    @objc private func addSetButtonPressed(sender: UIButton!) {
        addNewSet()
        print("add set pressed")
    }
    
    private func addNewSet() {
        // adds a new set, weight, reps row to the UI, copying over the previous weight and reps
        // workoutSetViewLst must always be atleast length one
        let previousWeight = workoutSetViewLst[workoutSetViewLst.count - 1].getWeight()
        let previousReps = workoutSetViewLst[workoutSetViewLst.count - 1].getReps()
        
        let newWorkoutSet = ExcercseSetView(setNumber: workoutSetViewLst.count + 1,
                                           previousWeight: previousWeight,
                                           previousReps: previousReps)
        workoutSetViewLst.append(newWorkoutSet)
        updateAnchors()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.excerciseName = ""
        super.init(coder: aDecoder)
    }
    
    func getExcerciseStruct() -> Excercise? {
        var lstSets: [ExcerciseSet] = []
        for w in workoutSetViewLst {
            if let excerciseSet = w.getExcerciseSetStruct() {
                lstSets.append(excerciseSet)
            }
        }
        if lstSets.count > 0 {
            return Excercise(lstSets: lstSets,
                             excerciseName: self.excerciseName)
        }
        return nil
    }
}
