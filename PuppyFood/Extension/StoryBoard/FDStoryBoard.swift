//
//  FDStoryBoard.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

extension UIStoryboard {
    static func getStoryBoardNavigationInitialController(name:Constant.SB.Name) -> UINavigationController?
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: name.rawValue, bundle: nil)
        guard let controllerVC = storyBoard.instantiateInitialViewController() as? UINavigationController else {
            return nil
        }
        return controllerVC
    }
    
    static func getStoryBoardInitialController(name:Constant.SB.Name) -> UIViewController?
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: name.rawValue, bundle: nil)
        guard let controllerVC = storyBoard.instantiateInitialViewController() else {
            return nil
        }
        return controllerVC
    }
    
    static func getStoryBoardInitialController(name:Constant.SB.Name, withIdentifier:Constant.SB.Identifier) -> UIViewController
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: name.rawValue, bundle: nil)
        return storyBoard.instantiateViewController(identifier: withIdentifier.rawValue)
    }
}
