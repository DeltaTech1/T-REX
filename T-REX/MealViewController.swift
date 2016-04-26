//
//  MealViewController.swift
//  T-REX
//
//  Created by Fidel, Dyan, Elliot
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit
import AVFoundation

class MealViewController: UIViewController {
    
    var buttonClick : AVAudioPlayer?
    
    // setup audio player
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        // path to sound file
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        // create audio player, catch error if not created
        var audioPlayer : AVAudioPlayer?
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // create button-click player
        if let buttonClick = self.setupAudioPlayerWithFile("button-click", type: "wav") {
            self.buttonClick = buttonClick
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func breakfastButton(sender: AnyObject) {
        buttonClick?.play()
    }

    @IBAction func lunchButton(sender: AnyObject) {
        buttonClick?.play()
    }
    
    @IBAction func dinnerButton(sender: AnyObject) {
        buttonClick?.play()
    }

    @IBAction func snackButton(sender: AnyObject) {
        buttonClick?.play()
    }
    
}
