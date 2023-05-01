//
//  ViewController.swift
//  ArtBookProject
//
//  Created by Bartuğ Kaan Çelebi on 30.04.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableview: UITableView!
    var nameArray = [String]()
    var idArray = [UUID]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        getData()
    }

    @objc func addButtonClicked(){
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var context = cell.defaultContentConfiguration()
        
        context.text = nameArray[indexPath.row]
        
        cell.contentConfiguration = context
        return cell
    }
    
    func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetcRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fetcRequest.returnsObjectsAsFaults = false
        
        do{
           let results =  try context.fetch(fetcRequest)
            
            for result in results as! [NSManagedObject]{
                if let name =  result.value(forKey: "name") as? String{
                    self.nameArray.append(name)
                }
                if let id = result.value(forKey: "id") as? UUID{
                    self.idArray.append(id)
                }
                self.tableview.reloadData()
            }
            
        } catch{
            print("Error")
        }
        
    }

}

