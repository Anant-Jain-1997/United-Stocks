//
//  ContentView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//
import SwiftUI

struct ContentView: View {
    @State var stock: String = " "
    var body: some View {
        GeometryReader { geometry in
        VStack{
            VStack{
                Text("United Stocks")
                .font(.custom("Courier New",size: 30))
                .foregroundColor(Color.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                HStack(spacing: 0){
                    Text("Stock Name:")
                        .frame(width: 100)
                        .border(Color.clear)
                    TextField(" Search", text: $stock)
                        .frame(width: 200)
                        .border(Color.black)
                    Spacer()
                }
            }
        }.frame(height: geometry.size.height/5)
            Spacer()
            VStack{
                HStack{
                    Text("APPLE INC")
                        .padding()
                    Text("$178.75")
                }
            }.frame(height: geometry.size.height/1)
                VStack{
                    HStack{
                        Spacer()
                        NavigationLink(destination: StocksInfoLinks()){
                            Text("APPLE INC")
                        }
                }
                Spacer()
            }.frame(height: geometry.size.height/3)
        }
    }
        }



struct StocksInfoLinks: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Stocks")) {
                        NavigationLink(destination: Text("🍎🍏🍏")) {
                            Text("Stocks ")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
                
