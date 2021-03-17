//
//  Card.swift
//  Tander
//
//  Created by Ufuk Canlı on 17.03.2021.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let age: Int
    let bio: String
    
    var xPosition: CGFloat = 0.0
    var yPosition: CGFloat = 0.0
    var rotationAngle: Double = 0.0
    
    static let cards = [
        Card(name: "Rosie", image: "p0", age: 21, bio: "Insta - roooox 💋"),
        Card(name: "Betty", image: "p1", age: 23, bio: "Like exercising, going out, pub, working 🍻"),
        Card(name: "Abigail", image: "p2", age: 26, bio: "hi, let's be friends"),
        Card(name: "Zoé", image: "p3", age: 20, bio: "Law grad"),
        Card(name: "Tilly", image: "p4", age: 21, bio: "Follow me on IG"),
        Card(name: "Penny", image: "p5", age: 24, bio: "J'aime la vie et le vin 🍷"),
    ]
}
