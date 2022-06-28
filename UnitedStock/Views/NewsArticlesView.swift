//
//  NewsArticlesView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/26/22.
//

import SwiftUI

struct NewsArticlesView: View {
    
    @EnvironmentObject var newsArticleSave: savedNewsArticles
    
    let article: newsArticle
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(article.title)
                .font(.headline)
                .lineLimit(2)
            Text(article.descriptionOptional)
                .font(.caption2)
                .lineLimit(4)
            VStack(alignment: .leading, spacing: 6) {
                AsyncImage(url: article.urlToImageOptional) {
                    phase in
                    switch phase {
                    case .empty:
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    case .failure:
                        HStack {
                            Spacer()
                            Image(systemName: "photo")
                            Spacer()
                        }
                        
                    @unknown default:
                        fatalError()
                    }
                }
                .frame(minHeight: 200, maxHeight: 300)
                .background(Color.orange.opacity(0.2))
            }
            HStack {
                Text(article.captionText)
                    .font(.caption2)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
                Spacer()
                
                Button {
                    toggleSaved(for: article)
                } label: {
                    Image(systemName: newsArticleSave.saving(for: article) ? "square.and.arrow.downsquare.and.arrow.down.fill" : "square.and.arrow.down")
                }
                .buttonStyle(.bordered)
                .accentColor( .orange)
            }
        }
        .padding(.all)
    }
    private func toggleSaved(for article: newsArticle){
        if newsArticleSave.saving(for: article){
            newsArticleSave.removeSavedNews(for: article)
        } else {
            newsArticleSave.saved(for: article)
        }
    }
}

struct NewsArticlesView_Previews: PreviewProvider {
    
    @StateObject static var newsArticleSave = savedNewsArticles()
    
    static var previews: some View {
        NavigationView{
            List {
                NewsArticlesView(article: .viewData[0])
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(.plain)
        }
        .environmentObject(newsArticleSave)
    }
}
