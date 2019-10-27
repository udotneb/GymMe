//
//  NewsFeedView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/24/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class NewsFeedView: UIView {
    let scrollView = ControlContainableScrollView()
    private let stackView = UIStackView()
    private var parentViewController: NewsFeedViewController?
    
    init(parentViewController: NewsFeedViewController) {
        self.parentViewController = parentViewController
        super.init(frame: UIScreen.main.bounds)

        self.addSubview(self.scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true

        scrollView.alwaysBounceVertical = true // so that even when there aren't enough posts you can scroll
        scrollView.delaysContentTouches = false

        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        contentView.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func addNewPost(feedPost:FeedPost) {
        stackView.insertArrangedSubview(FeedPostView(feedPost: feedPost, workout: feedPost.workout, profile: profileDict[feedPost.userID]!, parentViewController: parentViewController!), at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.parentViewController = nil
        fatalError("init(coder:) has not been implemented")
    }
}

