//
//  NewsFeedView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/24/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class FeedPostView: UIView {
    private let nameDatePicHeaderView = NameDatePicHeaderView(profilePicture: UIImage(named: "BenPic")!, profileName: "Ben Ulrich", date: Date())
    private let titleDescriptionView = TitleDescriptionView(title: "LEG DAYYYYYY",
                                                            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure ")
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.addSubview(nameDatePicHeaderView)
        nameDatePicHeaderView.translatesAutoresizingMaskIntoConstraints = false
        nameDatePicHeaderView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameDatePicHeaderView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameDatePicHeaderView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameDatePicHeaderView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        
        self.addSubview(titleDescriptionView)
        titleDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        titleDescriptionView.topAnchor.constraint(equalTo: nameDatePicHeaderView.bottomAnchor, constant: 10).isActive = true
        titleDescriptionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleDescriptionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        titleDescriptionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
