//
//  NewsViewRow.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI
import URLImage


struct ArticleRowView: View {
    
    let article: NewsArticle
    
    var body: some View {
        HStack {
            CustomImageView(article: article)
            VStack(alignment: .leading, spacing: 4) {
                
                Text(article.title)
                    .font(.headline)
                    .bold()
                
                Text(article.source.name)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(.gray.opacity(0.1))
        .cornerRadius(30)
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    
    static let article = NewsArticle(source: Source(id: nil, name: "MSNBC"), author: "Nuno", title: "Covid-19 cases increasing in western Europe", newsSourceDescription: "A reputable source of news", url: "https://www.msnbc.com", urlToImage: "https://media-cldnry.s-nbcnews.com/image/upload/t_focal-1120x560,f_auto,q_auto:best/newscms/2022_22/3555211/220601-flint-michigan-voters-an.jpg", publishedAt: Date(), content: "This is the content")
    
    static var previews: some View {
        ArticleRowView(article: article)
    }
}
