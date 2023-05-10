//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Bartuğ Kaan Çelebi on 10.05.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var finalResult = "0.0"
    var billTotal = 0.0
    var numberOfPeope = 2
    var tip = 0.10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        tip = 0.0
        let billValue = Double(billTextField.text!)
        let splitNumberValue = Double(splitNumberLabel.text!)

        if tenPctButton.isSelected{
            tip = 0.1
        }
        else if twentyPctButton.isSelected{
            tip = 0.2
        }
        let totalBill = (billValue! * tip) + billValue!
        let result = String(format: "%.2f", totalBill / splitNumberValue!)
        finalResult = result
        numberOfPeope = Int(splitNumberValue!)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeope
        }
    }
    
}
