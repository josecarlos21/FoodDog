//
//  JSONHelper.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import SwiftyJSON
import ObjectMapper

class JSONHelper: NSObject {
    
        
    static func getLocal(forResource name:Constant.JSON.Catalog) -> Any?{
        guard let local = JSONHelper.getLocalDictionary(forResource:name) else {
            return nil
        }
        switch name {
        case .puppyCatalog:
            return Mapper<FDResponse>().map(JSON:local)
        }
    }

    
    private static func getLocalDictionary(forResource name:Constant.JSON.Catalog) -> [String : Any]?
    {
        if let path = Bundle.main.path(forResource: name.rawValue, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSON(data: data)
                return jsonResult.dictionaryObject
            }
            catch {
                 // handle error
            }
        }
        return nil
    }
}
