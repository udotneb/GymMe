//
//  WorkoutPreviewView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/26/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class WorkoutPreviewView: UIView {
    
    private let openWorkoutPreview: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(openWorkoutPreviewPressed), for: .touchUpInside)
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    init(workout: Workout) {
        super.init(frame: UIScreen.main.bounds)
        
        var totalWeight = 0
        for excercise in workout.excerciseLst {
            for set in excercise.lstSets {
                totalWeight += set.reps * set.weight
            }
        }
        openWorkoutPreview.setTitle("Total Weight Pushed: \(totalWeight) lbs", for: .normal)
        
        self.addSubview(openWorkoutPreview)
        openWorkoutPreview.translatesAutoresizingMaskIntoConstraints = false
        openWorkoutPreview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        openWorkoutPreview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        openWorkoutPreview.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        openWorkoutPreview.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func openWorkoutPreviewPressed(sender: UIButton!) {
        print("pressed")
    }
}
