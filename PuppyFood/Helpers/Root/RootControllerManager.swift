//
//  RootControllerManager.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//
import UIKit

enum FDAnimation {
    case Scale
    case Push
    case Pop
    case No
}

class RootControllerManager {
    static public func setRootViewControllerStoryBoard(name:Constant.SB.Name ,transitionAnimation animation :FDAnimation)
    {
        if let controllerVC =  UIStoryboard.getStoryBoardNavigationInitialController(name: name) {
            setRootViewControllerAnimation(controllerVC: controllerVC, transitionAnimation: animation)
        }
    }
    
    static public func setRootViewController(controllerVC:UINavigationController ,transitionAnimation animation :FDAnimation)
    {
        setRootViewControllerAnimation(controllerVC: controllerVC, transitionAnimation: animation)
    }
    
    private static func setRootViewControllerAnimation(controllerVC:UINavigationController, transitionAnimation animation:FDAnimation){
        let connectedScenes = UIApplication.shared.connectedScenes
        guard let windowScene = connectedScenes.first as? UIWindowScene else{
            return
        }
        let windows = windowScene.windows
        guard let window = windows.first else {
            return
        }
        switch animation {
        case .Scale:
            window.setRootViewController3D(controllerVC: controllerVC)
            break
        case .Push:
            window.setRootViewController(controllerVC, options: UIWindow.TransitionOptions(direction: .toRight))
            break
        case .Pop:
            window.setRootViewController(controllerVC, options: UIWindow.TransitionOptions(direction: .toLeft))
            break
        default:
            window.rootViewController = controllerVC
            window.makeKeyAndVisible()
        }
    }
    
    static public func getCurrentNavegation() -> UINavigationController?{
        let connectedScenes:Set<UIScene> = UIApplication.shared.connectedScenes
        guard let windowScene:UIWindowScene = connectedScenes.first as? UIWindowScene else{
            return nil
        }
        let windows = windowScene.windows
        guard let window = windows.first else {
            return nil
        }
        guard let navegation = window.rootViewController as? UINavigationController else{
            return nil
        }
        return navegation
    }
    
    static public func getCurrentViewController() -> UIViewController?{
        guard let navegation = RootControllerManager.getCurrentNavegation() else{
            return nil
        }
        return navegation.visibleViewController
    }
    
    static public func getRootViewController() -> UIViewController?{
        guard let navegation = RootControllerManager.getCurrentNavegation() else{
            return nil
        }
        return navegation.viewControllers[0]
    }
}
