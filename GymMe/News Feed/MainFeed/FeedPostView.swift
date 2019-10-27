//
//  NewsFeedView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/24/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class FeedPostView: UIView {
    // TODO: Allow for showing multiple pictures
    
    private var parentViewController: NewsFeedViewController?
    
    init(feedPost: FeedPost, workout: Workout, profile: Profile, parentViewController: NewsFeedViewController) {
        self.parentViewController = parentViewController
        
        super.init(frame: UIScreen.main.bounds)
        let nameDatePicHeaderView = NameDatePicHeaderView(profilePicture: profile.photo!, profileName: profile.name, date: feedPost.time)
        self.addSubview(nameDatePicHeaderView)
        nameDatePicHeaderView.translatesAutoresizingMaskIntoConstraints = false
        nameDatePicHeaderView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameDatePicHeaderView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameDatePicHeaderView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameDatePicHeaderView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let titleDescriptionView = TitleDescriptionView(title: feedPost.title,
                                                        description: feedPost.description)
        
        self.addSubview(titleDescriptionView)
        titleDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        titleDescriptionView.topAnchor.constraint(equalTo: nameDatePicHeaderView.bottomAnchor, constant: 10).isActive = true
        titleDescriptionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleDescriptionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        let workoutPreview = WorkoutPreviewView(workout: workout)
        self.addSubview(workoutPreview)
        workoutPreview.translatesAutoresizingMaskIntoConstraints = false
        workoutPreview.topAnchor.constraint(equalTo: titleDescriptionView.bottomAnchor, constant: 10).isActive = true
        workoutPreview.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        workoutPreview.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        if let images = feedPost.pictures {
            let imageView = UIImageView(image: images[0])
            self.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.topAnchor.constraint(equalTo: workoutPreview.bottomAnchor, constant: 10).isActive = true
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
            
        } else {
            if let pictureIDs = feedPost.pictureID {
                let imageView = UIImageView(image: UIImage(named: "LoadingImage"))
                self.addSubview(imageView)
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.topAnchor.constraint(equalTo: workoutPreview.bottomAnchor, constant: 10).isActive = true
                imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
                imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
                imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true

                self.parentViewController!.loadImageIntoView(pictureIDs: pictureIDs, imageView: imageView)
            }
            else {
                workoutPreview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.parentViewController = nil
        fatalError("init(coder:) has not been implemented")
    }
}
