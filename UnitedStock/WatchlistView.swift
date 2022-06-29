//
//  WatchlistView.swift
//  Watchlist
//
//  Created by csuftitan on 6/28/22.
//

import SwiftUI

struct ViewStock: View{
    @StateObject var manager = Watchlist()
var body: some View{
        WatchlistView().environmentObject(manager)
    }
}

struct WatchlistView: View {
    @EnvironmentObject var manager: Watchlist
    @State var searchStock = ""
    @State private var SearchView = false
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(manager.stocks) {
                        WatchlistStocks in
                        HStack {
                            NavigationLink(destination: Text("\(WatchlistStocks.name)").multilineTextAlignment(.center)) {
                                Text(WatchlistStocks.name)
                                Spacer()
                                Text(WatchlistStocks.price)
                                    .font(.headline).foregroundColor(Color.green)
                            }
                        }
                    }.onDelete(perform: manager.deleteStock)
                        .onMove(perform: manager.moveStock)
                }
            }.navigationBarTitle(Text("Watchlist"))
                .navigationBarTitle(Text("Watchlist"))
                .toolbar {
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading) {
                        EditButton().buttonStyle(.bordered)
                    }
                    
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing) {
                        Button {SearchView.toggle() } label: {Image(systemName: "plus") }.sheet(isPresented: $SearchView, onDismiss:{  }, content: { UnitedStocks.SearchView()
                        }).buttonStyle(.bordered)
                    }
                }

        }
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        ViewStock()
    }
}

/* from github
 import SwiftUI

 struct ViewStock: View {
     @StateObject var manager = Watchlist()
     @StateObject var searchManager = SearchApi()
     var body: some View {
         WatchlistView().environmentObject(manager)
     }
 }

 struct WatchlistView: View {
     @EnvironmentObject var manager: Watchlist
     @State var searchStock = ""
     @State private var SearchView = false
     var body: some View {
         NavigationView {
             VStack {
                 List {
                     ForEach(manager.stocks) {
                         WatchlistStocks in
                         HStack {
                             NavigationLink(destination: Text("\(WatchlistStocks.name)").multilineTextAlignment(.center)) {
                                 Text(WatchlistStocks.name)
                                 Spacer()
                                 Text(WatchlistStocks.price)
                                     .font(.headline).foregroundColor(Color.green)
                             }
                         }
                     }.onDelete(perform: manager.deleteStock)
                         .onMove(perform: manager.moveStock)
                 }
             }.navigationBarTitle(Text("Watchlist"))
                 .toolbar {
                     ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading) {
                         EditButton().buttonStyle(.bordered)
                     }
                     
                     ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing) {
                         Button {SearchView.toggle() } label: {Image(systemName: "plus") }.sheet(isPresented: $SearchView, onDismiss:{  }, content: { UnitedStocks.SearchView()
                         }).buttonStyle(.bordered)
                     }
                 }
         }
     }
 }

 struct WatchlistView_Previews: PreviewProvider {
     static var previews: some View {
         ViewStock()
     }
 }
 */
