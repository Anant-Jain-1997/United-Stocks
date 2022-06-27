//
//  UserViews.swift
//  UnitedStock
//
//  Created by Irvin on 6/20/22.
//

import SwiftUI

struct UserViews: View {
    var body: some View {
        UserSignIn()
    }
}

struct UserSignIn: View {
    @State var name: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var age: String = ""
    @State var favStock: String = ""
    var body: some View {
        NavigationView {
        VStack {
            Text("United Stock Account").modifier(UserTitlesMod())
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
                Text("Password: ")
                TextField("Password", text: $password)
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
            NavigationLink(destination: UserSettings(name: $name, username: $username, password: $password, age: $age, favStock: $favStock)) {
                Text("Add User ➡️").modifier(UserLinkButtonMod())
                }
            Text("Already a User?")
            NavigationLink(destination: UserSettings(name: $name, username: $username, password: $password, age: $age, favStock: $favStock)) {
                Text("Sign In ➡️").modifier(UserLinkButtonMod())
            }
            

        }.modifier(UserInfoTextMod())
        }
    }
}

struct UserPreview: View {
    @Binding var name: String
    @Binding var username: String
    @Binding var password: String
    @Binding var age: String
    @Binding var favStock: String
    var body: some View {
        NavigationView {
            VStack {
                Text("User Preview").modifier(UserSubTitlesMod())
                VStack {
                Text( "Name :  \(name)" )
                Text( "Username :  \(username)" )
                Text( "Password: \(password)" )
                Text( "Age :  \(age)" )
                Text( "Favorite Stock :  \(favStock)" )
                }.background(.yellow)
                NavigationLink(destination: UserSettings(name: $name, username: $username, password: $password, age: $age, favStock: $favStock)) {
                    Text("⚙️Change User Info⚙️").modifier(UserLinkButtonMod())
                    }
            }.modifier(UserInfoTextMod())
            }
    }
}

struct UserProfile: View {
    @Binding var name: String
    @Binding var username: String
    @Binding var password: String
    @Binding var age: String
    @Binding var favStock: String
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("User Settings")
                }
                Spacer()
                NavigationLink(destination: UserSettings(name: $name, username: $username, password: $password, age: $age, favStock: $favStock)) {
                    Text("⚙️ User Settings").modifier(UserLinkMod())
                    }
                }
            }
    }
}


struct UserSettings: View {
    @Binding var name: String
    @Binding var username: String
    @Binding var password: String
    @Binding var age: String
    @Binding var favStock: String
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("User Settings")) {
                        NavigationLink(destination: Text("Set New Name To:")) {
                            Text("Change Name")
                        }
                        NavigationLink(destination: Text("Set New User Name To:")
                        ) {
                            Text("Change User Name")
                        }
                        NavigationLink(destination: Text("Set New Password To: ")) {
                            Text("Change Password")
                        }
                        NavigationLink(destination: Text("Set New Age To: ")) {
                            Text("Change Age ")
                        }
                        NavigationLink(destination: Text("Set Favorite Stock To: ")) {
                            Text("Change Favorite Stock")
                        }
                    }
                }
            }.modifier(UserInfoTextMod())
        }
    }
}



struct UserViews_Previews: PreviewProvider {
    static var previews: some View {
        UserViews()
    }
}
