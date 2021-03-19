//
//  PickerLabelView.swift
//  Tander
//
//  Created by Ufuk Canlı on 19.03.2021.
//

import SwiftUI

struct PickerLabelView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .strokeBorder(Color.primary, lineWidth: 2)
                
                Image(systemName: "paintbrush")
                    .font(.system(size: 28, weight: .regular, design: .default))
                    .foregroundColor(Color.primary)
            }
            .frame(width: 44, height: 44)
            
            Text("App Icons".uppercased())
                .fontWeight(.bold)
                .foregroundColor(Color.primary)
        }
    }
}

struct PickerLabelView_Previews: PreviewProvider {
    static var previews: some View {
        PickerLabelView()
    }
}
