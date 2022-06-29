//
//  UserViews.swift
//  UnitedStock
//
//  Created by Irvin on 6/20/22.
//

import SwiftUI

struct UserViews: View {
    @StateObject var manager = UserManager()
    var body: some View {
        UserSigningIn().environmentObject(manager)
    }
}


struct SignInWarning: View {
    @Binding var message: String
    @ObservedObject var user: User
    
    var body: some View {
        HStack {
            if !message.isEmpty {
                Text("\(user.username) ( \(user.name))")
                Text(message)
            }
        }
    }
}

struct UserSignIn: View {
    @State var tempUsername: String = ""
    @State var tempPassword: String = ""
    
    @Binding var name: String
    @Binding var username: String
    @Binding var password: String
    @Binding var age: String
    @Binding var favStock: String
    
    @State var hiddenSignIn: Bool = true
    @State var warning: String = ""
    
    @EnvironmentObject var manager: UserManager
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("United Stock").modifier(UserTitlesMod())
                }
                VStack {
                HStack {
                    Spacer()
                    Text("Username: ")
                    TextField("Username", text: $tempUsername).modifier(UserTextFieldMod())
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("Password: ")
                    TextField("Password", text: $tempPassword).modifier(UserTextFieldMod())
                    Spacer()
                }
                }.modifier(UserSignInMod())
                HStack {
                    Button( action: {
                        if tempUsername == username && tempPassword == password {
                            
                            warning = "is a valid User"
                        } else {
                            warning = " is not a valid User, please fix username or password!"
                        }
                    }
                    ){
                        Text("Verify Account").modifier(UserLinkButtonMod())
                    }
                    HStack {
                        Spacer()
                        Text("\(tempUsername) \(warning)")
                        Spacer()
                    }
                }
                Spacer()
            }
            
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
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
            TabView {
            SearchFeature()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
            UserInformation(name: $name, username: $username, password: $password, age: $age, favStock: $favStock)
                            .tabItem {
                                Image(systemName: "person")
                                Text("User Info")
                            }
        }
        }.navigationBarHidden(true)
         .navigationBarBackButtonHidden(true)
    }
}


/*
 //User Settings have been merge with the user info to allow other tabs to take its place since there is a 5 tab limit
struct UserSettings: View {
    @Binding var name: String
    @Binding var username: String
    @Binding var password: String
    @Binding var age: String
    @Binding var favStock: String
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("Duck")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .clipShape(Circle())
                        .overlay(Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(.blue))
                }
                List {
                    Section(header: Text("User Settings")) {
                        NavigationLink(destination: TextField("Change Name", text: $name).modifier(UserTextFieldMod())) {
                            Text("Change Name")
                        }
                        NavigationLink(destination: TextField("Change Username", text: $username).modifier(UserTextFieldMod())) {
                            Text("Change User Name")
                        }
                        NavigationLink(destination: TextField("Change Password", text: $password).modifier(UserTextFieldMod())) {
                            Text("Change Password")
                        }
                        NavigationLink(destination: TextField("Age", text: $age).modifier(UserTextFieldMod())) {
                            Text("Change Age ")
                        }
                        NavigationLink(destination: TextField("Change Favorite Stock", text: $favStock).modifier(UserTextFieldMod())) {
                            Text("Change Favorite Stock")
                        }
                    }
                }
            }.modifier(UserInfoTextMod())
        }
        
    }
}
*/

struct UserInformation: View {
    @Binding var name: String
    @Binding var username: String
    @Binding var password: String
    @Binding var age: String
    @Binding var favStock: String
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    VStack {
                        Image("Duck")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke(lineWidth: 3)
                                .foregroundColor(.blue))
                    }
                    VStack {
                        List {
                        Section(header: Text("User Settings")) {
                            Text("Current Name: \(name)")
                            
                            Text("User Name: \(username)")
                            
                            Text("Current Password: *********")
                            
                            Text("Age: \(age)")
                            
                            Text("Favorite Stock: \(favStock)")
                        }
                    }
                        VStack {
                            List {
                                Section(header: Text("User Settings")) {
                                    NavigationLink(destination: TextField("Change Name", text: $name).modifier(UserTextFieldMod())) {
                                        Text("Change Name")
                                    }
                                    NavigationLink(destination: TextField("Change Username", text: $username).modifier(UserTextFieldMod())) {
                                        Text("Change User Name")
                                    }
                                    NavigationLink(destination: TextField("Change Password", text: $password).modifier(UserTextFieldMod())) {
                                        Text("Change Password")
                                    }
                                    NavigationLink(destination: TextField("Age", text: $age).modifier(UserTextFieldMod())) {
                                        Text("Change Age ")
                                    }
                                    NavigationLink(destination: TextField("Change Favorite Stock", text: $favStock).modifier(UserTextFieldMod())) {
                                        Text("Change Favorite Stock")
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
                Spacer()
            }.modifier(UserInfoTextMod())
        }
    }
    
}

struct SearchFeature: View {
    var body: some View {
        VStack  {
            Text("Placeholder for other views when implemented")
        }
    }
}



struct UserViews_Previews: PreviewProvider {
    static var previews: some View {
        UserSigningIn()
    }
}

struct UserSigningIn: View {
    @AppStorage("name") var name = "Titan"
    
    @AppStorage("username") var username = ""
    @AppStorage("password") var password = ""
    @State var wrongUsername: Float = 0
    @State var wrongPassword: Float  = 0
    @State var showingSignInScreen = false
    
    @AppStorage("age") var age = "20"
    @AppStorage("favStock") var favStock = "Tesla"

    @EnvironmentObject var manager: UserManager
    @StateObject var user = User(name: "", username: "", password: "", age: 0, favStock: "")
    
    var body: some View {
        NavigationView {
            VStack {

                VStack {
                    Text("UnitedStock")
                        .modifier(UserTitlesMod())
                    
                    TextField("Username", text: $username)
                        .modifier(UserTextFieldMod())
                        .border(.red, width: CGFloat(wrongUsername))
                        
                    
                    TextField("Password", text: $password)
                        .modifier(UserTextFieldMod())      .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Sign In") {
                        authenticateUser(username: username, password: password)
                        }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: UserProfile(name: $name, username: $username, password: $password, age: $age, favStock: $favStock), isActive: $showingSignInScreen) {
                        EmptyView()
                    }
                }
            }.navigationBarHidden(true)
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "admin" {
            wrongUsername = 0
            if password.lowercased() == "fullerton" {
                wrongPassword = 0
                showingSignInScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}
