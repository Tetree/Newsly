//
//  NetworkConstants.swift
//  Newsly
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation

enum NetworkConstants {
    static let apiKey = "5521da14ba6c4cfa9fd9d69abbe1b3ff"
    static let authenticationHeader = "X-Api-Key"
    static let baseURL = URL(string: "https://newsapi.org/v2")!
    static let everythingPath = "/everything"
    static let topHeadlinesPath = "/top-headlines"
    static let sourcesPath = "/top-headlines/sources"
}
