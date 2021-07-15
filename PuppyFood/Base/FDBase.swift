//
//  FDBase.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class FDBase: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setThemeLightDefault()
        setApparenceHome()
    }
}

extension FDBase {
    func setNavigationBarHidden(_ hidden:Bool, animated:Bool) {
        if let navigationController = self.navigationController {
            navigationController.setNavigationBarHidden(hidden, animated: animated)
        }
    }
    
    func setNavenationLeftButton(){
        navigationItem.hidesBackButton = true
    }
    
    func setApparenceHome(){
        if self.navigationController != nil
        {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.custom(text: .Primary)]
            appearance.titleTextAttributes = [.foregroundColor: UIColor.custom(text: .Primary)]
            appearance.backgroundColor = UIColor.custom(background:.Primary)
            appearance.shadowColor = UIColor.custom(background:.Primary)
                        
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.compactAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = .always
            
            
            
            appearance.shadowImage = UIImage()
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.shadowImage = UIImage()
        }
    }
}
