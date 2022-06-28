//
//  NewsArticlesListView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/26/22.
//

import SwiftUI

struct NewsArticlesListView: View {
    
    let article: [newsArticle]
    @State private  var selectedNewsArticle: newsArticle?
    
    
    var body: some View {
        List {
            ForEach(article) { article in
                NewsArticlesView(article: article)
                    .onTapGesture {
                        selectedNewsArticle = article
                    }
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        .sheet(item: $selectedNewsArticle) {
            BrowserView(url: $0.newsURL)
        }
    }
}

struct NewsArticlesListView_Previews: PreviewProvider {
    
    @StateObject static var newsArticleSave = savedNewsArticles()
    
    static var previews: some View {
        NavigationView {
            NewsArticlesListView(article: newsArticle.viewData)
                .environmentObject(newsArticleSave)
        }
    }
}
