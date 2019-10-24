//
//  WorkoutSetView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/22/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

private let grayBoxColor = UIColor(red:0.85, green:0.88, blue:0.89, alpha:1.0)

private func digitTextField() -> UITextField {
    let textField = UITextField()
    textField.textAlignment = .center
    textField.keyboardType = .asciiCapableNumberPad
    textField.layer.borderWidth = 0.5
    textField.layer.borderColor = UIColor.black.cgColor
    textField.layer.cornerRadius = 5
    textField.backgroundColor = grayBoxColor
    textField.addDoneButtonOnKeyboard()
    return textField
}

class ExcercseSetView: UIView {
    private let setLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "1"
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 5
        label.backgroundColor = grayBoxColor
        return label
    }()
    
    private let spacer1: UIView = UIView()
    private let weightTextInput: UITextField = digitTextField()
    private let spacer2: UIView = UIView()
    private let repsTextInput: UITextField = digitTextField()
    
    init(setNumber: Int, previousWeight: String? = nil, previousReps: String? = nil) {
        super.init(frame: UIScreen.main.bounds)

        setLabel.text = String(setNumber)
        if let weight = previousWeight {
            weightTextInput.text = weight
        }
        if let reps = previousReps {
            repsTextInput.text = reps
        }
        
        self.addSubview(setLabel)
        setLabel.translatesAutoresizingMaskIntoConstraints = false
        setLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        setLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        setLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        setLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
        
        self.addSubview(spacer1)
        spacer1.translatesAutoresizingMaskIntoConstraints = false
        spacer1.leftAnchor.constraint(equalTo: setLabel.rightAnchor).isActive = true
        spacer1.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        spacer1.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        spacer1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.15).isActive = true
        
        self.addSubview(weightTextInput)
        weightTextInput.translatesAutoresizingMaskIntoConstraints = false
        weightTextInput.leftAnchor.constraint(equalTo: spacer1.rightAnchor).isActive = true
        weightTextInput.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        weightTextInput.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        weightTextInput.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        
        self.addSubview(spacer2)
        spacer2.translatesAutoresizingMaskIntoConstraints = false
        spacer2.leftAnchor.constraint(equalTo: weightTextInput.rightAnchor).isActive = true
        spacer2.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        spacer2.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        spacer2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.15).isActive = true
        
        self.addSubview(repsTextInput)
        repsTextInput.translatesAutoresizingMaskIntoConstraints = false
        repsTextInput.leftAnchor.constraint(equalTo: spacer2.rightAnchor).isActive = true
        repsTextInput.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        repsTextInput.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        repsTextInput.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func getWeight() -> String? {
        return weightTextInput.text
    }
    
    func getReps() -> String? {
        return repsTextInput.text
    }
}
