//
//  SavedWorkoutView.swift
//  GymMe
//
//  Created by Rachel Lou on 10/26/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//This class concatenates buttons. To create a saved button, we get information from the viewcontroller from database, which holds information on saved workouts. TODO also add a preview of workouts


import Foundation
import UIKit

class SavedWorkoutView: UIView {
    // TODO: concatenate saved workouts under each other. I want the saved workouts to be scrollable

  
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
    private let savedWorkoutButton1: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(testTarget), for: .touchUpInside)
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.setTitle("KILL BILLS", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private let savedWorkoutButton2: UIButton = {
        let button = UIButton()
        /*button.addTarget(self, action: #selector(savedWorkoutPressed), for: .touchUpInside)*/
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Eggs and Ham", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    //start scrolling format
      let scrollView = ControlContainableScrollView()
      private let stackView = UIStackView()
    
      init() {
          super.init(frame: UIScreen.main.bounds)

          self.addSubview(self.scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true

        scrollView.alwaysBounceVertical = true // so that even when there aren't enough posts you can scroll
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
        stackView.spacing = 10
        
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        stackView.addArrangedSubview(savedWorkoutButton1)
        
    }
    
    func addNewSavedWorkout() {
        stackView.insertArrangedSubview(savedWorkoutButton2, at: 0)
    }
    //end scrolling format

    @objc private func testTarget(sender: UIButton!) {
          print("test buttonpressed")
    }

}

