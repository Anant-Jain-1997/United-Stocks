//
//  News.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import Foundation
import SwiftUI


struct viewNews{
    
    var uuid_ID : UUID {return UUID ()}
    
    var newsTitle : String
    
    var newsURL : String
    
    var newsURLToImage : String?
    
    
}

struct responseNews{
    var articles: [viewNews]
}

struct newsAPI{
    // enter your api key between " "
    //let apiKEY : "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY"
}
