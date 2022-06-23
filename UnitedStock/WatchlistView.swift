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
                EditButton()
                List{
                    ForEach(stockManager.stocks){
                        WatchlistStocks in
                        HStack{
                            // NavigationLink for more details about the stock
                            NavigationLink(destination: Text("\(WatchlistStocks.stockName) view").bold()){
                                Text(WatchlistStocks.stockName)
                                Spacer()
                                Text(WatchlistStocks.price)
                                    .font(.headline).foregroundColor(Color.green)
                            }
                        }
                    }.onDelete{
                        offset in
                        stockManager.stocks.remove(atOffsets: offset)
                        
                    }
//                    HStack{
//                        // NavigationLink for more details about the stock
//                        NavigationLink(destination: Text("APPL View")){
//                            Text("APPL")
//                            Spacer()
//                            Text("$")
//                            Text("0.00").font(.headline).foregroundColor(Color.green)
//                        }
//                    }
//                    HStack{
//                        // NavigationLink for more details about the stock
//                        NavigationLink(destination: Text("LCID View")){
//                            Text("LCID")
//                            Spacer()
//                            Text("$")
//                            Text("0.00").font(.headline).foregroundColor(Color.green)
//                        }
//                    }
//                    HStack{
//                        // NavigationLink for more details about the stock
//                        NavigationLink(destination: Text("GOOG View")){
//                            Text("GOOG")
//                            Spacer()
//                            Text("$")
//                            Text("0.00").font(.headline).foregroundColor(Color.green)
//                        }
//                    }
//                    HStack{
//                        // NavigationLink for more details about the stock
//                        NavigationLink(destination: Text("AMZN View")){
//                            Text("AMZN")
//                            Spacer()
//                            Text("$")
//                            Text("0.00").font(.headline).foregroundColor(Color.green)
//                        }
//                    }
//                    HStack{
//                        // NavigationLink for more details about the stock
//                        NavigationLink(destination: Text("NVDA View")){
//                            Text("NVDA")
//                            Spacer()
//                            Text("$")
//                            Text("0.00").font(.headline).foregroundColor(Color.green)
//                        }
//                    }
                }
            }
            .navigationTitle("Watchlist")
            .toolbar {EditButton()}
        }
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
            .preferredColorScheme(.dark)
    }
}
