//
//  LogWorkoutView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/22/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit
import McPicker

class LogWorkoutView: UIView {
    // TODO 1: Make the excercise views dynamically sized instead of constant
    // TODO 2: Make it so that the popover doesn't animate once done is pressed
    
    var parentViewController: LogWorkoutViewController // need this so we can use popover
    
    private let scrollView = ControlContainableScrollView()
    private let stackView = UIStackView()
    
    private let addExcerciseButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addExcerciseButtonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("+ Add Excercise", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private var numberOfViews = 0
    
    init(parentViewController: LogWorkoutViewController) {
        self.parentViewController = parentViewController
        
        super.init(frame: UIScreen.main.bounds)
        
        self.addSubview(self.scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    
        scrollView.delaysContentTouches = false
        
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(addExcerciseButton)
        
        addExcerciseButton.translatesAutoresizingMaskIntoConstraints = false
        addExcerciseButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true

        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    
    required init?(coder aDecoder: NSCoder) {
        self.parentViewController = LogWorkoutViewController()
        super.init(coder: aDecoder)
    }
    
    @objc func addExcerciseButtonPressed(sender: UIButton!) {
        parentViewController.addExcercisePopupPicker(sender: sender)
    }
    
    func addNewExcerciseToScrollview(nameExcercise: String) {
        let sampleExcerciseView = ExcerciseView(excerciseName: nameExcercise)
        sampleExcerciseView.translatesAutoresizingMaskIntoConstraints = false
        sampleExcerciseView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        stackView.insertArrangedSubview(sampleExcerciseView, at: numberOfViews)
        numberOfViews += 1
    }
    
    
    
}
