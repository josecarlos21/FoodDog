//
//  FDCustomDataCell.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import ObjectMapper

class FDCustomDataCell: Mappable {
    var cType:Constant.Cell.EnumType!
    var title = ""
    var subTitle = ""
    var identifier = ""

    
    public init(type:Constant.Cell.EnumType) {
        self.cType = type
    }
    
    public init(type:Constant.Cell.EnumType, title:String) {
        self.cType = type
        self.title = title
        self.identifier = title
    }
    
    public init(type:Constant.Cell.EnumType, title:String, subTitle:String) {
        self.cType = type
        self.title = title
        self.subTitle = subTitle
        self.identifier = title
    }
    
    public init(type:Constant.Cell.EnumType, title:String, subTitle:String, identifier:String ) {
        self.cType = type
        self.title = title
        self.subTitle = subTitle
        self.identifier = identifier
    }
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {}
}





