//
//  CardView.swift
//  Tander
//
//  Created by Ufuk Canlı on 17.03.2021.
//

import SwiftUI

struct CardView: View {
    let card: Card
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(card.image)
                .resizable()
            
            LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(card.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text(String(card.age))
                            .font(.title)
                    }
                    
                    Text(card.bio)
                }
                .foregroundColor(.white)
            }
            .padding()
        }
        .cornerRadius(10)
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.cards[0])
    }
}
