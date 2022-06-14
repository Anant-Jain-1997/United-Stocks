//
//  Search.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import Foundation
class SearchApi{
    //url used to get data from api
    let urlString = "https://stockexchangeapi.p.rapidapi.com/price"
    //data from the api search that is given
    struct APIdata: Codable{
        
        let company : String
        let high : String
        let low: String
        let price : String
        let symbol: String
        let symbolName: String
    }
    // function to get the stock info from api
    func FetchStock(){
        guard let url = URL(string: urlString) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _ , error  in
            guard let data = data, error == nil else{
                return
            }
            do{
                let apiResult = try JSONDecoder().decode(APIdata.self, from: data)
                //self?.company = apiResult.company
                
            }
            catch{
                print(error)
                
            }
        }
        task.resume()
        
    
}
}
