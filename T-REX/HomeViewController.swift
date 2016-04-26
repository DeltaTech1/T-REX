//
//  ViewController.swift
//  T-REX
//
//  Created by Fidel, Dyan, Elliot
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    // audio players
    var buttonClick : AVAudioPlayer?
    var percussiveHit : AVAudioPlayer?
    var trexMusic : AVAudioPlayer?
    
    // setup audio player file
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
        // Do any additional setup after loading the view, typically from a nib.
        
        // create button-click player
        if let buttonClick = self.setupAudioPlayerWithFile("button-click", type: "wav") {
            self.buttonClick = buttonClick
        }
        // create percussive-hit player
        if let percussiveHit = self.setupAudioPlayerWithFile("percussive-hit", type: "wav") {
            self.percussiveHit = percussiveHit
        }
        // create background music player
        if let trexMusic = self.setupAudioPlayerWithFile("TREXsnip", type: "mp3") {
            self.trexMusic = trexMusic
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logoutButton(sender: AnyObject) {
        percussiveHit?.play()
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func playMusic(sender: AnyObject) {
        // set volume
        trexMusic?.volume = 0.8
        // background music on infinite loop
        trexMusic?.numberOfLoops = -1
        // play music
        trexMusic?.play()
    }
    
    @IBAction func stopMusic(sender: AnyObject) {
        // stop music
        trexMusic?.stop()
    }

    @IBAction func readButton(sender: AnyObject) {
        buttonClick?.play()
    }
    
    @IBAction func eatButton(sender: AnyObject) {
        buttonClick?.play()
    }
    
    @IBAction func exerciseButton(sender: AnyObject) {
        buttonClick?.play()
    }
    
    @IBAction func trophyButton(sender: AnyObject) {
        buttonClick?.play()
    }
    
}

