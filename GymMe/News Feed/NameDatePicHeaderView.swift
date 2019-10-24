//
//  NameDatePicHeaderView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/24/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class NameDatePicHeaderView: UIView {
    private var profilePictureView: UIImageView = {
        return UIImageView()
    }()
    
    private var profileNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        return label
    }()
    
    
    init(profilePicture: UIImage, profileName: String, date: Date) {
        super.init(frame: UIScreen.main.bounds)
        profilePictureView.image = profilePicture
        profileNameLabel.text = profileName
        dateLabel.text = date.asString(dateFormat: "MM/dd/yyyy HH:mm")
        
        self.addSubview(profilePictureView)
        profilePictureView.translatesAutoresizingMaskIntoConstraints = false
        profilePictureView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        profilePictureView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        profilePictureView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        profilePictureView.widthAnchor.constraint(equalTo: profilePictureView.heightAnchor).isActive = true
        
        self.addSubview(profileNameLabel)
        self.addSubview(dateLabel)
        
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileNameLabel.leftAnchor.constraint(equalTo: profilePictureView.rightAnchor, constant: 15).isActive = true
        profileNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        profileNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.leftAnchor.constraint(equalTo: profilePictureView.rightAnchor, constant: 15).isActive = true
        dateLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        dateLabel.heightAnchor.constraint(equalTo: profileNameLabel.heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
