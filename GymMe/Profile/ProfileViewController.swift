//
//  ProfileViewController.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/18/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // View controllers are for data manipulation, pushing new screens, interacting with database models
    // NOT FOR MAKING UI
    
    let profileView: UIView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Profile"
        
        self.view.addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        profileView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        profileView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        
        
    }
    
    
    
}
