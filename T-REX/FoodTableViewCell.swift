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
    
    func loadItem(title title: String, image: String) {
        foodImage?.image = UIImage(named: image)
       
        foodLabel?.text = title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
