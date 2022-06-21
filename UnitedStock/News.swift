//
//  News.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import Foundation
import SwiftUI


struct viewNews: Identifiable {
    
    var uuid_ID: UUID {return UUID ()}
    
    var newsTitle: String
    
    var newsURL: String
    
    var newsURLToImage: String?
    
    var desc: String
    
}

struct responseNews{
    var articles: [viewNews]
}

class retrieveData: ObservableObject{
    
    @Published var newsData = [viewNews]()
    
    init(){
        
        let source = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY"
        
        let url = URL(String: url )
    }
    
}
