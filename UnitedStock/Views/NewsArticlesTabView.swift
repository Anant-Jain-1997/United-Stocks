//
//  NewsArticlesTabView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/27/22.
//

import SwiftUI

struct NewsArticlesTabView: View {
    
    @StateObject var newsArticleVM = NewsViewModel()
    
    var body: some View {
        NavigationView {
            NewsArticlesListView(article: article)
                .onAppear {
                    async {
                        await newsArticleVM.loadingArticles()
                    }
                }
                .navigationTitle(newsArticleVM.selectedCategory.text)
        }
    }
    private var article: [newsArticle] {
        if case let .success(article) = newsArticleVM.phase {
            return article
        } else {
            return []
        }
    }
}

struct NewsArticlesTabView_Previews: PreviewProvider {
    
    @StateObject static var newsArticleSave = savedNewsArticles.shared
    
    static var previews: some View {
        NewsArticlesTabView(newsArticleVM: NewsViewModel(articles: newsArticle.viewData))
            .environmentObject(newsArticleSave)
    }
}
