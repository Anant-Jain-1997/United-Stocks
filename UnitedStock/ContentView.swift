//
//  ContentView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Welcome to UnitedStocks").font(.headline).foregroundColor(Color.black).padding().background(Color.green)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
