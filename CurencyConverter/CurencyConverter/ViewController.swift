//
//  ViewController.swift
//  CurencyConverter
//
//  Created by Bartuğ Kaan Çelebi on 2.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLAbel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLAbel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getRatesClicked(_ sender: UIButton) {
        
        // 1) Request & Session
        // 2) Response & Data
        // 3) Parsing & Jsnon serialization
        
        //1.
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        let session = URLSession.shared
        //Closures
        let task =  session.dataTask(with: url!) { (data, resposne, error) in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            }
            else{
                //2.
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(
                            with: data!,
                            options: JSONSerialization.ReadingOptions.mutableContainers)
                        DispatchQueue.main.async {
                            print(jsonResponse)
                        }
                        
                    } catch{
                        print("Error")
                    }
                    
                }
            }
        }
        task.resume()
    }
}

