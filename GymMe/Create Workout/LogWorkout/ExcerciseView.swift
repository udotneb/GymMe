//
//  ExcerciseView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/22/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class ExcerciseView: UIView {
    private let excerciseNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        return label
    }()
    
    private let workoutSetNames = ExcerciseSetNamesView()
    private var workoutSets: [ExcercseSetView] = [ExcercseSetView(setNumber: 1)]
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
        super.init(frame: UIScreen.main.bounds)
        excerciseNameLabel.text = excerciseName
        
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
        
        if !workoutSetNames.isDescendant(of: self) {
            self.addSubview(workoutSetNames)
        }
        workoutSetNames.translatesAutoresizingMaskIntoConstraints = false
        
        c.append(workoutSetNames.topAnchor.constraint(equalTo: excerciseNameLabel.bottomAnchor, constant: 10))
        c.append(workoutSetNames.leftAnchor.constraint(equalTo: self.leftAnchor))
        c.append(workoutSetNames.rightAnchor.constraint(equalTo: self.rightAnchor))
        c.append(workoutSetNames.heightAnchor.constraint(equalToConstant: 25))

        for i in 0..<workoutSets.count {
            let workoutSet = workoutSets[i]
            workoutSet.translatesAutoresizingMaskIntoConstraints = false
            
            if !workoutSet.isDescendant(of: self) {
                self.addSubview(workoutSet)
            }
            
            if i == 0 {
                c.append(workoutSet.topAnchor.constraint(equalTo: workoutSetNames.bottomAnchor))
            } else {
                c.append(workoutSet.topAnchor.constraint(equalTo: workoutSets[i-1].bottomAnchor, constant:5))
            }
            
            c.append(workoutSet.leftAnchor.constraint(equalTo: self.leftAnchor))
            c.append(workoutSet.rightAnchor.constraint(equalTo: self.rightAnchor))
            c.append(workoutSet.heightAnchor.constraint(equalToConstant: 40))
        }
        
        if !addSetButton.isDescendant(of: self) {
            self.addSubview(addSetButton)
        }
        addSetButton.translatesAutoresizingMaskIntoConstraints = false
        
        c.append(addSetButton.topAnchor.constraint(equalTo: workoutSets[workoutSets.count - 1].bottomAnchor, constant: 10))
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
        // workoutSets must always be atleast length one
        let previousWeight = workoutSets[workoutSets.count - 1].getWeight()
        let previousReps = workoutSets[workoutSets.count - 1].getReps()
        
        let newWorkoutSet = ExcercseSetView(setNumber: workoutSets.count + 1,
                                           previousWeight: previousWeight,
                                           previousReps: previousReps)
        workoutSets.append(newWorkoutSet)
        updateAnchors()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
