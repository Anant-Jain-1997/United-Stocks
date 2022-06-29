//
//  SearchViews.swift
//  UnitedStock
//
//  Created by csuftitan on 6/28/22.
//

import Foundation
import SwiftUI
struct ViewSearch: View{
    @StateObject var manager = SearchApi()
    var body: some View{
        SearchView().environmentObject(manager)
    }
}

struct SearchView: View {
    @State var searchString: String = ""
    @StateObject var finder = SearchApi()
    @StateObject var history = SearchHistory()
    var body: some View {
        VStack{
            HStack{
            TextField("Stock", text: $searchString)
                .modifier(TextEntry())
            Button(action: {
                finder.find(searchString)
                
            }) {
                Text("Find Stock")
                    .font(.system(size: 10))
                
            }
            .modifier(ButtonDesign())
            .padding(.bottom,20)
            }
            Text("Stock Results")
                .font(.largeTitle)
                .bold()
            Text(finder.firstfound)
                .bold()
            HStack{
                Text("Name: \(finder.SecondFound)")
                    .padding()
                Text("Sector: \(finder.Fourthfound)")
                
            }
            HStack{
                Text("Analyst Target Price:")
                .padding()
                Text("$\(finder.ThirdFound)")
                    .font(.body)
            }
            .padding(.bottom, 20)
            VStack{
            Text("Recent Stock Searches")
                .font(.title)
                .bold()
            List(history.searchStrings, id: \.self){
                storedSearchString in
                Button(action: {
                    searchString = storedSearchString
                    finder.find(searchString)
                    history.addSearchString(searchString)
                }){
                    Text(storedSearchString)
                        
                }
                
            }
        }
            .background(Color.gray)
            .foregroundColor(.black)
        }
            .frame(width: 400)
            .padding()
            .background(Color.gray)
    }
}
            
        

struct TextEntry: ViewModifier{
    func body(content: Content) -> some View{
        content
            .frame(width: 250, height: 10)
            .padding()
            .border(Color.black)
            .background(Color.white)
            .cornerRadius(15)
    }
}
struct ButtonDesign: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(15)
    }
}

struct ViewSearch_Previews: PreviewProvider{
    static var previews: some View{
        ViewSearch()
    }
}
