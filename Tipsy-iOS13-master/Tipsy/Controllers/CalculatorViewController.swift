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
    @IBOutlet weak var tenPctValue: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
    
}
