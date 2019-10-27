//
//  PostInterface.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/18/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

struct FeedPost {
    let postID: String
    let workout: Workout
    let userID: String
    let pictures: [UIImage]?
    let pictureID: [String]?
    let title: String
    let description: String
    let time: Date
}
