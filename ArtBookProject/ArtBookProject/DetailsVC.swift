//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Bartuğ Kaan Çelebi on 1.05.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var artistText: UITextField!
    
    @IBOutlet weak var yearText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyborad))
        view.addGestureRecognizer(gestureRecognizer)
    }
   
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        print("Test")
    }
    
    @objc func hideKeyborad(){
        view.endEditing(true)
    }
}
