//
//  ProfileView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/26/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    let profileImage: UIImageView = {
        let image = UIImageView(image: UIImage.init(named:"BenPic")!)
        return image
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Benjmain Ulrich"
        label.textAlignment = .center
        return label
    }()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
