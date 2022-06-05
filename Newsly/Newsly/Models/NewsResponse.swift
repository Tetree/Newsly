//
//  NewsResponse.swift
//  Newsly
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [NewsArticle]
}

// MARK: - NewsSource
struct NewsArticle: Codable, Identifiable, ViewPresentable {
    var headline: String { title }
    
    var subheadline: String { source.name }
    
    var imageURLPath: String { urlToImage }
    
    var id:String { return title }
    let source: Source
    let author, title, newsSourceDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case newsSourceDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}

