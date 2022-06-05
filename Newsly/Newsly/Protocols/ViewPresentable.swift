//
//  ViewPresentable.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import Foundation

protocol ViewPresentable {
    var headline:String { get }
    var subheadline:String { get }
    var imageURLPath:String { get }
}
