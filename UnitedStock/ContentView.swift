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
        NavigationView{
            NavigationLink(destination: NewsFeatureView()) {
                Text("News Feature")
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
