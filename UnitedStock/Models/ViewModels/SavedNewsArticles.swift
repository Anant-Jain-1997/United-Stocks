//
//  SavedNewsArticles.swift
//  UnitedStock
//
//  Created by csuftitan on 6/27/22.
//

import SwiftUI
@MainActor
class savedNewsArticles: ObservableObject {
    
    @Published private(set) var savingNews: [newsArticle] = []
    
    func saving(for article: newsArticle) -> Bool {
        savingNews.first { article.id == $0.id } != nil
    }
    
    func saved(for article: newsArticle) {
        guard saving(for: article) else {
            return
        }
        savingNews.insert(article, at: 0)
    }
    func removeSavedNews(for article: newsArticle) {
        guard let index = savingNews.firstIndex(where: {$0.id == article.id}) else {
            return
        }
        savingNews.remove(at: index)
    }
    
}
