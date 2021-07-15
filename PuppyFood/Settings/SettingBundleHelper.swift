//
//  SettingsBundleHelper.swift
//  AforeMovil
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

class SettingsBundleHelper {
   
    
    class func getDefaultSetting(){
        let isShowTour = UDManager.getUserDefaultsBool(name: .Tour)
        UDManager.saveUserDefaults(value: isShowTour, name: .Tour)
    }
    

    class func setVersionAndBuildNumber() {
        if let version: String = Bundle.main.object(forInfoDictionaryKey: Constant.App.Version) as? String {
            UserDefaults.standard.set(version, forKey: Constant.UD.Key.Version.rawValue)
        }
        if let subversion: String = Bundle.main.object(forInfoDictionaryKey: Constant.App.SubVersion) as? String {
            UserDefaults.standard.set(subversion, forKey: Constant.UD.Key.SubVersion.rawValue)
        }

    }
    
}
