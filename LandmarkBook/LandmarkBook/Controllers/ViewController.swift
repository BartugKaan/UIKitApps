//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Bartuğ Kaan Çelebi on 27.04.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var landmark = [
        Landmark(name: "Colosseum", image: .init(named: "colosseum")!, country: "Rome"),
        Landmark(name: "Great Wall", image: .init(named: "greatWall")!, country: "China"),
        Landmark(name: "Kremlin", image: .init(named: "kremlin")!, country: "Russia"),
        Landmark(name: "Stonhenge", image: .init(named: "stonehenge")!, country: "England"),
        Landmark(name: "Taj Mahal", image: .init(named: "tajMahal")!, country: "India"),
        Landmark(name: "Galata Tower", image: .init(named: "galataKulesi")!,country: "Turkey")
    ]
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    var chosenLandmarkCountry = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmark.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmark[indexPath.row].name
        content.secondaryText = landmark[indexPath.row].country
        content.image = landmark[indexPath.row].image
        content.imageProperties.maximumSize.width = 70
        content.imageProperties.maximumSize.height = 70
        content.imageProperties.cornerRadius = 10
        cell.contentConfiguration = content
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmark[indexPath.row].name
        chosenLandmarkImage = landmark[indexPath.row].image
        chosenLandmarkCountry = landmark[indexPath.row].country
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            destinationVC.selectedLandmarkCountry = chosenLandmarkCountry
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.landmark.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

}

