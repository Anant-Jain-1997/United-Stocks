//
//  Watchlist.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//
//

import Foundation

struct StockProps: Identifiable {
    // Properties
    var id = UUID()
    var name: String
    var symbol: String
    var price: String
}

class Watchlist: ObservableObject {
    @Published var stocks: [StockProps] = []
    
    // Initializer (constructor)
    init() {
        stocks.append(StockProps(name: "Apple", symbol: "APPL", price: "$131.56"))
        stocks.append(StockProps(name: "Lucid Motors", symbol: "LCID", price: "$16.63"))
        stocks.append(StockProps(name: "Google", symbol: "GOOG", price: "$2,157.31"))
        stocks.append(StockProps(name: "Nvidia", symbol: "NVDA", price: "$158.80"))
    }
    
    // Methods   
    func deleteStock(index: IndexSet) { // Removes the stock from the watchlist
        stocks.remove(atOffsets: index)
    }
    
//    func addButton() { // Opens up the searchStock
//    }
    
//    func filterWatchlist() { // Filters the watchlist by low/high price
//    }
    
    func moveStock(offset: IndexSet, index: Int) { // Organizes the watchlist however the users wants
        stocks.move(fromOffsets: offset, toOffset: index)
    }
}
