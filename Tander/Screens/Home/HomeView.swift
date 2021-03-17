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
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    withAnimation {
                                        viewModel.updatePositionOf(card: card, using: value)
                                    }
                                }
                                .onEnded { value in
                                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                                        viewModel.shouldRemove(card: card, using: value)
                                    }
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
