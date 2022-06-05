//
//  NewsView.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewmodel: NewsViewModel
    
    var body: some View {
        VStack {
            switch viewmodel.state {
            case .loading:
                CustomProgressView()
                
            case .success:
                NavigationView {
                    List(viewmodel.articles) { article in
                        ArticleRowView(presentable: article)
                    }
                }
                .navigationBarTitle("News")
            case .failed(let mapper):
                ErrorView(mapper: mapper, handler: viewmodel.getArticles)
            }
            
        }
        .onAppear(perform: viewmodel.getArticles)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(viewmodel: NewsViewModel(client: APIService()))
    }
}
