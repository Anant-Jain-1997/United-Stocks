//
//  NewsArticle.swift
//  UnitedStock
//
//  Created by csuftitan on 6/25/22.
//

import Foundation

fileprivate let sourceDate = RelativeDateTimeFormatter()

struct newsArticle {
    
    let source: Source
    
    let title: String
    let url: String
    let publishedAt: Date
    
    let description: String?
    let urlToImage: String?
    let author: String?
    
    var newsURL: URL {
        URL(string: url)!
    }
    
    var descriptionOptional: String {
        description ?? ""
    }
    
    var urlToImageOptional: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
    
    var authorOptional: String {
        author ?? ""
    }
    
    var captionText: String {
        "\(source.name) ... \(sourceDate.localizedString(for: publishedAt, relativeTo: Date()))"
    }
    
}

struct Source {
    let name: String
}

extension newsArticle: Codable {}
extension newsArticle: Equatable {}
extension newsArticle: Identifiable {
    var id: String {url}
}

extension Source: Codable {}
extension Source: Equatable {}

extension newsArticle {
    static var viewData: [newsArticle]{
        let viewURLData = Bundle.main.url(forResource: "newsArticles", withExtension: "json")!
        let data = try! Data(contentsOf: viewURLData)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        
        
        let apiResponse = try!
            decoder.decode(newsArticlesAPIResponse.self, from: data)
        return apiResponse.articles ?? []
    }
}
