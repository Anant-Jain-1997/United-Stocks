//test
//  NewsViewModel.swift
//  UnitedStock
//
//  Created by csuftitan on 6/27/22.
//

import Foundation

enum dataFetchingPhase<T> {
    case empty
    case success(T)
    case failure(Error)
}
@MainActor
class NewsViewModel: ObservableObject {
    
    @Published var phase = dataFetchingPhase<[newsArticle]>.empty
    @Published var selectedCategory: Category
    
    private let newsAPI = newsWebAPI.shared
    
    init(articles: [newsArticle]? = nil, selectedCategory: Category = .business) {
        if let articles = articles {
            self.phase = .success(articles)
        } else {
            self.phase = .empty
        }
        self.selectedCategory = selectedCategory
    }
    
    func loadingArticles() async {
        phase = .empty
        do {
            let articles = try await newsAPI.fetchData(from: selectedCategory)
            phase = .success(articles)
        } catch {
            phase = .failure(error)
        }
    }
    
}
