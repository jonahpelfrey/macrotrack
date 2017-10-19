//
//  ViewController.swift
//  tracker
//
//  Created by Jonah Pelfrey on 10/11/17.
//  Copyright © 2017 Jonah Pelfrey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //CLASS
    var proteinGoal: Int = 0
    var calorieGoal: Int = 0
    var carbGoal: Int = 0
    
    var nutrientItems = [UITextField: UILabel]()
    
    //OUTLETS
    @IBOutlet weak var popupCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var gramsOfProtein: UILabel!
    @IBOutlet weak var proteinProgressBar: UIProgressView!
    @IBOutlet weak var proteinTextField: UITextField!
    
    @IBOutlet weak var numberOfCalories: UILabel!
    @IBOutlet weak var calorieProgressBar: UIProgressView!
     @IBOutlet weak var caloriesTextField: UITextField!
    
    @IBOutlet weak var numberOfCarbs: UILabel!
    @IBOutlet weak var carbProgressBar: UIProgressView!
    @IBOutlet weak var carbsTextField: UITextField!
    
    @IBOutlet weak var numberOfFats: UILabel!
    @IBOutlet weak var fatProgressBar: UIProgressView!
    @IBOutlet weak var fatTextField: UITextField!
    
    @IBOutlet weak var numberOfSugars: UILabel!
    @IBOutlet weak var sugarProgressBar: UIProgressView!
    @IBOutlet weak var sugarTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupProgressBars()
        
        nutrientItems[proteinTextField] = gramsOfProtein
        nutrientItems[carbsTextField] = numberOfCarbs
        nutrientItems[sugarTextField] = numberOfSugars
        nutrientItems[fatTextField] = numberOfFats
        nutrientItems[caloriesTextField] = numberOfCalories
    }
    
    
    //FUNCTIONS
    
    func populateLabel(textField: UITextField, label: UILabel)
    {
        guard let tfText = textField.text,
                let nutrient = Int(tfText),
                let labelText = label.text,
                let oldNutrient = Int(labelText) else { return }
        
        label.text = "\(nutrient + oldNutrient)"
        textField.text = ""
    }
    
    @IBAction func addNutrients(_ sender: Any) {
        
        for (textField, label) in nutrientItems {
            populateLabel(textField: textField, label: label)
        }
        animateOut()
    }
    
    @IBAction func addNewEntry(_ sender: Any) {
        self.popupCenterConstraint.constant = 0;
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func animateOut() {
        
        self.popupCenterConstraint.constant = -400
        
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func setupProgressBars() {
        
        //Check user defaults
        //self.proteinProgressBar.animate(duration: 10)
        
        //else
        self.proteinProgressBar.progress = 0
        self.carbProgressBar.progress = 0
        self.calorieProgressBar.progress = 0
        self.fatProgressBar.progress = 0
        self.sugarProgressBar.progress = 0
        
    }
    

}

extension UIProgressView {
    
    func animate(duration: Double) {
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            self.setProgress(1.0, animated: true)
        }, completion: nil)
    }
}




