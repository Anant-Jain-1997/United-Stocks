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
}

class SearchApi: ObservableObject {
    @Published var firstfound = ""
    @Published var SecondFound = ""
    @Published var ThirdFound = ""

    private var APIToken = "BDMFZ8CQ1SLEFGKE"

    func find(_ searchTerm: String) {
        guard searchTerm != "" else {
            return
        }

        let AlphaVantageURL = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=\(searchTerm)&apikey=\(APIToken)"
        if let urlString = AlphaVantageURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
           let url = URL(string: urlString)
        {
            let task = URLSession.shared.dataTask(with: url) {
                data, _, _ in
                DispatchQueue.main.async {
                    let jsonDecoder = JSONDecoder()
                    if let validData = data, let result = try? jsonDecoder.decode(APIResults.self, from: validData) {
                        if result.Symbol.count > 0 {
                            self.firstfound = result.Symbol
                            self.SecondFound = result.Name
                            self.ThirdFound = result.AnalystTargetPrice

                        } else {
                            self.firstfound = " nothing found"
                        }
                    } else {
                        self.firstfound = " NO "
                    }
                }
            }
            task.resume()
        }
    }
}
