//
//  TopMenuView.swift
//  Tander
//
//  Created by Ufuk Canlı on 17.03.2021.
//

import SwiftUI

struct TopMenuView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("profile")
            }
            
            Spacer()
            
            Button(action: {}) {
                Image("tinder-icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 45)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image("chats")
            }
        }
        .padding(.horizontal)
    }
}

struct TopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuView()
    }
}
