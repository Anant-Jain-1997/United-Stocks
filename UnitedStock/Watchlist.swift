//
//  Watchlist.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//
//

import Foundation
import SwiftUI

struct WatchlistProps: Identifiable{
    //Properties
    var id = UUID()
    var stockName: String
    var symbol: String
    var description: String
    var price: String
}

class Watchlist: ObservableObject{
    @Published var stocks: [WatchlistProps] = []
    
    // Initializer (constructor)
    init(){
        stocks.append(WatchlistProps(stockName: "Apple", symbol: "APPL", description: "Tech stock", price: "$131.56"))
        stocks.append(WatchlistProps(stockName: "Lucid Motors", symbol: "LCID", description: "EV stock", price: "$16.63"))
        stocks.append(WatchlistProps(stockName: "Google", symbol: "GOOG", description: "Tech stock", price: "$2,157.31"))
        stocks.append(WatchlistProps(stockName: "Nvidia", symbol: "NVDA", description: "Tech stock", price: "$158.80"))
    }
    
    // Methods
    func addStock(){
        stocks.append(WatchlistProps(stockName: "Boeing", symbol: "BA", description: "Aerospace company", price: "$141.53"))
    }
    
    func deleteStock(index: IndexSet){ // Removes the stock from the watchlist
        stocks.remove(atOffsets: index)
    }
    
    func createNewWatchlist(){ // Create more than one wathchlist
        
    }
    
    func deleteWatchlist(){ // Deletes a specific watchlist
        
    }
    
    func filterWatchlist(){ // Filters the watchlist by low/high price
        
    }
    
    func moveStock(offset: IndexSet, index: Int){ // Organizes the watchlist however the users wants
        stocks.move(fromOffsets: offset, toOffset: index)
        }
}
