//
//  FDCatalogResp.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import ObjectMapper

class FDCatalogResp: Mappable {
    var name = ""
    var catalog:[FDCatalogResp] = []
    
    init(){}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["nombre"]
        catalog <- map["contenido"]
    }
}
