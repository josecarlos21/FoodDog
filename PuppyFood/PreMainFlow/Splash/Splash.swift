//
//  ViewController.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class Splash: FDPreBase {
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var lblVersion: FDLabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        activity.isHidden = true
        lblVersion.text = "\(UDManager.getUserDefaultsString(name: .Version)) (\(UDManager.getUserDefaultsString(name: .SubVersion)))"
        lblVersion.alpha = 0.0
        loadCatalog()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        afterTimeRootController()
        UIView.animate(withDuration: 1.0) {
            self.lblVersion.alpha = 1.0
        }
    }
    
    private func afterTimeRootController(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            RootControllerManager.setRootViewControllerStoryBoard(name: .PreMain, transitionAnimation: .Scale)
        }
    }
}

extension Splash {
    func loadCatalog(){
        if let catalog = JSONHelper.getLocal(forResource: .puppyCatalog) as? FDResponse {
            API.share.catalog.puppyCatalog = catalog
        }
    }
}

