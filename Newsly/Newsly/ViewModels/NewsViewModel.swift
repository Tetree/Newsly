//
//  NewsViewModel.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import Foundation
import Combine

final class NewsViewModel: ObservableObject {
    
    private(set) var articles = [NewsArticle]()
    @Published private(set) var loading = false
    @Published private(set) var state:ResultState<[NewsArticle]> = .loading
    
    private let client: APIClient
    
    private var cancellables = Set<AnyCancellable>()
    
    init(client: APIClient) {
        self.client = client
    }
    
    func getArticles() {
        state = .loading
        apiRequest()
            .sink { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.state = .failed(message: "Error")
                case .finished:
                    break
                }
            } receiveValue: { [weak self] response in
                self?.articles = response.articles
                self?.state = .success(content: response.articles)
            }
            .store(in: &cancellables)

    }
    
    func apiRequest() -> AnyPublisher<NewsResponse, APIError> {
        return client.request(with: APIEndpoint.everything, parameters: nil)
    }
    
}
