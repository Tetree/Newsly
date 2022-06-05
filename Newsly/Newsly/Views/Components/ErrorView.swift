//
//  ErrorView.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct ErrorView: View {
    
    typealias ErrorHandlerAction = () -> Void
    
    let mapper: ErrorMapper
    let handler: ErrorHandlerAction
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 35))
            Text(mapper.errorMessage)
                .font(.title)
                .bold()
            
            Button {
                handler()
            } label: {
                Text("Retry")
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(40)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.1))
        .ignoresSafeArea()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(mapper: ErrorMapper(type: .headlines, context: .unreachable)) {
            
        }
    }
}
