//
//  CustomCell1.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

protocol CustomCell1Delegate {
    func pickerDateSelectionChanged(_ sender: UIDatePicker, forEvent event: UIEvent)
}

class CustomCell1: UITableViewCell {

    @IBOutlet weak var datePicker: UIDatePicker!
    var delegate:CustomCell1Delegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func pickerDateSelectionChanged(_ sender: UIDatePicker, forEvent event: UIEvent)
    {
        if let delegate = delegate {
            delegate.pickerDateSelectionChanged(sender, forEvent: event)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
