//
//  ViewController.swift
//  tip-calculator
//
//  Created by Harjas Monga on 10/11/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var firstTipResultLabel: UILabel!
    @IBOutlet weak var secondTipResultLabel: UILabel!
    @IBOutlet weak var thirdTipResultLabel: UILabel!
    @IBOutlet weak var firstTipLabel: UILabel!
    @IBOutlet weak var secondTipLabel: UILabel!
    @IBOutlet weak var thirdTipLabel: UILabel!
    @IBOutlet weak var mainWrapperView: UIView!
    
    var tipPercentages = [0.1, 0.15, 0.2]
    
    var billAmount: Double = 0 {
        didSet {
            updateTipCalculations()
        }
    }
    
    let settings: StateManager
    
    required init?(coder aDecoder: NSCoder) {
        settings = StateManager()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTipResultLabel.adjustsFontSizeToFitWidth = true
        secondTipResultLabel.adjustsFontSizeToFitWidth = true
        thirdTipResultLabel.adjustsFontSizeToFitWidth = true
        billTextField.adjustsFontSizeToFitWidth = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billTextField.becomeFirstResponder()
        tipPercentages = settings.getPercentages()
        billAmount = settings.getBillAmount()
        billTextField.text = "\(billAmount)"
        updateTipLabels()
        billTextField.placeholder = "\(currencySymbol())0.00"
    }
    
    func currencySymbol() -> String {
        return Locale.current.currencySymbol ?? "$"
    }
    
    func updateTipLabels() {
        updateTipLabel(label: firstTipLabel, percentage: tipPercentages[0])
        updateTipLabel(label: secondTipLabel, percentage: tipPercentages[1])
        updateTipLabel(label: thirdTipLabel, percentage: tipPercentages[2])
    }
    
    func updateTipLabel(label: UILabel, percentage: Double) {
        label.text = "\(percentage * 100)%:"
    }
    
    @IBAction func billInputFieldUpdated(_ sender: UITextField) {
        let newBillAmount = Double(sender.text ?? "") ?? 0
        billAmount = newBillAmount
        settings.setBillAmount(billAmount)
    }
    
    func updateTipCalculations() {
        setTip(label: firstTipResultLabel, amount: calculateTip(index: 0))
        setTip(label: secondTipResultLabel, amount: calculateTip(index: 1))
        setTip(label: thirdTipResultLabel, amount: calculateTip(index: 2))
    }
    
    func setTip(label: UILabel, amount: Double) {
        label.text = String(format: "\(currencySymbol())%.2f", amount)
    }
    
    func calculateTip(index: Int) -> Double {
        return billAmount * (1 + tipPercentages[index])
    }
    
}

