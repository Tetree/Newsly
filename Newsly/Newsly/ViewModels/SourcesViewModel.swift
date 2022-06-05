//
//  SourcesViewModel.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import Foundation
import Combine

final class SourcesViewModel: ObservableObject {
    
    private(set) var sources = [NewsSource]()
    @Published private(set) var state:ResultState = .loading
    
    private let client: APIClient
    
    private var cancellables = Set<AnyCancellable>()
    
    init(client: APIClient) {
        self.client = client
    }
    
    func getSources() {
        state = .loading
        apiRequest()
            .sink { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.state = .failed(ErrorMapper(type: .everything, context: error))
                case .finished:
                    self?.state = .success
                }
            } receiveValue: { [weak self] response in
                self?.sources = response.sources
                self?.state = .success
            }
            .store(in: &cancellables)

    }
    
    func apiRequest() -> AnyPublisher<SourcesResponse, APIError> {
        return client.request(with: APIEndpoint.sources, parameters: nil)
    }
}
