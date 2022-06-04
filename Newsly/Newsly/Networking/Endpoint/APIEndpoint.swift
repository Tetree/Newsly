//
//  APIEndpoint.swift
//  Newsly
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation

enum APIEndpoint : APIBuilder {
    case everything
    case topHeadlines
    case sources
    
    var path: String {
        switch self {
        case .everything:
            return NetworkConstants.everythingPath
        case .topHeadlines:
            return NetworkConstants.topHeadlinesPath
        case .sources:
            return NetworkConstants.sourcesPath
        }
    }
    
    var url:URL {
        NetworkConstants.baseURL.appendingPathComponent(path)
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .everything:
            return HTTPMethod.get
        case .topHeadlines:
            return HTTPMethod.get
        case .sources:
            return HTTPMethod.get
        }
    }
    
}


