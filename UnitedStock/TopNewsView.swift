//
//  TopNewsView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/25/22.
//

import SwiftUI

struct TopNewsView: View {
    
    let imgSmall: Image
    let headline: Text
    let detailNews: Text
    let text: Text
    let largeNewsImg : Image
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                imgSmall
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20.0, height: 20.0)
                VStack(alignment: .leading) {
                    headline
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                    detailNews
                        .foregroundColor(Color.gray)
                }
            }
            largeNewsImg
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: 240.0)
                .clipped()

        }
    }
}

struct TopNewsView_Previews: PreviewProvider {
    static var previews: some View {
        TopNewsView(
            imgSmall: Image(systemName: "pencil"),
            headline: Text("News Titles"),
            detailNews: Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/),
            text: Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/),
            largeNewsImg: Image(systemName: "photo")
        )
        .previewLayout(.sizeThatFits)
    }
}
