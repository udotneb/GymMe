//
//  NewsFeedView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/24/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class FeedPostView: UIView {
    // TODO: Make the init take in a FeedPost struct and make the view based on that
    
    init(feedPost: FeedPost, workout: Workout, profile: Profile) {
        super.init(frame: UIScreen.main.bounds)
        let nameDatePicHeaderView = NameDatePicHeaderView(profilePicture: feedPost.pictures![0], profileName: profile.name, date: workout.time)
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
        titleDescriptionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
//    override init(frame: CGRect) {
//        super.init(frame:frame)
//
//        self.addSubview(nameDatePicHeaderView)
//        nameDatePicHeaderView.translatesAutoresizingMaskIntoConstraints = false
//        nameDatePicHeaderView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        nameDatePicHeaderView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        nameDatePicHeaderView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        nameDatePicHeaderView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//        self.addSubview(titleDescriptionView)
//        titleDescriptionView.translatesAutoresizingMaskIntoConstraints = false
//        titleDescriptionView.topAnchor.constraint(equalTo: nameDatePicHeaderView.bottomAnchor, constant: 10).isActive = true
//        titleDescriptionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        titleDescriptionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        titleDescriptionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
