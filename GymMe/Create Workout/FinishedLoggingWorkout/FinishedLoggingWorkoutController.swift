//
//  FinishedLoggingWorkoutController.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/19/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//
import UIKit
import ImagePicker

class FinishedLoggingWorkoutController: UIViewController, ImagePickerDelegate {
    var finishedWorkout: Workout? // instantiated from previous view controller
    
    private var images: [UIImage]?
    private var finishedLoggingView: FinishedLoggingWorkoutView = {
        return FinishedLoggingWorkoutView()
    }()
    
    init(finishedWorkout: Workout?) {
        self.finishedWorkout = finishedWorkout
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(finishedLoggingView)
        finishedLoggingView.translatesAutoresizingMaskIntoConstraints = false
        finishedLoggingView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        finishedLoggingView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        finishedLoggingView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        finishedLoggingView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(imagePickButtonPressed), name: NSNotification.Name("image pick button pressed"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(postWorkoutButtonPressed), name: NSNotification.Name("post workout button pressed"), object: nil)
        
    }
    
    @objc func imagePickButtonPressed(sender: UIButton!) {
        let config = Configuration()
        config.doneButtonTitle = "Finish"
        config.noImagesTitle = "Sorry! There are no images here!"
        config.recordLocation = false
        config.allowVideoSelection = true
        
        let imagePicker = ImagePickerController(configuration: config)
        imagePicker.delegate = self
        imagePicker.imageLimit = 3
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @objc func postWorkoutButtonPressed(sender: UIButton!) {
        guard let workout = finishedWorkout else {
            return
        }
        
        guard let title = finishedLoggingView.titleInput.text else {
            return
        }
        
        let userID = workout.userID
        let workoutID = workout.workoutID
        let description = "" // TODO: Add this later
        let postID = UUID.init()
        let time = NSDate()
        let post = Post(postID: postID,
                        workoutID: workoutID,
                        userID: userID,
                        pictures: self.images,
                        title: title,
                        description: description,
                        time: time)
        // TODO: save workout and post here
        print(post)
        print(workout)
    }
    
    // MARK: - ImagePickerDelegate
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        print("did press")
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        finishedLoggingView.changeNumberImages(numImages: images.count)
        self.images = images
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
