//
//  APIBuilder.swift
//  Newsly
//
//  Created by Nuno Mota on 04/06/2022.
//

import Foundation

protocol APIBuilder {
    
    var url:URL { get }
    var path:String { get }
    var httpMethod:HTTPMethod { get }
    
}
