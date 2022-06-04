//
//  APIClient.swift
//  Newsly
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation
import Combine

protocol APIClient {
    
    func request<T: Decodable>(with endpoint: APIEndpoint, parameters: [String:String]?) -> AnyPublisher<T, APIError>
    
}
