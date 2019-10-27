//
//  NewOrSavedWorkoutView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/18/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class NewOrSavedWorkoutView: UIView {
    // TODO: ADD UISCROLLVIEW TO KEEP SAVED WORKOUTS
    
    private let newWorkoutButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(newWorkoutPressed), for: .touchUpInside)
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.setTitle("+ New Workout", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private let savedWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved Workouts"
        label.textColor = .black
        return label
    }()
    
    private let horizontalBlackLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let savedWorkoutView: UIView = {
          return SavedWorkoutView()
    }()
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(newWorkoutButton)
        newWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        newWorkoutButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        newWorkoutButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        newWorkoutButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        newWorkoutButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        
        self.addSubview(savedWorkoutLabel)
        savedWorkoutLabel.translatesAutoresizingMaskIntoConstraints = false
        savedWorkoutLabel.topAnchor.constraint(equalTo: newWorkoutButton.bottomAnchor, constant: 10).isActive = true
        savedWorkoutLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        savedWorkoutLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        savedWorkoutLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true
        
        self.addSubview(horizontalBlackLine)
        horizontalBlackLine.translatesAutoresizingMaskIntoConstraints = false
        horizontalBlackLine.topAnchor.constraint(equalTo: savedWorkoutLabel.bottomAnchor, constant: 2).isActive = true
        horizontalBlackLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        horizontalBlackLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        horizontalBlackLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(savedWorkoutView)
        savedWorkoutView.translatesAutoresizingMaskIntoConstraints = false
        savedWorkoutView.topAnchor.constraint(equalTo: horizontalBlackLine.bottomAnchor, constant: 10).isActive = true
        savedWorkoutView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        savedWorkoutView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        savedWorkoutView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    @objc private func newWorkoutPressed(sender: UIButton!) {
        NotificationCenter.default.post(name: NSNotification.Name("new workout button pressed"), object: nil)
    }
    

    
}
