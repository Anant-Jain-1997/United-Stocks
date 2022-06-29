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
            .foregroundColor(.green)
            .font(.custom("Futura Bold", size: 30))
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
            .font(.custom("Courier", size: 18))
    }
}

struct UserSignInMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .font(.custom("Courier", size: 18))
    }
}

struct UserTextFieldMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)
    }
}

struct WarningTextMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.red)
            .font(.custom("Courier", size: 18))
    }
}
