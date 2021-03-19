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
            TopMenuView(viewModel: viewModel)
            
            Spacer()
            
            ZStack {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .shadow(color: Color.black.opacity(0.2), radius: 2)
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
            .zIndex(1)

            Spacer()
            
            BottomMenuView(viewModel: viewModel)
        }
        .sheet(isPresented: $viewModel.isShowingSettings) {
            SettingsView(viewModel: SettingsViewModel(isShowing: $viewModel.isShowingSettings))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
