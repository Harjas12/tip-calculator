//
//  StateManager.swift
//  tip-calculator
//
//  Created by Harjas Monga on 10/11/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import Foundation

class StateManager {
    
    private static let settings = UserDefaults.standard
    private static let percentagesKey = "percentages"
    private static let defaultPercentages = [0.1, 0.15, 0.2]
    private static let billKey = "bill"
    
    func updatePercentages(_ percentages: [Double]) {
        StateManager.settings.set(percentages, forKey: StateManager.percentagesKey)
    }
    
    func getPercentages() -> [Double] {
        return (StateManager.settings.array(forKey: StateManager.percentagesKey) as? [Double]) ?? StateManager.defaultPercentages
    }
    
    func setBillAmount(_ amount: Double) {
        StateManager.settings.set(amount, forKey: StateManager.billKey)
    }
    
    func getBillAmount() -> Double {
        return StateManager.settings.double(forKey: StateManager.billKey)
    }
    
}
