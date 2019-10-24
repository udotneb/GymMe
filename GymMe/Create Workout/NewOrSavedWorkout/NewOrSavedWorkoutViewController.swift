//
//  ViewController.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/18/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class NewOrSavedWorkoutViewController: UIViewController {
    let newOrSaved: UIView = {
        return NewOrSavedWorkoutView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Log Workout"
        self.view.addSubview(newOrSaved)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        newOrSaved.translatesAutoresizingMaskIntoConstraints = false
        newOrSaved.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        newOrSaved.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        newOrSaved.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        newOrSaved.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(newWorkoutPressed), name: NSNotification.Name("new workout button pressed"), object: nil)
    }

    @objc private func newWorkoutPressed() {
        print("new workout")
        navigationController?.pushViewController(LogWorkoutViewController(), animated: true)
    }
    
}

