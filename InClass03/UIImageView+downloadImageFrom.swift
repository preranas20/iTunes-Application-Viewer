//
//  UIImageView+downloadImageFrom.swift
//  InClass03
//
//  Created by Prerana Singh on 10/30/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//
/* Assignment - InClass03
 Name - Prerana Singh
 File -UIImageView+downloadImage.swift
 */


import Foundation
import UIKit



extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIView.ContentMode) {
        URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
}

/*extension UIImageView {
    func downloadImageFrom(link: String) {
        URLSession.shared.dataTask(with: URL(string: link)!) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                self.image = UIImage(data: data)
            }
            }.resume()
    }
}
*/
