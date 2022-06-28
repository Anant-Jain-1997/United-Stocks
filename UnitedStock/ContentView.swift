//
//  ContentView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var stockManager: Watchlist
    var watch = Watchlist()
    var body: some View {
        WatchlistView().environmentObject(Watchlist())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(stockManager: Watchlist())
    }
}
