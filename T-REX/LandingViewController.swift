//
//  LandingViewController.swift
//  T-REX
//
//  Created by Fidel, Dyan, Elliot
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit
import AVFoundation

class LandingViewController: UIViewController {
    
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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tylerView.center.x = tylerView.center.x - self.view.frame.width
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1.5) {
            self.tylerView.center.x = self.tylerView.center.x + self.view.frame.width
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func startButton(sender: AnyObject) {
        // play button sound
        percussiveHit?.play()
    }
    
    @IBOutlet weak var tylerView: UIImageView!

}
