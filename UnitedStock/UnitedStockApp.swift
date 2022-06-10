//
//  UnitedStockApp.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

@main
struct UnitedStockApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class User {
    //if they fill out all the information then they will change member var to the information provided
    init(name: String, age: Int, password: String, username: String, favstock: String) {
        self.name = name
        self.age = age
        self.password = password
        self.username = username
        self.favstock = favstock
    }
    
    //this initializer is the same, except if the user provides no favorite stock it is left as blank
    init(name: String, age: Int, password: String, username: String) {
        self.name = name
        self.age = age
        self.password = password
        self.username = username
        self.favstock = ""
    }
    
    
    //user variables
    var username: String
    var password: String
    var name: String
    var age: Int
    var favstock: String
}
