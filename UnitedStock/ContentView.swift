//
//  ContentView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WatchlistView()//.environmentObject(WatchlistView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
