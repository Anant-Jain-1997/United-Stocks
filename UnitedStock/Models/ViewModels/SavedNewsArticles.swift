//test
//  SavedNewsArticles.swift
//  UnitedStock
//
//  Created by csuftitan on 6/27/22.
//

import SwiftUI
@MainActor
class savedNewsArticles: ObservableObject {
    
    @Published private(set) var savingNews: [newsArticle] = []
    private let newsStore = plistDataStore<[newsArticle]>(filename: "saveNews")
    
    static let shared = savedNewsArticles()
    private init() {
        async {
            await load()
        }
    }
    
    private func load() async {
        savingNews = await newsStore.load() ?? []
    }
    
    func saving(for article: newsArticle) -> Bool {
        savingNews.first { article.id == $0.id } != nil
    }
    
    func saved(for article: newsArticle) {
        guard !saving(for: article) else {
            return
        }
        savingNews.insert(article, at: 0)
        updateSavedNews()
    }
    func removeSavedNews(for article: newsArticle) {
        guard let index = savingNews.firstIndex(where: {$0.id == article.id}) else {
            return
        }
        savingNews.remove(at: index)
        updateSavedNews()
    }
    private func updateSavedNews() {
        let savedNews = self.savingNews
        async {
            await newsStore.save(savedNews)
        }
    }
    
}
