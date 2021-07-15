//
//  BaseReponse.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import ObjectMapper

class BaseReponse: Mappable {
    required init?(map: Map) {}
    init() {}
    func mapping(map: Map) {}
}
