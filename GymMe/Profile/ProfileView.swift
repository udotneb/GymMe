//
//  ProfileView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/26/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    var profilePic: UIImageView {
        let imageView = UIImageView()
        return imageView
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    init(profile: Profile, maxWeightPushedInDay: Int) {
        super.init(frame: UIScreen.main.bounds)
        
        let profileImage = UIImageView()

        if let profilePhoto = profile.photo {
            profilePic.image = profilePhoto
        } else {
            profilePic.image = UIImage.init(named: "LoadingImage")
        }
        
        self.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        print("profile view loaded")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
