//
//  ErrorMapper.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import Foundation

struct ErrorMapper {
    let type: ContentType
    let context: APIError
    
    var errorMessage:String {
        
        switch context {
        case .unreachable:
            return "Not connected to the internet"
        case .failedRequest:
            switch type {
            case .everything:
                return "Error retrieving news articles"
            case .headlines:
                return "Error retrieving top headlines"
            case .sources:
                return "Error retrieving news sources"
            }
        case .invalidResponse,
                .unknown:
            return "Something went wrong. Please try agin later"
        }
        
    }
}
