//
//  ProfileView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/26/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    private var profileImage: UIImageView =  {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        return label
    }()
    
    private let totalWeightPushedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    init(profile: Profile) {
        super.init(frame: UIScreen.main.bounds)
        
        let profileImage = UIImageView()

        if let profilePhoto = profile.photo {
            profileImage.image = profilePhoto
        } else {
            profileImage.image = UIImage.init(named: "LoadingImage")
        }
        
        self.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameLabel.text = profile.name

        
        self.addSubview(totalWeightPushedLabel)
        totalWeightPushedLabel.translatesAutoresizingMaskIntoConstraints = false
        totalWeightPushedLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        totalWeightPushedLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        totalWeightPushedLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        let stackView = UIStackView()
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: totalWeightPushedLabel.bottomAnchor, constant: 10).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.axis = .vertical
        
        getUserWorkouts(userID: profile.userID) {
            postLst in
            if let unwrappedPostLst = postLst {
                if !unwrappedPostLst.isEmpty{
                    self.totalWeightPushedLabel.text = "\(totalWeightsPushed(workOutLst: unwrappedPostLst)) total pounds pushed!"
                    for (workoutName, weight) in personalRecordsDict(workOutLst: unwrappedPostLst) {
                        let label = UILabel()
                        label.text = "\(weight) lbs    \(workoutName) max"
                        label.textAlignment = .center
                        label.font = UIFont.boldSystemFont(ofSize: 25)
                        stackView.addArrangedSubview(label)
                    }
                } else {
                    print("Empty")
                }
            } else {
                print("Nil")
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
