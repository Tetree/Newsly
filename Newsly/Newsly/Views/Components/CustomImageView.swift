//
//  CustomImageView.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI
import URLImage

struct CustomImageView: View {
    var article: NewsArticle
    
    var body: some View {
        VStack {
            if let url = URL(string: article.urlToImage) {
                
                URLImage(url, failure: { error, retry in
                    
                    PlaceholderImageView()
                    
                }) { image in
                    
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                
            }else {
                PlaceholderImageView()
            }
        }
        
    }
}

struct PlaceholderImageView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "newspaper.circle.fill")
                .foregroundColor(.white)
                .background(.gray)
                .frame(width: 100, height: 100)
        }
    }
    
}

