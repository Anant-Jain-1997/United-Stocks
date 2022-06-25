//
//  WatchlistView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/11/22.
//
//


import SwiftUI

struct WatchlistView: View{
    @EnvironmentObject var stockManager: Watchlist
    var body: some View{
        NavigationView{
            VStack{
                List{
                    ForEach(stockManager.stocks){
                        WatchlistStocks in
                        HStack{
                            // NavigationLink for more details about the stock
                            NavigationLink(destination: Text("\(WatchlistStocks.stockName) view \n Description: \(WatchlistStocks.description)").multilineTextAlignment(.center)){
                                Text(WatchlistStocks.stockName)
                                Spacer()
                                Text(WatchlistStocks.price)
                                    .font(.headline).foregroundColor(Color.green)
                            }
                        }
                    }.onDelete(perform: stockManager.deleteStock)
                        .onMove(perform: stockManager.moveStock)
                }
            }.navigationTitle("Watchlist")
                .navigationBarItems(leading: EditButton())
        }
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
            .preferredColorScheme(.dark)
    }
}
