//
//  FDHomeTableViewCell.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class CustomCell0: UITableViewCell {
    @IBOutlet weak var customImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMedium: UILabel!
    @IBOutlet weak var lblBottom: UILabel!
    @IBOutlet weak var lblRight: UILabel!
    
    func setData(imageName:String?,topText:String?,
                 mediumText:String?,bottom:String?,rightText:String?)
    {
        if let value = imageName {
            customImage.image = UIImage(named: value)
        }
        if let value = topText {
            lblTitle.text = value
        }
        if let value = mediumText {
            lblMedium.text = value
        }
        if let value = bottom {
            lblBottom.text = value
        }
        if let value = rightText {
            lblRight.text = value
        }
        
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
