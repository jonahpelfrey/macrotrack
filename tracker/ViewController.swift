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
    
    var textFields = [UITextField]()
    
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
    }
    
    
    //FUNCTIONS
    @IBAction func addNutrients(_ sender: Any) {
        
        if let pr = proteinTextField.text, !pr.isEmpty {
            let newProtein = Int(pr)
            if let oldProtein = Int(gramsOfProtein.text!) {
                let protein = newProtein! + oldProtein
                gramsOfProtein.text = "\(protein)"
            }
        }
        
        if let cal = caloriesTextField.text, !cal.isEmpty {
            let newCalories = Int(cal)
            if let oldCalories = Int(numberOfCalories.text!) {
                let calories = newCalories! + oldCalories
                numberOfCalories.text = "\(calories)"
            }
        }
        
        if let carb = carbsTextField.text, !carb.isEmpty {
            let newCarbs = Int(carb)
            if let oldCarbs = Int(numberOfCarbs.text!) {
                let carbs = newCarbs! + oldCarbs
                numberOfCarbs.text = "\(carbs)"
            }
        }
        
        if let sugar = sugarTextField.text, !sugar.isEmpty {
            let newSugar = Int(sugar)
            if let oldSugar = Int(numberOfSugars.text!) {
                let sugars = newSugar! + oldSugar
                numberOfSugars.text = "\(sugars)"
            }
        }
        
        if let fat = fatTextField.text, !fat.isEmpty {
            let newFat = Int(fat)
            if let oldFat = Int(numberOfFats.text!) {
                let fats = newFat! + oldFat
                numberOfFats.text = "\(fats)"
            }
        }
        animateOut()
        clearFields()
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
    
    func clearFields() {
        proteinTextField.text = ""
        caloriesTextField.text = ""
        sugarTextField.text = ""
        fatTextField.text = ""
        carbsTextField.text = ""
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




