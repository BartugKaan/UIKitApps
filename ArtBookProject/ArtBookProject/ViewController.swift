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
    var selectedPainting = ""
    var selectedPaintingId : UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "newData"), object: nil)
    }

    @objc func addButtonClicked(){
        selectedPainting = ""
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
    
    @objc func getData(){
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetcRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fetcRequest.returnsObjectsAsFaults = false
        
        do{
           let results =  try context.fetch(fetcRequest)
            
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    if let name =  result.value(forKey: "name") as? String{
                        self.nameArray.append(name)
                    }
                    if let id = result.value(forKey: "id") as? UUID{
                        self.idArray.append(id)
                    }
                    self.tableview.reloadData()
                }
            }
        } catch{
            print("Error")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.chosenPainting = selectedPainting
            destinationVC.chosenPaintingId = selectedPaintingId
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPainting = nameArray[indexPath.row]
        selectedPaintingId = idArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetcRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            let idString = idArray[indexPath.row].uuidString
            fetcRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetcRequest.returnsObjectsAsFaults = false
            do{
                let results = try context.fetch(fetcRequest)
                
                if results.count > 0{
                    
                    for result in results as! [NSManagedObject]{
                        
                        if let id = result.value(forKey: "id") as? UUID{
                            if id == idArray[indexPath.row]{
                                context.delete(result)
                                nameArray.remove(at: indexPath.row)
                                idArray.remove(at: indexPath.row)
                                self.tableview.reloadData()
                                do{
                                    try context.save()
                                }
                                catch{
                                    print("Error")
                                }
                                break
                            }
                        }
                    }
                }
            }
            catch{
                print("Error")
            }
            
            
            
        }
    }

}

