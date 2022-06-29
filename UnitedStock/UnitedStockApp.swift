//
//  UnitedStockApp.swift
//  UnitedStock
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

@main
struct UnitedStockApp: App {
    
    @StateObject var newsArticleSave = savedNewsArticles.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(newsArticleSave)
        }
    }
}
