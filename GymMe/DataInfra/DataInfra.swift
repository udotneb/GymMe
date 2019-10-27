//
//  DataInfraSettings.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/26/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import Foundation

let databaseDateFormat: String = "yyyy/MM/dd HH:mm:ss"

func convertDateToString(date: Date) -> String {
    return date.asString(dateFormat: databaseDateFormat)
}

func convertStringToDate(date: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = databaseDateFormat
    if let dateTime = dateFormatter.date(from: date) {
        return dateTime
    }
    return nil
}
