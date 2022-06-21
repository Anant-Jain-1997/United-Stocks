//
//  ContentView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            NavigationView {
                Text("Tab Content 1")
                    .navigationTitle("TOP NEWS")
            }
            .tabItem { Text("All News") }.tag(1)
            NavigationView {
                Text("Tab Content 2")
                    .navigationTitle("NEWS")
            }
            .tabItem { Text("All News") }.tag(2)
            NavigationView {
                Text("Tab Content 3")
                    .navigationTitle("SAVED NEWS")
            }
            .tabItem { Text("Saved News") }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
