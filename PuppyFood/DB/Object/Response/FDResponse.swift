//
//  FDResponse.swift
//  PuppyFood
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.//

import ObjectMapper

class FDResponse: Mappable {
    var title = ""
    var version:Float = 0
    var href = ""
    var result:[FDResult] = []
    
    init(){}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        title <- map["title"]
        version <- map["version"]
        href <- map["href"]
        result <- map["results"]
    }
}

class FDResult: Mappable {
    var title = ""
    var href = ""
    var ingredients = ""
    var thumbnail = ""
    
    init(){}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        title <- map["title"]
        href <- map["href"]
        ingredients <- map["ingredients"]
        thumbnail <- map["thumbnail"]
    }
}


