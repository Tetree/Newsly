//
//  SourcesView.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct SourcesView: View {
    
    @StateObject var viewmodel: SourcesViewModel
    
    var body: some View {
        VStack {
            switch viewmodel.state {
            case .loading:
                CustomProgressView()
            case .success:
                NavigationView {
                    List(viewmodel.sources) { source in
                        ArticleRowView(presentable: source)
                    }
                }
                .navigationBarTitle("News Sources")
            case .failed(let mapper):
                ErrorView(mapper: mapper, handler: viewmodel.getSources)
            }
            
        }.onAppear(perform: viewmodel.getSources)
    }
}

struct SourcesView_Previews: PreviewProvider {
    static var previews: some View {
        SourcesView(viewmodel: SourcesViewModel(client: APIService()))
    }
}
