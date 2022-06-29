//
//  ContentView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//
import SwiftUI

struct ContentView: View {
    @StateObject var manager = UserManager()
    var body: some View {
        UserSigningIn().environmentObject(manager)
    }
}

struct HomeView: View {
    @Binding var name: String
    @Binding var username: String
    @Binding var password: String
    @Binding var age: String
    @Binding var favStock: String
    
    var body: some View {
        TabView {
            ViewStock()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ViewSearch()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            NewsFeatureView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
            UserInformation(name: $name, username: $username, password: $password, age: $age, favStock: $favStock)
                            .tabItem {
                                Image(systemName: "person")
                                Text("User Info")
                            }
        }
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
