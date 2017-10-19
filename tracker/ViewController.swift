//
//  ViewController.swift
//  tracker
//
//  Created by Jonah Pelfrey on 10/11/17.
//  Copyright © 2017 Jonah Pelfrey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var nutrientItems = [Nutrient]()

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
        
        self.proteinProgressBar.progress = 0
        self.carbProgressBar.progress = 0
        self.calorieProgressBar.progress = 0
        self.fatProgressBar.progress = 0
        self.sugarProgressBar.progress = 0
        
        createNutrients()
        loadUserData()
    }
    
    
    func createNutrients()
    {
        let protein = Nutrient(textField: proteinTextField, label: gramsOfProtein, progressBar: proteinProgressBar, targetLevel: 160, key: "protein")
        
        let carbs = Nutrient(textField: carbsTextField, label: numberOfCarbs, progressBar: carbProgressBar, targetLevel: 100, key: "carbs")
        
        let calories = Nutrient(textField: caloriesTextField, label: numberOfCalories, progressBar: calorieProgressBar, targetLevel: 3000, key: "calories")
        
        let fats = Nutrient(textField: fatTextField, label: numberOfFats, progressBar: fatProgressBar, targetLevel: 50, key: "fats")
        
        let sugars = Nutrient(textField: sugarTextField, label: numberOfSugars, progressBar: sugarProgressBar, targetLevel: 75, key: "sugars")
        
        self.nutrientItems += [protein, carbs, calories, fats, sugars]
    }
    
    func loadUserData()
    {
        for item in nutrientItems {
            item.loadSavedProgress()
        }
    }
    
    @IBAction func addNutrients(_ sender: Any) {
        
        
        for item in nutrientItems {
            item.populateLabel()
            item.updateProgressBar()
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
    
}





