//
//  NewsWebAPI.swift
//  UnitedStock
//
//  Created by csuftitan on 6/27/22.
//

import Foundation

struct newsWebAPI {
    
    static let shared = newsWebAPI()
    private init() {}
    
    private let keyAPI = "c0cd09f6582248d99f58d88e84eff950"
    private let session = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()

    func fetchData(from category: Category) async throws -> [newsArticle]{
        
        let url = genNewsURL(from: category)
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw errorsGeneration(description: "Response is Bad !!!!")
        }
        
        switch response.statusCode {
        case(200...299), (400...499):
            let responseAPI = try jsonDecoder.decode(newsArticlesAPIResponse.self, from: data)
            if responseAPI.status == "ok" {
                return responseAPI.articles ?? []
            } else {
                throw errorsGeneration(description: responseAPI.message ?? "ERROR OCCURED !!!!")
            }
            
        default:
            throw errorsGeneration(description: "SERVER ERROR !!!!")
        }
        
        
    }
    
    private func errorsGeneration(code: Int = 1, description: String)-> Error {
        NSError(domain: "NewsWebAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
    
    private func genNewsURL(from category: Category) -> URL {
        var url = "https://newsapi.org/v2/top-headlines?"
        url += "apikey=\(keyAPI)"
        url += "&language=en"
        url += "&category=\(category.rawValue)"
        return URL(string: url)!
    }
}
