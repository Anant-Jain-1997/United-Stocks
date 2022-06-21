//
//  ContentView.swift
//  UnitedStock
//
//  Created by Irvin on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var user = User(name: "", age: 0, password: "", username: "")
    var body: some View {
        UserSignIn()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
