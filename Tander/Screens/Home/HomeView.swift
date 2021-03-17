//
//  HomeView.swift
//  Tander
//
//  Created by Ufuk Canlı on 17.03.2021.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            TopMenuView()
            
            Spacer()
            
            ZStack {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .animation(.interpolatingSpring(stiffness: 180, damping: 100))
                        .transition(viewModel.removalTransition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    viewModel.updatePositionOf(card: card, using: value)
                                }
                                .onEnded { value in
                                    viewModel.shouldRemove(card: card, using: value)
                                }
                        )
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
