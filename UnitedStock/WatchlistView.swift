//
//  WatchlistView.swift
//  Watchlist
//
//  Created by csuftitan on 6/28/22.
//

import SwiftUI

struct StockViews: View {
    @StateObject var manager = Watchlist()
    var body: some View {
        WatchlistView().environmentObject(manager)
    }
}

struct WatchlistView: View {
    @EnvironmentObject var manager: Watchlist
    @State var searchStock = ""
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(manager.stocks) {
                        WatchlistStocks in
                        HStack {
                            NavigationLink(destination: Text("\(WatchlistStocks.stockName) view \n Description: \(WatchlistStocks.description)").multilineTextAlignment(.center)) {
                                Text(WatchlistStocks.stockName)
                                Spacer()
                                Text(WatchlistStocks.price)
                                    .font(.headline).foregroundColor(Color.green)
                            }
                        }
                    }.onDelete(perform: manager.deleteStock)
                        .onMove(perform: manager.moveStock)
                }
            }.navigationBarTitle(Text("Watchlist"))
                .navigationBarItems(leading: EditButton())
                .toolbar {
                    Button {} label: {
                        Label("Add Stock", systemImage: "plus")
                    }
                }
                .searchable(text: $searchStock, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        StockViews()
    }
}
