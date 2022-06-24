//
//  ContentView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//
import SwiftUI

struct ContentView: View {
    @State var searchString: String = ""
    @StateObject var finder = SearchApi()
    var body: some View {
        VStack(alignment: .leading){
            TextField("Stock", text: $searchString)
                .modifier(TextEntry())
            Button(action: {
                finder.find(searchString)
            }) {
                Text("Find Stock")
            }
            .modifier(ButtonDesign())
            .padding(.bottom,20)
            Text("Search Results")
                .font(.largeTitle)
            Text(finder.firstfound)
            Text(finder.SecondFound)
            Text(finder.ThirdFound)
                .font(.body)
            Spacer()
        }.padding()
    }
}
struct TextEntry: ViewModifier{
    func body(content: Content) -> some View{
        content
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
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
                
