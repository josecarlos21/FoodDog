//
//  API.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class API {
    static let share = API()
    var catalog = Catalog()
}

class Catalog {
    var puppyCatalog = FDResponse()
}
