//
//  SourcesResponse.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import Foundation

struct SourcesResponse: Codable {
    let status: String
    let sources: [NewsSource]
}

// MARK: - NewsSource
struct NewsSource: Codable, Identifiable, ViewPresentable {
    
    var headline: String { newsSourceDescription }
    var subheadline: String { name }
    var imageURLPath: String { url }
    
    let id, name, newsSourceDescription: String
    let url: String
    let category, language, country: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case newsSourceDescription = "description"
        case url, category, language, country
    }
}


