//
//  ResultState.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import Foundation

enum ResultState<T: Decodable> {
    case loading
    case success(content: T)
    case failed(message: String)
}
