//
//  ErrorView.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct ErrorView: View {
    
    var mapper: ErrorMapper
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.blue)
            Text(mapper.errorMessage)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.1))
        .ignoresSafeArea()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(mapper: ErrorMapper(type: .headlines, context: .unreachable))
    }
}
