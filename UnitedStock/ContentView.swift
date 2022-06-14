//
//  ContentView.swift
//  UnitedStock
//
//  Created by Irvin on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var username: String = ""
    @State var age: String = ""
    @State var favStock: String = ""
    var body: some View {
        VStack {
            Text("United Stock Account")
            HStack {
                Spacer()
                Text("Name: ")
                TextField("Name", text: $name)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Username: ")
                TextField("Username", text: $username)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Age: ")
                TextField("Age", text: $age)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Favorite Stock: ")
                TextField("Favorite Stock", text: $favStock)
                Spacer()
            }
            Button(action: {
                print("Added User!")
                }) {
                Text("Add User")
                }.padding()
            Text("Already a User?")
            Button(action: {
                print("Signed Existing User!")
                }) {
                Text("Sign In")
                }.padding()
            
            VStack {
                Spacer()
                Text("User Layout")
                Text( "Name :  \(name)" )
                Text( "Username :  \(username)" )
                Text( "Age :  \(age)" )
                Text( "Favorite Stock :  \(favStock)" )
                Button(action: {
                    print("Changed User Settings!")
                    }) {
                    Text("Change User Info")
                    }.padding()
            }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
