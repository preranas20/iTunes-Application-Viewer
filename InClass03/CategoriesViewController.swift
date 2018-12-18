//
//  CategoriesViewController.swift
//  InClass03
//
//  Created by Prerana Singh on 10/26/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//
/* Assignment - InClass03
 Name - Prerana Singh
 File -CategoriesViewController.swift
 */


import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var categories = Array(AppsData.data.keys)
    var item = ""
    var selectedCategory = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()

        
      
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CellCategories", for: indexPath)
        
        item = categories[indexPath.row]
       // print(item)
        let label = cell.viewWithTag(100) as! UILabel
        label.text = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        //print(selectedCategory)
        self.performSegue(withIdentifier: "CategoriesToAppsSegue", sender: indexPath);

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategoriesToAppsSegue"{
            let categoryVC = segue.destination as! AppsViewController
            categoryVC.category = selectedCategory
        }
          
         
    }

  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
