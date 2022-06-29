//
//  SavedNewsTabView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/28/22.
//

import SwiftUI

struct SavedNewsTabView: View {
    
    @EnvironmentObject var newsArticleSave: savedNewsArticles
    
    var body: some View {
        NavigationView {
            NewsArticlesListView(article: newsArticleSave.savingNews)
                .navigationTitle("SAVED NEWS")
        }
    }
    
    
}

struct SavedNewsTabView_Previews: PreviewProvider {
    
    @StateObject static var newsArticleSave = savedNewsArticles.shared
    
    static var previews: some View {
        SavedNewsTabView()
            .environmentObject(newsArticleSave)
    }
}
