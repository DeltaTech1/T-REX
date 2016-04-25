//
//  ServingViewController.swift
//  T-REX
//
//  Created by Fidel Gonzalez on 3/22/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit
import AVFoundation

class ServingViewController: UIViewController {
    
    var percussiveHit : AVAudioPlayer?
    
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
        
        // create percussive-hit player
        if let percussiveHit = self.setupAudioPlayerWithFile("percussive-hit", type: "wav") {
            self.percussiveHit = percussiveHit
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func moreButton(sender: AnyObject) {
        percussiveHit?.play()
    }
    

}
