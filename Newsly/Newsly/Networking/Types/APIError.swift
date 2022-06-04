//
//  APIError.swift
//  Newsly
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation

enum APIError: Error {
    case unreachable
    case failedRequest
    case invalidResponse
    case unknown
}
