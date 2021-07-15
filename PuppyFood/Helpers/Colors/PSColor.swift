//
//  PSColor.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

extension UIColor {
    static func custom(background color:Color.BackGround) -> UIColor
    { return UIColor(named: color.rawValue) ?? Color.NotFound }
    
    static func custom(text color:Color.Text) -> UIColor
    { return UIColor(named: color.rawValue) ?? Color.NotFound }
    
    static func custom(placeholder color:Color.PlaceHolder) -> UIColor
    { return UIColor(named: color.rawValue) ?? Color.NotFound }
}

struct Color {
    static let NotFound = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    enum BackGround:String {
        case Primary = "PrimaryColor"
        case Second = "SecondColor"
        case Thirt = "ThirtColor"
    }
    enum Text:String {
        case Primary = "TextPrimaryColor"
        case Second = "TextSecondColor"
        case Thirt = "TextThirtColor"
        case Black = "TextBlackColor"
        case Green = "TextGreenColor"
    }
    enum PlaceHolder:String {
        case Primary = "PlaceHolderColor"
    }
}

