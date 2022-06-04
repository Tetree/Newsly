//
//  APIService.swift
//  Newsly
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation
import Combine

final class APIService : APIClient {
    
    func request<T>(with endpoint: APIBuilder, parameters: [String : String]?) -> AnyPublisher<T, APIError> where T : Decodable {
        
        var url = endpoint.url
        
        if let parameters = parameters {
            
            var builder = URLComponents(string: url.path)
            var queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: value)
                queryItems.append(queryItem)
            }
            
            builder?.queryItems = queryItems
            
            if let newUrl = builder?.url  {
                url = newUrl
            }
        }
        
        var request = URLRequest(url: endpoint.url)
        request.addValue(NetworkConstants.apiKey, forHTTPHeaderField: NetworkConstants.authenticationHeader)
        request.httpMethod = endpoint.httpMethod.rawValue
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) -> T in
                
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                      (200..<300) ~= statusCode else {
                    throw APIError.failedRequest
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    return try decoder.decode(T.self, from: data)
                }catch {
                    throw APIError.invalidResponse
                }
                
            }
            .mapError { error -> APIError in
                switch error {
                case let apiError as APIError:
                    return apiError
                case URLError.notConnectedToInternet:
                    return APIError.unreachable
                default:
                    return APIError.unknown
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
