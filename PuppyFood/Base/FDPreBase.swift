//
//  FDPreBase.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class FDPreBase: UIViewController {
    override func viewDidLoad() {
        if let navigationController = self.navigationController {
            navigationController.isNavigationBarHidden = true;
        }
        self.setThemeLightDefault()
    }
}

extension FDPreBase:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let vc = self as? FDLoginViewController {
            if textField == vc.emailTextFiel {
                vc.passwordTextFiel.becomeFirstResponder()
            }
            else if textField == vc.passwordTextFiel {
                vc.pushToController()
            }
        }
        return true
    }
}
