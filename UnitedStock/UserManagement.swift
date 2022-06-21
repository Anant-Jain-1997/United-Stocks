//
//  UserManagement.swift
//  UnitedStock
//
//  Created by Irvin Rafael on 6/15/22.
//

import Foundation

class User {
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
    var username: String
    var password: String
    var name: String
    var age: Int
    var favStock: String
    
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


