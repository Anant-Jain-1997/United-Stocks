//
//  WatchlistView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/11/22.
//


import SwiftUI

struct WatchlistView: View
{
    var body: some View
    {
        VStack
        {
            NavigationView
            {
                List
                {
                    HStack
                    {
                        Text("APPL")
                        Spacer()
                        Text("$")
                        Text("0.00").font(.headline).foregroundColor(Color.green)
                    }
                    HStack
                    {
                        Text("LCID")
                        Spacer()
                        Text("$")
                        Text("0.00").font(.headline).foregroundColor(Color.green)
                    }
                    HStack
                    {
                        Text("GOOG")
                        Spacer()
                        Text("$")
                        Text("0.00").font(.headline).foregroundColor(Color.green)
                    }
                    HStack
                    {
                        Text("AMZN")
                        Spacer()
                        Text("$")
                        Text("0.00").font(.headline).foregroundColor(Color.green)
                    }
                    HStack
                    {
                        Text("NVDA")
                        Spacer()
                        Text("$")
                        Text("0.00").font(.headline).foregroundColor(Color.green)
                    }
                }.navigationTitle("Watchlist")
            }
        }
    }
    
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
            .preferredColorScheme(.dark)
    }
}
