//
//  SettingsViewModel.swift
//  Tander
//
//  Created by Ufuk Canlı on 19.03.2021.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    
    @Published var currentIndex = 0
    var iconNames = [String?]()
    
    @Binding var isShowing: Bool
    
    init(isShowing: Binding<Bool>) {
        _isShowing = isShowing
            
        getAlternateIconNames()
        
        if let currentIcon = UIApplication.shared.alternateIconName {
            currentIndex = iconNames.firstIndex(of: currentIcon) ?? 0
        }
    }
    
    private func getAlternateIconNames() {
        if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
           let alternateIcons = icons["CFBundleAlternateIcons"] as? [String: Any] {
            for (_, value) in alternateIcons {
                guard let iconList = value as? Dictionary<String, Any> else { return }
                guard let iconFiles = iconList["CFBundleIconFiles"] as? [String] else { return }
                guard let icon = iconFiles.first else { return }
                iconNames.append(icon)
            }
        }
    }
    
    func setAlternateIcon(value: Int) {
        let index = iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
        if index != value {
            UIApplication.shared.setAlternateIconName(iconNames[value]) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Success! You have changed the app icon.")
                }
            }
        }
    }
}
