//
//  SettingsView.swift
//  Tander
//
//  Created by Ufuk Canlı on 19.03.2021.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
        
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose the app icon")) {
                    Picker(selection: $viewModel.currentIndex, label: PickerLabelView()) {
                        ForEach(0..<viewModel.iconNames.count) { index in
                            PickerItemView(iconName: viewModel.iconNames[index] ?? "Blue")
                        }
                    }
                    .onReceive([viewModel.currentIndex].publisher.first(), perform: viewModel.setAlternateIcon)
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        viewModel.dismissSettings()
                    } label: {
                        Text("Done")
                    }
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel(isShowing: .constant(true)))
    }
}
