//
//  ContentView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ViewStock()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ViewSearch()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
