//
//  UserManagement.swift
//  UnitedStock
//
//  Created by Irvin Rafael on 6/15/22.
//

import Foundation

class User : ObservableObject, Identifiable {
    //initializer sets all member variables
    init(name: String,  username: String, password: String, age: Int, favStock: String) {
        self.name = name
        self.age = age
        self.password = password
        self.username = username
        self.favStock = favStock
    }
    
    //user variables
    @Published var name: String
    @Published var username: String
    @Published var password: String
    @Published var age: Int
    @Published var favStock: String
}

class UserManager: ObservableObject {
    @Published var users: [User] = []
    
    var userList: String {
        var list: String = ""
        if !users.isEmpty {
            for user in users {
                list += user.name + " "
            }
        } else {
            list = "No users"
        }
        return list
    }
    
    func findUser(_ username: String, _ password: String) -> User {
        
        var foundUser: User = User(name: "", username: "", password: "", age: 0, favStock: "")
        
        if !users.isEmpty {
            for user in users {
                if username == user.username && password == user.password {
                    foundUser.name = user.name
                    foundUser.username = user.username
                    foundUser.password = user.password
                    foundUser.age = user.age
                    foundUser.favStock = user.favStock
                }
            }
        }
        return foundUser
        }
    
    func applyUser(_ user: User) -> Void {
        let newCopy = User(name: user.name, username: user.username, password: user.password, age: user.age, favStock: user.favStock)
        users.append(newCopy)
    }
    
    init() {
        
    }
}




