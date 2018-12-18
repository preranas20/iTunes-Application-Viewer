//
//  AppsViewController.swift
//  InClass03
//
//  Created by Prerana Singh on 10/27/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//
/* Assignment - InClass03
 Name - Prerana Singh
 File -AppsViewController.swift
 */


import UIKit

class AppsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var category = ""
    var appsList: [(String,String,String,String,String,String)] = []
    var selectedApp:SelectedApp?
    
    @IBOutlet var tableView2: UITableView!
    var appTitle = ""
    var appDeveloper = ""
    var appImgSmall = ""
    var appImgLarge = ""
    var appPrice = ""
    var appReleaseDate = ""
    var selectedtitle = ""
    var selecteddeveloper = ""
    var selectedSmallUrl = ""
    var selectedLargeUrl = ""
    var selectedPrice = ""
    var selectedReleaseDate = ""
    var convertedDate:String!
    var targetDate:String!
    
    
    
    //08/10/2016 01:42:22 AM
    override func viewDidLoad() {
        super.viewDidLoad()
        appsList=AppsData.data[category].map{$0}!
        tableView2.tableFooterView = UIView()
        
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appsList.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier:"CellApps", for: indexPath)
    
     appTitle = appsList[indexPath.row].0
     let labelTitle = cell.viewWithTag(1) as! UILabel
     labelTitle.text = appTitle
     appDeveloper = appsList[indexPath.row].1
     let labelDeveloper = cell.viewWithTag(2) as! UILabel
     labelDeveloper.text = appDeveloper
     appImgSmall = appsList[indexPath.row].2
     let imgViewSmall = cell.viewWithTag(4) as! UIImageView
     imgViewSmall.downloadImageFrom(link:appImgSmall, contentMode: UIView.ContentMode.scaleAspectFit)
     appImgLarge = appsList[indexPath.row].3
     appReleaseDate = appsList[indexPath.row].4
     let labelReleaseDate = cell.viewWithTag(5) as! UILabel
     let dateFormatter = DateFormatter()
    let inputDate = appReleaseDate
     dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ" //iso 8601
    
    let outputDate = dateFormatter.date(from: inputDate)
     let formatter = DateFormatter()
     formatter.dateFormat = "MM-dd-yyyy"
    // again convert your date to string
    let dateString = formatter.string(from: outputDate!)
    
     labelReleaseDate.text = dateString
     appPrice = appsList[indexPath.row].5
     let labelPrice = cell.viewWithTag(3) as! UILabel
     labelPrice.text = appPrice

     return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       selectedtitle = appsList[indexPath.row].0
       selecteddeveloper = appsList[indexPath.row].1
       selectedSmallUrl = appsList[indexPath.row].2
       selectedLargeUrl = appsList[indexPath.row].3
       selectedReleaseDate = appsList[indexPath.row].4
       selectedPrice = appsList[indexPath.row].5
 
        self.performSegue(withIdentifier: "AppsToAppDetailSegue", sender: indexPath);
    }
    
   /* func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }*/
    

   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AppsToAppDetailSegue"{
     
            let appDetailsVC = segue.destination as! AppDetailsViewController
           
            selectedApp = SelectedApp(title: selectedtitle, developer: selecteddeveloper, imgSmallUrl: selectedSmallUrl, imgLargeUrl: selectedLargeUrl, price: selectedPrice, releaseDate: selectedReleaseDate)
           // print(selectedApp!.description)
            appDetailsVC.targetApp = selectedApp
        }
        //   ProfileVC.user = user
    }
    
   


}
