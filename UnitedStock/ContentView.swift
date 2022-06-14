//
//  ContentView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = " "
    let myStocks = [
    "APPLE INC $129.67","Tesla $399.23 ","PEPSI CO  $127.45"
    ,"Google INC $210.35",]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("DarkGray"))
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("Search..", text: $searchText)
                }
                    .foregroundColor(.gray)
                    .padding(.leading,13)
            }
            .frame(height: 50 )
            .cornerRadius(13)
            .padding()
                
                List(myStocks,id: \.self){ stocks in
                    Text(stocks)
                
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Stocks")
        }
    }
    }
struct SearchBar: View {
    @Binding var searchText: String
    var body: some View{
        ZStack {
            Rectangle()
                .foregroundColor(Color("LightGray"))
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search... ", text: $searchText)
            }
            .foregroundColor(.gray)
            .padding(.leading,13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
