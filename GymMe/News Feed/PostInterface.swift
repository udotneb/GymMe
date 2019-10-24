//
//  PostInterface.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/18/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

struct FeedPost {
    let postID: UUID
    let workoutID: UUID
    let userID: UUID
    let pictures: [UIImage]?
    let title: String
    let description: String
    let time: NSDate
}
