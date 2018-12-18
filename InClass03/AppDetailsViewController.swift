//
//  AppDetailsViewController.swift
//  InClass03
//
//  Created by Prerana Singh on 10/30/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//

/* Assignment - InClass03
 Name - Prerana Singh
 File -AppDetailsViewController.swift
 */

import UIKit

class AppDetailsViewController: UIViewController {

    var targetApp:SelectedApp?
   
    @IBOutlet var appTitle: UILabel!
    
    @IBOutlet var appDeveloper: UILabel!
    @IBOutlet var appImage: UIImageView!
    @IBOutlet var appReleaseDate: UILabel!
    @IBOutlet var appPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       // print(targetApp!.description)
        appTitle.text = targetApp!.title
        appDeveloper.text = targetApp!.developer
        appPrice.text = targetApp!.price
        //print(targetApp!.releaseDate)
        let dateString = targetApp!.releaseDate
        let dateFormatter = DateFormatter()
        let inputDate = dateString
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ" //iso 8601
        
        let outputDate = dateFormatter.date(from: inputDate)
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        // again convert your date to string
        let myStringafd = formatter.string(from: outputDate!)
        
        appReleaseDate.text = myStringafd
        
        appImage.downloadImageFrom(link: targetApp!.imgLargeUrl, contentMode: UIView.ContentMode.scaleAspectFit)
       // imgViewSmall.downloadImageFrom(link:appImgSmall, contentMode: UIView.ContentMode.scaleAspectFit)
        // Do any additional setup after loading the view.
    }
    

    
     @IBAction func btnClose(_ sender: Any) {
        if((self.presentingViewController) != nil){
            self.dismiss(animated: false, completion: nil)
        }
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
