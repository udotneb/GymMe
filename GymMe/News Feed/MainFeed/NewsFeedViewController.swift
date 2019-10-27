//
//  NewsFeedViewController.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/18/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    private let refreshControl = UIRefreshControl()
    private var postIDSet = Set<String>()
    private var newsFeedView: NewsFeedView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "News Feed"
        
        self.newsFeedView = NewsFeedView(parentViewController: self)
        
        guard let newsFeedView = self.newsFeedView else { // because self.newsFeedView is optional
            return
        }
        
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
        print("refresh")
        getAllPosts() { posts in
            if let postLst = posts {
                let profileSample : Profile = getMockedProfile()
                let sortedPosts = self.sortPostsByTime(postLst: postLst)
                for post in sortedPosts {
                    print(self.postIDSet.count)
                    
                    if !self.postIDSet.contains(post.postID) {
                        self.newsFeedView?.addNewPost(feedPost: post, profile: profileSample)
                    }
                    
                    self.postIDSet.insert(post.postID)
                }
            }
            self.refreshControl.endRefreshing()
        }
    }
    
    private func sortPostsByTime(postLst: [FeedPost]) -> [FeedPost] {
        // sorts so that the most recent is last
        return postLst.sorted(by: { $0.time < $1.time })
    }
    
    func loadImageIntoView(pictureIDs: [String], imageView: UIImageView) {
        let pictureID = pictureIDs[0]
        downloadImage(pictureID: pictureID, imageView: imageView) { bool in
            // print(bool)
        }
    }
}
