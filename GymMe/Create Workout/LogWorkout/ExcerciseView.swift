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
    
    // sizing constants
    private let excerciseNameLabelHeight = 25
    private let excerciseSetNamesViewHeight = 25
    private let excerciseSetViewHeight = 40
    private let addSetButtonHeight = 40
    
    // view components
    private let excerciseSetNamesView = ExcerciseSetNamesView()
    private var excerciseSetViewLst: [ExcercseSetView] = [ExcercseSetView(setNumber: 1)]
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
    private let excerciseNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        return label
    }()
    
    private var constraintLst: [NSLayoutConstraint] = [] // for updateAnchors
    
    init(excerciseName: String) {
        self.excerciseName = excerciseName
        super.init(frame: UIScreen.main.bounds)
        
        excerciseNameLabel.text = self.excerciseName
        updateAnchors()
    }
    
    private func updateAnchors() {
        // Removes all constraints, then re adds them, also updates this views heightAnchor
        // Use: Adding and removing excercise sets requires breaking constraints and then readding them in another order
        
        // deactivate all constraints
        for constraint in constraintLst {
            constraint.isActive = false
        }
        
        constraintLst = []
        
        // add all new constraints to constraintLst
        if !excerciseNameLabel.isDescendant(of: self) {
            self.addSubview(excerciseNameLabel)
        }
        excerciseNameLabel.translatesAutoresizingMaskIntoConstraints = false
        constraintLst.append(excerciseNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor))
        constraintLst.append(excerciseNameLabel.topAnchor.constraint(equalTo: self.topAnchor))
        constraintLst.append(excerciseNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor))
        constraintLst.append(excerciseNameLabel.heightAnchor.constraint(equalToConstant: CGFloat(excerciseNameLabelHeight)))
        
        if !excerciseSetNamesView.isDescendant(of: self) {
            self.addSubview(excerciseSetNamesView)
        }
        excerciseSetNamesView.translatesAutoresizingMaskIntoConstraints = false
        constraintLst.append(excerciseSetNamesView.topAnchor.constraint(equalTo: excerciseNameLabel.bottomAnchor, constant: 10))
        constraintLst.append(excerciseSetNamesView.leftAnchor.constraint(equalTo: self.leftAnchor))
        constraintLst.append(excerciseSetNamesView.rightAnchor.constraint(equalTo: self.rightAnchor))
        constraintLst.append(excerciseSetNamesView.heightAnchor.constraint(equalToConstant: CGFloat(excerciseSetNamesViewHeight)))

        for i in 0..<excerciseSetViewLst.count {
            let workoutSet = excerciseSetViewLst[i]
            workoutSet.translatesAutoresizingMaskIntoConstraints = false
            
            if !workoutSet.isDescendant(of: self) {
                self.addSubview(workoutSet)
            }
            if i == 0 { // set to excerciseSetNamesView
                constraintLst.append(workoutSet.topAnchor.constraint(equalTo: excerciseSetNamesView.bottomAnchor))
            } else { // set to previous excerciseSetView
                constraintLst.append(workoutSet.topAnchor.constraint(equalTo: excerciseSetViewLst[i-1].bottomAnchor, constant:5))
            }
            
            constraintLst.append(workoutSet.leftAnchor.constraint(equalTo: self.leftAnchor))
            constraintLst.append(workoutSet.rightAnchor.constraint(equalTo: self.rightAnchor))
            constraintLst.append(workoutSet.heightAnchor.constraint(equalToConstant: CGFloat(excerciseSetViewHeight)))
        }
        
        if !addSetButton.isDescendant(of: self) {
            self.addSubview(addSetButton)
        }
        addSetButton.translatesAutoresizingMaskIntoConstraints = false
        constraintLst.append(addSetButton.topAnchor.constraint(equalTo: excerciseSetViewLst[excerciseSetViewLst.count - 1].bottomAnchor, constant: 10))
        constraintLst.append(addSetButton.leftAnchor.constraint(equalTo: self.leftAnchor))
        constraintLst.append(addSetButton.rightAnchor.constraint(equalTo: self.rightAnchor))
        constraintLst.append(addSetButton.heightAnchor.constraint(equalToConstant: CGFloat(addSetButtonHeight)))
        
        // add new height constraint
        let newHeight = excerciseNameLabelHeight + excerciseSetNamesViewHeight + excerciseSetViewLst.count * (excerciseSetViewHeight + 5) + addSetButtonHeight + 20
        constraintLst.append(self.heightAnchor.constraint(equalToConstant: CGFloat(newHeight)))
        
        // activate all constraints
        for constraint in constraintLst {
            constraint.isActive = true
        }
    }
    
    @objc private func addSetButtonPressed(sender: UIButton!) {
        addNewSet()
    }
    
    private func addNewSet() {
        // adds a new ExcerciseSetView to the UI, copys over the previous weight and reps
        // excerciseSetViewLst must always be atleast length one
        let previousWeight = excerciseSetViewLst[excerciseSetViewLst.count - 1].getWeight()
        let previousReps = excerciseSetViewLst[excerciseSetViewLst.count - 1].getReps()
        
        let newWorkoutSet = ExcercseSetView(setNumber: excerciseSetViewLst.count + 1,
                                           previousWeight: previousWeight,
                                           previousReps: previousReps)
        excerciseSetViewLst.append(newWorkoutSet)
        updateAnchors()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.excerciseName = ""
        super.init(coder: aDecoder)
    }
    
    func getExcerciseStruct() -> Excercise? {
        var lstSets: [ExcerciseSet] = []
        for w in excerciseSetViewLst {
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
