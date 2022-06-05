//
//  APIClient.swift
//  Newsly
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation
import Combine

protocol APIClient {
    
    func request<T: Decodable>(with endpoint: APIBuilder, parameters: [String:String]?) -> AnyPublisher<T, APIError>
    
}
