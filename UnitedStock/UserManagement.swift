//
//  UserManagement.swift
//  UnitedStock
//
//  Created by Irvin Rafael on 6/15/22.
//

import Foundation

class User : ObservableObject {
    //initializer sets all member variables
    init(name: String, age: Int, password: String, username: String, favStock: String) {
        self.name = name
        self.age = age
        self.password = password
        self.username = username
        self.favStock = favStock
    }
    
    //this initializer is the same, except if the user provides no favorite stock it is left as blank
    init(name: String, age: Int, password: String, username: String) {
        self.name = name
        self.age = age
        self.password = password
        self.username = username
        self.favStock = ""
    }
    
    
    //user variables
    @Published var username: String
    @Published var password: String
    @Published var name: String
    @Published var age: Int
    @Published var favStock: String
    
    //these are for when a user changes their settings, it might be removed later since they can just do user.favStock = "new fav stock"
    func changeFavStock(to favStock: String) -> Void {
        self.favStock = favStock
    }
    func changeName(to name: String) -> Void {
        self.name = name
    }
    func changeAge(username: String) -> Void {
        self.username = username
    }
    func changePassword(password: String) -> Void {
        self.password = password
    }
}

class userManager: ObservableObject {
    @Published var users: [User] = []
    
    var volunteerList: String {
        var list: String = ""
        if !users.isEmpty {
            for user in users {
                list += user.name + " "
            }
        } else {
            list = "No volunteers"
        }
        return list
    }
    
    func user(_ user: User) {
        let newCopy = User(name: user.name, age: user.age, password: user.password, username: user.username)
        users.append(newCopy)
    }
    
    init() {
        
    }
}




