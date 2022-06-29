//
//  Search.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import Foundation
import SwiftUI

struct APIResults: Codable {
    var Symbol: String
    var Name: String
    var AnalystTargetPrice: String
    var Sector: String
    }


class SearchApi: ObservableObject {
    @Published var firstfound = ""
    @Published var SecondFound = ""
    @Published var ThirdFound = ""
    @Published var Fourthfound = ""
    private var APIToken = "BDMFZ8CQ1SLEFGKE"
    
    func find(_ searchString: String){
        guard searchString != "" else{
            return
        }
    
        let AlphaVantageURL = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=\(searchString)&apikey=\(APIToken)"
        if let  urlString = AlphaVantageURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
           let url  = URL(string: urlString)
        {
            let task = URLSession.shared.dataTask(with: url){
                data, _,_ in
                DispatchQueue.main.async{
                    let jsonDecoder = JSONDecoder()
                    if let  validData = data, let result = try? jsonDecoder.decode(APIResults.self, from: validData){
                        if  result.Symbol.count > 0 {
                            self.firstfound = result.Symbol
                            self.SecondFound = result.Name
                            self.ThirdFound = result.AnalystTargetPrice
                            self.Fourthfound = result.Sector
                           
                         
                            
                        }else{
                            self.firstfound = " nothing found"
                        }
                    }else{
                        self.firstfound = " NO "
                    }
               }
            }
            task.resume()
        }
    }
}

class SearchHistory: ObservableObject {
    @Published var searchStrings: [String] = []
    var maxsearches: Int = 3
    var fileURL: URL
    
    init(){
        let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                         in: .userDomainMask).first!
        let archiveURL =
        documentDirectory.appendingPathComponent("Stocks")
            .appendingPathExtension("plist")
        fileURL = URL(string: "\(archiveURL)")!
        loadHistory()
    }
    func addSearchString(_ searchString: String){
        if searchStrings.count == maxsearches {
            searchStrings.remove(at: maxsearches - 1)
        }
        searchStrings.insert(searchString, at: 0)
        saveHistory()
        }
    func saveHistory(){
        let propertyListEncoder = PropertyListEncoder()
        if let encodedVolunteer = try? propertyListEncoder.encode(searchStrings){
            try? encodedVolunteer.write(to: fileURL,
                                        options: .noFileProtection)
        }
           
    }
    func loadHistory(){
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedVolunteer = try? Data(contentsOf: fileURL),
           let decodedVolunteer = try?
            propertyListDecoder.decode([String].self,
                                       from: retrievedVolunteer)
        {
            searchStrings = decodedVolunteer
        }
    }
}


