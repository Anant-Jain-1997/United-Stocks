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
        CreateUser().environmentObject(manager)
    }
}

struct CreateUser: View {
    
    @StateObject var user = User(name: "", username: "", password: "", age: 0, favStock: "")
    @AppStorage("sizeMultiplier") var sizeMultiplier = 1.0
    @AppStorage("name") var name: String = ""
    @AppStorage("username") var username: String = ""
    @AppStorage("password") var password: String = ""
    @AppStorage("age") var age: String = ""
    @AppStorage("favStock") var favStock: String = ""
    
    @State var message: String = ""
    
    @EnvironmentObject var manager: UserManager
    var body: some View {
        NavigationView {
            VStack {
                Text("Create United Stock Account").modifier(UserTitlesMod())
                VStack {
                    HStack {
                        Spacer()
                        Text("Name:     ")
                        TextField("Name", text: $name).modifier(UserTextFieldMod())
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("Username: ")
                        TextField("Username", text: $username).modifier(UserTextFieldMod())
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("Password: ")
                        TextField("Password", text: $password).modifier(UserTextFieldMod())
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("Age:      ")
                        TextField("Age", text: $age).modifier(UserTextFieldMod())
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("Favorite Stock: ")
                        TextField("Favorite Stock", text: $favStock).modifier(UserTextFieldMod())
                        Spacer()
                    }
                }.modifier(UserSignInMod())
                HStack {
                    Button( action: {
                        if let validAge = Int(age),
                           validAge > 17,
                           !name.isEmpty,
                           !username.isEmpty,
                           !password.isEmpty,
                           !favStock.isEmpty {
                            user.name = name
                            user.username = username
                            user.password = password
                            user.favStock = favStock
                            user.age = validAge
                            
                            manager.applyUser(user)
                            message = "was added! Please Sign In Now"
                            
                            name = ""
                            username = ""
                            password = ""
                            age = ""
                            favStock = ""
                        } else {
                            user.name = name
                            user.username = username
                            message = " is not a valid User, must be at least 18 or fill in all blanks"
                        }
                    }){
                        Text("Add User").modifier(UserLinkButtonMod())
                    }
                }
                HStack {
                    Spacer()
                    SignInWarning(message: $message, user: user).modifier(WarningTextMod())
                    Spacer()
                }
                Spacer()
                VStack {
                    Text("Already A User?")
                    NavigationLink(destination: UserProfile(name: $name, username: $username, password: $password, age: $age, favStock: $favStock)) {
                        Text("Go To Profile")
                            .modifier(UserLinkButtonMod())
                    }
                    NavigationLink(destination: UserSignIn(name: $name, username: $username, password: $password, age: $age, favStock: $favStock, message: $message )) {
                        Text("Sign In")
                            .modifier(UserLinkButtonMod())
                    }
                }
            }.modifier(UserInfoTextMod())
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
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
    @Binding var name: String
    @Binding var username: String
    @Binding var password: String
    @Binding var age: String
    @Binding var favStock: String
    
    @Binding var message: String
    
    @EnvironmentObject var manager: UserManager
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text("Username: ")
                    TextField("Username", text: $username).modifier(UserTextFieldMod())
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("Password: ")
                    TextField("Password", text: $password).modifier(UserTextFieldMod())
                    Spacer()
                }
            }.modifier(UserSignInMod())
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
            }.modifier(UserInfoTextMod()).navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
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
            TabView {
            SearchFeature()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
            UserPreview(name: $name, username: $username, password: $password, age: $age, favStock: $favStock)
                                .tabItem {
                                    Image(systemName: "car")
                                    Text("User Preview")
                                }
            UserInformation(name: $name, username: $username, password: $password, age: $age, favStock: $favStock)
                            .tabItem {
                                Image(systemName: "person")
                                Text("User Info")
                            }
            UserSettings(name: $name, username: $username, password: $password, age: $age, favStock: $favStock)
                            .tabItem {
                                Image(systemName: "wrench")
                                Text("User Settings")
                            }

        }
        }.navigationBarHidden(true)
         .navigationBarBackButtonHidden(true)
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

struct UserInformation: View {
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
                        
                            Text("Current Name: \(name)")
                        
                            Text("User Name: \(username)")
                        
                            Text("Current Password: ********")
                        
                            Text("Age: \(age)")
                        
                            Text("Favorite Stock: \(favStock)")
                        }
                    }
                }
            }.modifier(UserInfoTextMod())
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
        UserViews()
    }
}
