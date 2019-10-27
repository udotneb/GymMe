//
//  TitleDescriptionView.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/24/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit

class TitleDescriptionView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = -1
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
    }()
    
    private let descLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = -1
        return label
    }()

    init(title: String, description: String?) {
        super.init(frame: UIScreen.main.bounds)
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        if let descriptionUnwrapped = description {
            self.addSubview(descLabel)
            descLabel.translatesAutoresizingMaskIntoConstraints = false
            
            descLabel.text = descriptionUnwrapped
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
            descLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            descLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            descLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        } else {
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
