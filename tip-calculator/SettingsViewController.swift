//
//  SettingsViewController.swift
//  tip-calculator
//
//  Created by Harjas Monga on 10/11/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var firstPercentageValueField: UITextField!
    @IBOutlet weak var secondPercentageValueField: UITextField!
    @IBOutlet weak var thirdPercentageValueField: UITextField!
    
    let settingsManager: StateManager
    
    required init?(coder aDecoder: NSCoder) {
        settingsManager = StateManager()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPercentageValueField.becomeFirstResponder()
        loadPercentages()
    }
    
    func loadPercentages() {
        let savedPercentages = settingsManager.getPercentages()
        updatePercentage(field: firstPercentageValueField, percentage: savedPercentages[0])
        updatePercentage(field: secondPercentageValueField, percentage: savedPercentages[1])
        updatePercentage(field: thirdPercentageValueField, percentage: savedPercentages[2])
    }
    
    func updatePercentage(field: UITextField, percentage: Double) {
        field.text = "\(percentage * 100)"
    }
    
    func getPercentage(field: UITextField) -> Double {
        return (Double(field.text ?? "") ?? 0)/100
    }
    
    func savePercentages() {
        let percentages = [getPercentage(field: firstPercentageValueField), getPercentage(field: secondPercentageValueField), getPercentage(field: thirdPercentageValueField)]
        settingsManager.updatePercentages(percentages)
    }
    @IBAction func percentagesChanged(_ sender: Any) {
        savePercentages()
    }
    
}
