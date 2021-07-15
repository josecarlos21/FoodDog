//
//  FDCloncluded.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import ObjectMapper

class FDHomeResponse: BaseReponse {
    public var tracking:[FDFoodDogs] = []

    open override func mapping(map: Map) {
        tracking <- map["tracking"]
    }
}

class FDFoodDogs:Mappable {
    public var id = ""
    public var imagen = ""
    public var headerTitle = ""
    public var detailTitle = ""
    public var status = ""
    public var priority = ""
    public var meetingDate = ""
    public var agreementDate = ""
    public var commitmentDate = ""
    public var description = ""
    
    
    required init?(map: Map) {}
    func mapping(map: Map) {
        id <- map["ID"]
        imagen <- map["imagen"]
        headerTitle <- map["headerTitle"]
        detailTitle <- map["detailTitle"]
        status <- map["status"]
        priority <- map["priority"]
        meetingDate <- map["meetingDate"]
        agreementDate <- map["agreementDate"]
        commitmentDate <- map["commitmentDate"]
        description <- map["description"]
    }
}

