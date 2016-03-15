//
//  FoodTableViewCell.swift
//  T-REX
//
//  Created by Elliot on 3/4/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodStepper: UIStepper!
    @IBOutlet weak var ServingLabel: UILabel!
    var title = ""
    
    func loadItem(title title: String, image: UIImage) {
        foodImage?.image = image
       
        foodLabel?.text = title
        self.title = title
        let value = NSUserDefaults.standardUserDefaults().doubleForKey(title)
        foodStepper.value = value
        
        ServingLabel.text = String(Int(value))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func StepperPressed(sender: AnyObject) {
        ServingLabel.text = String(Int(foodStepper.value))
        NSUserDefaults.standardUserDefaults().setDouble(foodStepper.value, forKey: title)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}
