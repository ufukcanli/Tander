//
//  HomeViewModel.swift
//  Tander
//
//  Created by Ufuk Canlı on 17.03.2021.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published private(set) var cards = Card.cards
    
    func updatePositionOf(card: Card, using value: DragGesture.Value) {
        guard isTop(card: card) else { return }
        
        let xPosition = value.translation.width
        let yPosititon = value.translation.height
        let angleRotation = Double(7 * (value.translation.width > 0 ? 1 : -1))
        
        findAndMutate(card, x: xPosition, y: yPosititon, angle: angleRotation)
    }
    
    func shouldRemove(card: Card, using value: DragGesture.Value) {
        guard isTop(card: card) else { return }
        
        switch value.translation.width {
        case 0...100:
            cards.removeLast()
        case let x where x > 100:
            cards.removeLast()
        case (-100)...(-1):
            cards.removeLast()
        case let x where x < -100:
            cards.removeLast()
        default:
            cards.removeLast()
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
}
