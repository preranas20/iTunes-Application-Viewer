//
//  App.swift
//  InClass03
//
//  Created by Prerana Singh on 10/30/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//

/* Assignment - InClass03
 Name - Prerana Singh
 File -SelectedApp.swift
 */


import Foundation

class SelectedApp{
    var title:String=""
    var developer:String=""
    var imgSmallUrl:String=""
    var imgLargeUrl:String=""
    var price:String=""
    var releaseDate:String = ""
    
    
    init(title:String,developer:String,imgSmallUrl:String,imgLargeUrl:String,price:String,releaseDate:String){
        self.title=title
        self.developer=developer
        self.imgSmallUrl=imgSmallUrl
        self.imgLargeUrl=imgLargeUrl
        self.price=price
        self.releaseDate = releaseDate
    }
    
    init(){}
    
    var description:String{
        return "\(title),\(developer),\(imgSmallUrl),\(imgLargeUrl),\(price)"
    }
}
