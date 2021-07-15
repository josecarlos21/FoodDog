//
//  UiViewController+ThemeLightDark.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

extension UIViewController {
    func setThemeLightDefault(){
        switch overrideUserInterfaceStyle {
        case .light:
            overrideUserInterfaceStyle = .light
            break
        case .dark:
            overrideUserInterfaceStyle = .light
            break
        case .unspecified:
            overrideUserInterfaceStyle = .light
            break
        @unknown default:
            overrideUserInterfaceStyle = .light
        }
    }
}
