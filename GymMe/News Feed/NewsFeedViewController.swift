//
//  NewsFeedViewController.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/18/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    let newsFeedView = NewsFeedView()
    private let refreshControl = UIRefreshControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "News Feed"
        
        self.view.addSubview(newsFeedView)
        newsFeedView.translatesAutoresizingMaskIntoConstraints = false
        
        newsFeedView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 3).isActive = true
        newsFeedView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -3).isActive = true
        newsFeedView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        newsFeedView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        self.refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        newsFeedView.scrollView.addSubview(refreshControl)
    }
    
    @objc func refresh(sender: AnyObject) {
        newsFeedView.addNewPost()
        print("refresh")
        self.refreshControl.endRefreshing()
        
        getWorkout(workoutID: "CA31E62E-6A5F-4558-B243-3A2A2173586D") { (workout) in
            print(workout)
        }

        getFeedPost(postID: "6C59B0B1-3927-490D-8E65-64DD4B764AA2") { (post) in
            print(post)
        }
    }

}
