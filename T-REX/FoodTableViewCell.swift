//
//  FoodTableViewCell.swift
//  T-REX
//
//  Created by Fidel, Dyan, Elliot
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit
import AVFoundation

class FoodTableViewCell: UITableViewCell {
    
    // Linking storyboard table view cell items to controller
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodStepper: UIStepper!
    @IBOutlet weak var ServingLabel: UILabel!
    // set empty string variable to convert
    var title = ""
    
    func loadItem(title title: String, image: UIImage) {
        foodImage?.image = image
       
        foodLabel?.text = title
        self.title = title
        let value = NSUserDefaults.standardUserDefaults().doubleForKey(title)
        foodStepper.value = value
        // Convert Serving label value from string to integer
        ServingLabel.text = String(Int(value))
    }
    
    var buttonClick : AVAudioPlayer?
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        // path to sound file
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        var audioPlayer : AVAudioPlayer?
        
        // create audio player, catch error if not created
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        // create button-click player
        if let buttonClick = self.setupAudioPlayerWithFile("button-click", type: "wav") {
            self.buttonClick = buttonClick
        }
    }

    @IBAction func StepperPressed(sender: AnyObject) {
        buttonClick?.play()
        ServingLabel.text = String(Int(foodStepper.value))
        NSUserDefaults.standardUserDefaults().setDouble(foodStepper.value, forKey: title)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}
