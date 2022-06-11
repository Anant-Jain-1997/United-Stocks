//
//  Watchlist.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import Foundation

class Watchlist
{
    // Properties
    var stockName: String
    var symbol: String
    var about: String
    var price: Double
    
    // Initializer (constructor)
    init(stockName: String, symbol: String, about: String, price: Double)
    {
        self.stockName = stockName
        self.symbol    = symbol
        self.about     = about
        self.price     = price
    }
    
    // Overloaded Initializer (Do we need??)
    
    
    // Deinitializer (destructor)

    
    // Methods
    func addStockWatchlist () -> Bool // Return is Bool because it checks if stock is successfuly add (returns true)
                                   // if failed (return false)
    {
        // dummy return
        return true
    }
        
    func removeStockWatchlist () -> Void // Removes the stock from the watchlist
    {
        
    }
    
    func createNewWatchlist () -> Void // Create more than one wathchlist
    {
        
    }
    
    func deleteWatchlist () -> Void // Deletes a specific watchlist
    {
        
    }
    
    func filterWatchlist () -> Void // Filters the watchlist by low/high price
    {
        
    }
    
}
