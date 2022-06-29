//
//  Category.swift
//  UnitedStock
//
//  Created by csuftitan on 6/27/22.
//

import Foundation

enum Category: String, CaseIterable {
    
    case business
    
    var text: String {
        if self == .business {
            return "TOP NEWS"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable {
    var id: Self {self}
}
