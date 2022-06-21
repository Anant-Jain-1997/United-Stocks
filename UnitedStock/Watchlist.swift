//
//  Watchlist.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import Foundation

class Watchlist: ObservableObject
{
    @Published var stocks: [WatchlistStocks] = []
    // Initializer (constructor)
    init(stockName: String, symbol: String, about: String, price: Double)
    {
//        self.stockName = stockName
//        self.symbol    = symbol
//        self.about     = about
//        self.price     = price
        
        stocks.append(WatchlistStocks(stockName: "Apple", symbol: "APPL", description: "Tech stock", price: "$131.56"))
        stocks.append(WatchlistStocks(stockName: "Lucid Motors", symbol: "LCID", description: "EV stock", price: "$16.63"))
        stocks.append(WatchlistStocks(stockName: "Google", symbol: "GOOG", description: "Tech stock", price: "$2,157.31"))
        stocks.append(WatchlistStocks(stockName: "Nvidia", symbol: "NVDA", description: "Tech stock", price: "$158.80"))
    }
    
    // Overloaded Initializer (Do we need??)
    
    
    // Deinitializer (destructor)

    
    // Methods
    func addStockWatchlist () -> Bool{ // Return is Bool because it checks if stock is successfuly add (returns true) if failed (return false)
        // dummy return
        return true
    }
        
    func removeStockWatchlist () -> Void{ // Removes the stock from the watchlist
        // use the .odDelete() method
    }
    
    func createNewWatchlist () -> Void{ // Create more than one wathchlist
        
    }
    
    func deleteWatchlist () -> Void{ // Deletes a specific watchlist
        
    }
    
    func filterWatchlist () -> Void{ // Filters the watchlist by low/high price
        
    }
    
    func rearrangeWatchlist () -> Void{ // Organizes the watchlist however the users wants
        
    }
}

struct WatchlistStocks: Identifiable
{
    // Properties
    var id = UUID()
    var stockName: String
    var symbol: String
    var description: String
    var price: String
}
