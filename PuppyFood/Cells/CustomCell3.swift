//
//  CustomCell3.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class CustomCell3: UITableViewCell {

    var isShowDatePicker = false
    
    @IBOutlet weak var lblSave: UILabel!
    @IBOutlet weak var leftDateButton: UIButton!
    @IBOutlet weak var dateTextFiel: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(title:String?){
        if let value = title {
            leftDateButton.setTitle(value, for: .normal)
        }
        else {
            leftDateButton.setTitle("", for: .normal)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
