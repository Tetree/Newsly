//
//  HeadlinesView.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct HeadlinesView: View {
    
    @StateObject var viewmodel: HeadlinesViewModel
    
    var body: some View {
        Group {
            switch viewmodel.state {
            case .loading:
                ProgressView()
                    .scaleEffect(2)
            case .success:
                NavigationView {
                    List(viewmodel.headlines) { headlines in
                        ArticleRowView(article: headlines)
                    }
                }
                .navigationBarTitle("News")
            case .failed(let mapper):
                ErrorView(mapper: mapper, handler: viewmodel.getArticles)
            }
            
        }.onAppear(perform: viewmodel.getArticles)
    }
}

struct HeadlinesView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlinesView(viewmodel: HeadlinesViewModel(client: APIService()))
    }
}
