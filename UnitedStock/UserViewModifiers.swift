//
//  UserViewModifiers.swift
//  UnitedStock
//
//  Created by Irvin Rafael on 6/20/22.
//

import SwiftUI

struct UserLinkMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.blue)
            .font(.custom("Calibri", size: 20))
    }
}

struct UserTitlesMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.red)
            .font(.custom("Arial", size: 30))
    }
}

struct UserSubTitlesMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.red)
            .font(.custom("Arial", size: 22))
    }
}

struct UserLinkButtonMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.white)
            .font(.custom("Calibri", size: 20))
            .background(.blue)
            .cornerRadius(12)
    }
}

struct UserInfoTextMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.custom("Futura", size: 18))
    }
}
