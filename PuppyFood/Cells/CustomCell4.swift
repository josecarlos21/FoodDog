//
//  CustomCell4.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class CustomCell4: UITableViewCell {

    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var cSwitch: UISwitch!
    
    @IBAction func onTapSwitch(_ sender: UISwitch, forEvent event: UIEvent) {
        
    }
        
    func set(title:String?){
        if let value = title {
            lblText.text = value
        }
        else {
            lblText.text = ""
        }
        lblText.textColor = UIColor.custom(text: .Black)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
