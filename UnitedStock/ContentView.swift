//
//  ContentView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsArticlesTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper.circle")
                }
        }
        
        //NewsArticlesListView(article: newsArticle.viewData)
       /* TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            NavigationView {
                List(0 ..< 10) { item in
                    NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                        TopNewsView(
                            imgSmall: Image(systemName: "pencil"),
                            headline: Text("News Titles"),
                            detailNews: Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/),
                            text: Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/),
                            largeNewsImg: Image(systemName: "photo")
                        )
                    }
                    
                }
                .navigationTitle("TOP NEWS")
            }
            .tabItem { Label("Top News", systemImage: "star") }
            .tag(1)
            NavigationView {
                AllNewsView()
            }
            .tabItem { Label("News", systemImage: "newspaper.fill") }
            .tag(2)
            NavigationView {
                SavedNewsView()
            }
            .tabItem { Label("Saved News", systemImage: "square.and.arrow.down") }
            .tag(3)
        }
        .accentColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/) */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()

        /*  AllNewsView()
            .previewLayout(.sizeThatFits)
        SavedNewsView()
            .previewLayout(.sizeThatFits) */
    }
}



/* struct AllNewsView: View {
    var body: some View {
        VStack {
            Text("Tab Content 2")
                .font(.title2)
                .fontWeight(.bold)
                .navigationTitle("NEWS")
        }
    }
}

struct SavedNewsView: View {
    var body: some View {
        VStack {
            Text("Tab Content 3")
                .font(.title2)
                .fontWeight(.bold)
                .navigationTitle("SAVED NEWS")
        }
    }
} */
