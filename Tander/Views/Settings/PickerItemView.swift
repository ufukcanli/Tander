//
//  PickerItemView.swift
//  Tander
//
//  Created by Ufuk Canlı on 19.03.2021.
//

import SwiftUI

struct PickerItemView: View {
    let iconName: String
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: iconName)!)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .cornerRadius(8)
                            
            Text(iconName)
                .frame(alignment: .leading)
        }
        .padding(3)
    }
}

struct PickerItemView_Previews: PreviewProvider {
    static var previews: some View {
        PickerItemView(iconName: "Blue")
    }
}
