//
//  CustomProgressView.swift
//  Newsly
//
//  Created by Nuno Mota on 05/06/2022.
//

import SwiftUI

struct CustomProgressView: View {
    var body: some View {
        VStack {
            ProgressView()
                .scaleEffect(2)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
    }
}

struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView()
    }
}
