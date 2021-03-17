//
//  HomeView.swift
//  Tander
//
//  Created by Ufuk Canlı on 17.03.2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            TopMenuView()
            
            Spacer()
            
            ZStack {
                ForEach(Card.cards.reversed()) { card in
                    CardView(card: card)
                }
            }

            Spacer()
            
            BottomMenuView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
