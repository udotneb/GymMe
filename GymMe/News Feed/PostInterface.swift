//
//  PostInterface.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/18/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import Foundation

struct Post {
    let postID: UUID
    let workoutID: UUID
    let userID: UUID
    let picturePaths: [String] // TODO: find actual way to do this
    let caption: String
    let time: Date
}
