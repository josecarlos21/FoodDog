//
//  FDLoginViewController.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class FDLoginViewController: FDPreBase {
    @IBOutlet weak var emailTextFiel: FDTextFielLogin!
    @IBOutlet weak var passwordTextFiel: FDTextFielLogin!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        loginButton.alpha = 0.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 1.0) {
            self.loginButton.alpha = 1.0
            self.loginButton.setTitleColor(UIColor.custom(text: .Primary), for: .normal)
        }
    }
    
    func setDelegate(){
        emailTextFiel.delegate = self
        passwordTextFiel.delegate = self
    }

    @IBAction func loginApp(_ sender: UIButton) {
        self.pushToController()
    }
    
    func pushToController() {

    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let navegation = segue.destination as? UINavigationController {
            RootControllerManager.setRootViewController(controllerVC: navegation, transitionAnimation: .Push)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let isShouldPerformSegue = UDManager.getUserDefaultsBool(name: .Tour)
        defer {
            if !isShouldPerformSegue {
                if let controler = UIStoryboard.getStoryBoardInitialController(name:.Tour){
                    if let navigationController = self.navigationController {
                        if UIDevice().userInterfaceIdiom == .pad {
                            self.present(controler, animated: true, completion: nil)
                        }
                        else{
                            navigationController.pushViewController(controler, animated: true)
                        }
                     
                    }
                }
            }
        }
        return isShouldPerformSegue
    }
    
    
}

