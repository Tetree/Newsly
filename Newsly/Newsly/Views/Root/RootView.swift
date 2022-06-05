//
//  RootView.swift
//  Newsly
//
//  Created by Nuno Mota on 04/06/2022.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            NewsView(viewmodel: NewsViewModel(client: APIService()))
                .tabItem {
                    Image(systemName: "house")
                }
            
            HeadlinesView(viewmodel: HeadlinesViewModel(client: APIService()))
                .tabItem {
                    Image(systemName: "exclamationmark.circle.fill")
                }
            
            SourcesView(viewmodel: SourcesViewModel(client: APIService()))
                .tabItem {
                    Image(systemName: "person.wave.2.fill")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
