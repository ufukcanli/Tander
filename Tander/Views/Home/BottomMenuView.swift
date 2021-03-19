//
//  BottomMenuView.swift
//  Tander
//
//  Created by Ufuk Canlı on 17.03.2021.
//

import SwiftUI

struct BottomMenuView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                viewModel.refreshCards()
            } label: {
                Image("refresh")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
            }
            
            Button(action: {}) {
                Image("dismiss")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 95)
            }
            
            Button(action: {}) {
                Image("super_like")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
            }
            
            Button(action: {}) {
                Image("like")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 95)
            }
            
            Button(action: {}) {
                Image("boost")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
            }
        }
        .padding(.horizontal)
    }
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView(viewModel: HomeViewModel())
    }
}
