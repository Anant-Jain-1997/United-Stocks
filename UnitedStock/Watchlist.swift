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
    var stockName: String
    var symbol: String
    var description: String
    var price: String
}

class Watchlist: ObservableObject {
    @Published var stocks: [StockProps] = []
    
    // Initializer (constructor)
    init() {
        stocks.append(StockProps(stockName: "Apple", symbol: "APPL", description: "Tech stock", price: "$131.56"))
        stocks.append(StockProps(stockName: "Lucid Motors", symbol: "LCID", description: "EV stock", price: "$16.63"))
        stocks.append(StockProps(stockName: "Google", symbol: "GOOG", description: "Tech stock", price: "$2,157.31"))
        stocks.append(StockProps(stockName: "Nvidia", symbol: "NVDA", description: "Tech stock", price: "$158.80"))
    }
    
    // Methods
    func addStock() {
        stocks.append(StockProps(stockName: "Boeing", symbol: "BA", description: "Aerospace company", price: "$141.53"))
    }
    
    func deleteStock(index: IndexSet) { // Removes the stock from the watchlist
        stocks.remove(atOffsets: index)
    }
    
    func addButton() { // Opens up the searchStock
            
    }
    
    func filterWatchlist() { // Filters the watchlist by low/high price
    }
    
    func moveStock(offset: IndexSet, index: Int) { // Organizes the watchlist however the users wants
        stocks.move(fromOffsets: offset, toOffset: index)
    }
}
