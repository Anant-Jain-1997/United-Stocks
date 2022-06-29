//
//  NewsFeatureView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/28/22.
//

import SwiftUI

struct NewsFeatureView: View {
    var body: some View {
        TabView {
            NewsArticlesTabView()
                .tabItem {
                    Label("Top News", systemImage: "newspaper.circle")
                }
            SavedNewsTabView()
                .tabItem {
                    Label("Saved News", systemImage: "square.and.arrow.down.on.square")
                }
        }
    }
}

struct NewsFeatureView_Previews: PreviewProvider {
    @StateObject static var newsArticleSave = savedNewsArticles.shared
    static var previews: some View {
        NewsFeatureView().environmentObject(newsArticleSave)
    }
}
