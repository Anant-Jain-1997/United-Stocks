//
//  ContentView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//
//
import SwiftUI
struct ContentView: View {
    //@StateObject var manager = Watchlist()
    var body: some View {
        TabView {
            WatchlistView()
            SearchView()
            NewsView()

        }
        //WatchlistView().environmentObject(manager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
                
