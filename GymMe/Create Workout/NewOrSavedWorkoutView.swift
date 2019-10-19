//
//  NewOrSavedWorkoutView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/18/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class NewOrSavedWorkoutView: UIView {
    
    private var newWorkoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("New", for: .normal)
        button.addTarget(self, action: #selector(newWorkoutPressed), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(newWorkoutButton)
        newWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        newWorkoutButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        newWorkoutButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant:5).isActive = true
        newWorkoutButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant:-5).isActive = true
        newWorkoutButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    @objc func newWorkoutPressed(sender: UIButton!) {
//        NotificationCenter.default.post(name: NSNotification.Name("buttonPressed"), object: nil)
        print("new workout pressed")
    }
}
