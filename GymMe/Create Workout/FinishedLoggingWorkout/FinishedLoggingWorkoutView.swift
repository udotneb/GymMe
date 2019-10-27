//
//  FinishedWorkoutView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/19/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import GrowingTextView

class FinishedLoggingWorkoutView: UIView {
    // TODO: add description box
    
    let titleInput: UITextField = {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = "Title of your workout"
        textField.title = "Title"
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description:"
        label.textColor = .blue
        return label
    }()
    
    let descriptionInput: UITextView = {
        let textView = GrowingTextView()
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        textView.minHeight = 28.0
        textView.maxHeight = 70.0
        textView.layer.cornerRadius = 4.0
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor
        textView.addDoneButtonOnKeyboard()
        return textView
    }()
    
    private let numberImagesSelectedLabel: UILabel = {
        let label = UILabel()
        label.text = "Number images selected: 0"
        label.textColor = .black
        return label
    }()
    
    
    private let imagePickButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 50)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(imagePickPressed), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private let postWorkoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Post Workout", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(postWorkout), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.addSubview(titleInput)
        titleInput.translatesAutoresizingMaskIntoConstraints = false
        titleInput.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleInput.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        titleInput.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        titleInput.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        
        self.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleInput.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        
        self.addSubview(descriptionInput)
        descriptionInput.translatesAutoresizingMaskIntoConstraints = false
        descriptionInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        descriptionInput.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        descriptionInput.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true

        self.addSubview(numberImagesSelectedLabel)
        numberImagesSelectedLabel.translatesAutoresizingMaskIntoConstraints = false
        numberImagesSelectedLabel.topAnchor.constraint(equalTo: descriptionInput.bottomAnchor, constant: 10).isActive = true
        numberImagesSelectedLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        numberImagesSelectedLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        numberImagesSelectedLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        
        
        self.addSubview(imagePickButton)
        imagePickButton.translatesAutoresizingMaskIntoConstraints = false
        imagePickButton.topAnchor.constraint(equalTo: numberImagesSelectedLabel.bottomAnchor, constant: 10).isActive = true
        imagePickButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imagePickButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        imagePickButton.widthAnchor.constraint(equalTo: imagePickButton.heightAnchor).isActive = true
        
        self.addSubview(postWorkoutButton)
        postWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        //TODO: Fix these constraints so that postWorkoutButton doesnt ever conflict with imagePickButton
        postWorkoutButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        postWorkoutButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        postWorkoutButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        postWorkoutButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc private func imagePickPressed(sender: UIButton!) {
        NotificationCenter.default.post(name: NSNotification.Name("image pick button pressed"), object: nil)
    }
    
    @objc private func postWorkout(sender: UIButton!) {
        // TODO: Check titleInput.text is not nil, if it is tell the user to fix it
        NotificationCenter.default.post(name: NSNotification.Name("post workout button pressed"), object: nil)
    }
    
    func changeNumberImages(numImages: Int) {
        numberImagesSelectedLabel.text = "Number images selected: \(numImages)"
    }
}
