//
//  WorkoutSetNamesView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/22/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

private func getLabel(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    return label
}

class ExcerciseSetNamesView: UIView {
    private let setLabel = getLabel(text: "Set")
    private let spacer1: UIView = UIView()
    private let poundsLabel: UILabel = getLabel(text: "lbs")
    private let spacer2: UIView = UIView()
    private let repsLabel: UILabel = getLabel(text: "Reps")
    
    override init(frame: CGRect) {
        super.init(frame:frame)
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
        
        self.addSubview(poundsLabel)
        poundsLabel.translatesAutoresizingMaskIntoConstraints = false
        poundsLabel.leftAnchor.constraint(equalTo: spacer1.rightAnchor).isActive = true
        poundsLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        poundsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        poundsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        
        self.addSubview(spacer2)
        spacer2.translatesAutoresizingMaskIntoConstraints = false
        spacer2.leftAnchor.constraint(equalTo: poundsLabel.rightAnchor).isActive = true
        spacer2.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        spacer2.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        spacer2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.15).isActive = true
        
        self.addSubview(repsLabel)
        repsLabel.translatesAutoresizingMaskIntoConstraints = false
        repsLabel.leftAnchor.constraint(equalTo: spacer2.rightAnchor).isActive = true
        repsLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        repsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        repsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
