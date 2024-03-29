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
    // TODO: Make it so that the popover doesn't animate once done is pressed
    
    var parentViewController: LogWorkoutViewController // need this so we can use popover
    
    private let scrollView = ControlContainableScrollView()
    private let stackView = UIStackView()
    private var excerciseViewLst: [ExcerciseView] = []
    
    private let addExcerciseButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addExcerciseButtonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("+ Add Exercise", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    init(parentViewController: LogWorkoutViewController) {
        self.parentViewController = parentViewController
        
        super.init(frame: UIScreen.main.bounds)
        
        self.addSubview(self.scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        scrollView.alwaysBounceVertical = true
        scrollView.delaysContentTouches = false
        
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        contentView.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(addExcerciseButton)
        
        addExcerciseButton.translatesAutoresizingMaskIntoConstraints = false
        addExcerciseButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true

        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    
    required init?(coder aDecoder: NSCoder) {
        self.parentViewController = LogWorkoutViewController()
        super.init(coder: aDecoder)
    }
    
    @objc func addExcerciseButtonPressed(sender: UIButton!) {
        parentViewController.addExcercisePopupPicker(sender: sender)
    }
    
    func addNewExcerciseToScrollview(nameExcercise: String) {
        let excerciseView = ExcerciseView(excerciseName: nameExcercise)
        excerciseView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.insertArrangedSubview(excerciseView, at: excerciseViewLst.count)
        
        excerciseViewLst.append(excerciseView)
    }
    
    func getWorkoutStruct() -> Workout? {
        var excerciseLst: [Excercise] = []
        for excercise in excerciseViewLst {
            if let unwrapped = excercise.getExcerciseStruct() {
                excerciseLst.append(unwrapped)
            }
        }
        if excerciseLst.count > 0 {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let workout = Workout(workoutID: UUID.init().uuidString,
                                  userID: appDelegate.userID, // find way to do this that persists
                                  excerciseLst: excerciseLst,
                                  time: Date())
            return workout
        }
        return nil
    }
    
}
