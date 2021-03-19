//
//  HomeViewModel.swift
//  Tander
//
//  Created by Ufuk Canlı on 17.03.2021.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var isShowingSettings = false
    
    @Published private(set) var cards = Card.cards
    @Published private(set) var removalTransition = AnyTransition.trailingBottom
    
    private let dragThreshold: CGFloat = 120.0
    
    func updatePositionOf(card: Card, using value: DragGesture.Value) {
        guard isTop(card: card) else { return }
        
        let xPosition = value.translation.width
        let yPosititon = value.translation.height
        let angleRotation = Double(7 * (value.translation.width > 0 ? 1 : -1))
        
        findAndMutate(card, x: xPosition, y: yPosititon, angle: angleRotation)
        setRemovalTransition(using: xPosition)
    }
    
    func shouldRemove(card: Card, using value: DragGesture.Value) {
        guard isTop(card: card) else { return }

        let xPosition = value.translation.width
        
        if xPosition < -dragThreshold || xPosition > dragThreshold {
            cards.removeLast()
        } else {
            findAndMutate(card, x: 0.0, y: 0.0, angle: 0.0)
        }
    }
    
    func setRemovalTransition(using xPosition: CGFloat) {
        if xPosition < -dragThreshold {
            removalTransition = .leadingBottom
        }
        if xPosition > dragThreshold {
            removalTransition = .trailingBottom
        }
    }
    
    private func findAndMutate(_ card: Card, x: CGFloat, y: CGFloat, angle: Double) {
        cards = cards.map { immutableCard in
            var mutableCard = immutableCard
            if mutableCard.id == card.id {
                mutableCard.xPosition = x
                mutableCard.yPosition = y
                mutableCard.rotationAngle = angle
            }
            return mutableCard
        }
    }
    
    private func isTop(card: Card) -> Bool {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
            return false
        }
        return index == cards.count - 1
    }
    
    func displaySettings() {
        isShowingSettings = true
    }
}
