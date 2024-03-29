//
//  LogexcerciseViewController.swift
//  GymMe
//
//  Created by Benjamin Ulrich on 10/22/19.
//  Copyright © 2019 Benjamin Ulrich. All rights reserved.
//

import UIKit
import McPicker

class LogWorkoutViewController: UIViewController {
    var logWorkoutView: LogWorkoutView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Finish", style: .done, target: self, action: #selector(finishButtonPressed))
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        logWorkoutView = LogWorkoutView(parentViewController: self)
        
        self.view.addSubview(logWorkoutView!)
        logWorkoutView!.translatesAutoresizingMaskIntoConstraints = false
        logWorkoutView!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        logWorkoutView!.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        logWorkoutView!.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        logWorkoutView!.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @objc private func finishButtonPressed(sender: UIBarButtonItem!) {
        let finishedLoggingWorkoutController = FinishedLoggingWorkoutController(finishedWorkout: self.logWorkoutView?.getWorkoutStruct())
        self.navigationController?.pushViewController(finishedLoggingWorkoutController, animated: true)
    }
    
    func addExcercisePopupPicker(sender: UIButton!) {
        let data: [[String]] = [["Ab Crunches", "Bench Press", "Deadlift", "Squat"]]
        McPicker.showAsPopover(data: data, fromViewController: self, sourceView: sender) { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                self?.logWorkoutView?.addNewExcerciseToScrollview(nameExcercise: name)
            }
        }
        self.updateViewConstraints()
    }
}
