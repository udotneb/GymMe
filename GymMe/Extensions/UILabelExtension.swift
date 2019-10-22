//
//  UILabelExtension.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/19/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

extension UILabel {
    func setFontSizeToFill() {
        let frameSize  = self.bounds.size
        guard frameSize.height>0 && frameSize.width>0 && self.text != nil else {return}
        
        var fontPoints = self.font.pointSize
        var fontSize   = self.text!.size(withAttributes: [NSAttributedString.Key.font: self.font.withSize(fontPoints)])
        var increment  = CGFloat(0)
        
        if fontSize.width > frameSize.width || fontSize.height > frameSize.height {
            increment = -1
        } else {
            increment = 1
        }
        
        while true {
            fontSize = self.text!.size(withAttributes: [NSAttributedString.Key.font: self.font.withSize(fontPoints+increment)])
            if increment < 0 {
                if fontSize.width < frameSize.width && fontSize.height < frameSize.height {
                    fontPoints += increment
                    break
                }
            } else {
                if fontSize.width > frameSize.width || fontSize.height > frameSize.height {
                    break
                }
            }
            fontPoints += increment
        }
        
        self.font = self.font.withSize(fontPoints)
    }
}
