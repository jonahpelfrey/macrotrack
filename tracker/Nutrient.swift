//
//  File.swift
//  tracker
//
//  Created by Jonah Pelfrey on 10/19/17.
//  Copyright © 2017 Jonah Pelfrey. All rights reserved.
//

import Foundation
import UIKit

class Nutrient{
    
    var textField: UITextField
    var label: UILabel
    var progressBar: UIProgressView
    var targetLevel: Int
    var currentLevel: Int
    let key: String
    
    init(textField: UITextField, label: UILabel, progressBar: UIProgressView, targetLevel: Int, key: String)
    {
        self.textField = textField
        self.label = label
        self.progressBar = progressBar
        self.targetLevel = targetLevel
        self.currentLevel = 0;
        self.key = key
    }
    
    func populateLabel()
    {
        guard let tfText = self.textField.text,
            let nutrient = Int(tfText),
            let labelText = self.label.text,
            let oldNutrient = Int(labelText) else { return }
        
        self.currentLevel = nutrient + oldNutrient
        self.label.text = "\(self.currentLevel)"
        self.textField.text = ""
        UserDefaults.standard.set(self.currentLevel, forKey: self.key)
    }
    
    func loadSavedProgress()
    {
        if let savedProgress = UserDefaults.standard.object(forKey: self.key) as? Int {
            self.currentLevel = savedProgress
            self.label.text = "\(self.currentLevel)"
            updateProgressBar()
        }
    }
    
    func updateProgressBar()
    {
        let newProgress = Float(self.currentLevel) / Float(self.targetLevel)
        self.progressBar.animate(progress: newProgress)
    }
    
    func updateGoal(newGoal: Int)
    {
        self.targetLevel = newGoal
    }
}

extension UIProgressView {
    
    func animate(progress: Float) {
        
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveLinear, animations: {
            self.setProgress(progress, animated: true)
        }, completion: nil)
    }
}
