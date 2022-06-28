//
//  SearchViews.swift
//  UnitedStock
//
//  Created by csuftitan on 6/28/22.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @State var searchString: String = ""
    @StateObject var finder = SearchApi()
    var body: some View {
        VStack(alignment: .leading){
            HStack{
            TextField("Stock", text: $searchString)
                .modifier(TextEntry())
            Button(action: {
                finder.find(searchString)
                
            }) {
                Text("Find Stock")
                
            }
            .modifier(ButtonDesign())
            .padding(.bottom,20)
            }
            Text("Search Results")
                .font(.largeTitle)
            Text(finder.firstfound)
                .bold()
            HStack{
                Text(finder.SecondFound)
                Text("$\(finder.ThirdFound)")
                    .font(.body)
            }
            Spacer()
        }
            .frame(width: 400)
            .padding()
            .accentColor(Color.pink)
            .background(Color.gray)
    }
}
            
        

struct TextEntry: ViewModifier{
    func body(content: Content) -> some View{
        content
            .frame(width: 250, height: 10)
            .padding(10)
            .border(Color.black)
            .background(Color.white)
    }
}
struct ButtonDesign: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(20)
    }
}
