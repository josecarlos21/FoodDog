//
//  UDManager.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit



internal class UDManager {
    //MARK: - Custom User Defaultu
    static func getUserDefaultsBool(name key:Constant.UD.Key) -> Bool {
        if let value = UDManager.getUserDefaults(name: key) as? Bool {
            return value
        }
        return false
    }
    
    static func getUserDefaultsInterger(name key:Constant.UD.Key) -> Int {
        if let value = UDManager.getUserDefaults(name: key) as? Int {
            return value
        }
        return 0
    }
    
    static func getUserDefaultsIntBadge(name key:Constant.UD.Key) -> Int {
        if let value = UDManager.getUserDefaults(name: key) as? Int {
            return value
        }
        return UIApplication.shared.applicationIconBadgeNumber >= 0 ? UIApplication.shared.applicationIconBadgeNumber : 0
    }
    
    static func getUserDefaultsString(name key:Constant.UD.Key) -> String {
        if let value = UDManager.getUserDefaults(name: key) as? String {
            return value
        }
        return ""
    }
    
    static func getUserDefaultsDate(name key:Constant.UD.Key) -> Date {
        if let value = UDManager.getUserDefaults(name: key) as? Date {
            return value
        }
        return Date()
    }
    
    static func getUserDefaultsArray(name key:Constant.UD.Key) -> [Any]? {
        if let value = UDManager.getUserDefaults(name: key) as? [Any] {
            return value
    }
        return nil
    }
    
    static func getUserDefaultsDictionary (name key:Constant.UD.Key) -> [String:Any]? {
        if let value = UDManager.getUserDefaults(name: key) as? [String:Any] {
            return value
        }
        return nil
    }
    
    //MARK: - Base Save User Default
    static func saveUserDefaults<T>(value element:T, name key:Constant.UD.Key) {
        UserDefaults.standard.set(element, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static func deleteUserDefaults(name key:Constant.UD.Key)  {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static private func getUserDefaults(name key:Constant.UD.Key) -> Any? {
        if let value = UserDefaults.standard.object(forKey: key.rawValue)  {
            return value
        }
        return nil
    }
}
