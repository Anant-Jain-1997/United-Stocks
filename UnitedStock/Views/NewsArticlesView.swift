//
//  NewsArticlesView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/26/22.
//

import SwiftUI

struct NewsArticlesView: View {
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
                
                Button {} label: {
                    Image(systemName: "square.and.arrow.down.fill")
                }
                .buttonStyle(.bordered)
                .accentColor( .orange)
            }
        }
        .padding(.all)
    }
}

struct NewsArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            NewsArticlesView(article: .viewData[0])
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
    }
}
