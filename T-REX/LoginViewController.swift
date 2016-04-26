//
//  LoginViewController.swift
//  T-REX
//
//  Created by Fidel, Dyan, Elliot
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit
import AVFoundation

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // when username textfield is pressed, show keyboard
    @IBAction func usernameKeyboard(sender: AnyObject) {
        self.usernameTextfield.becomeFirstResponder()
    }
    
    // when password textfield is pressed, show keyboard
    @IBAction func passwordKeyboard(sender: AnyObject) {
        self.passwordTextfield.becomeFirstResponder()
    }

    // while keyboard is showing, touch outside textfields to dismiss keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.usernameTextfield.resignFirstResponder()
        self.passwordTextfield.resignFirstResponder()
    }
    
    // while keyboard is showing, tap return key to dismiss keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        usernameTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        return true
    }
    
    // audio player
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
        
        self.usernameTextfield.delegate = self
        self.passwordTextfield.delegate = self
        
        // create button-click player
        if let buttonClick = self.setupAudioPlayerWithFile("button-click", type: "wav") {
            self.buttonClick = buttonClick
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // action when login button is pressed
    @IBAction func loginButton(sender: AnyObject) {
        
        // play button sound
        buttonClick?.play()
        
        // entered username, password
        let username = usernameTextfield.text
        let password = passwordTextfield.text
        
        // stored username, password
        let usernameStored = NSUserDefaults.standardUserDefaults().stringForKey("username")
        let passwordStored = NSUserDefaults.standardUserDefaults().stringForKey("password")
        
        // Check if usernames and passwords match
        if (usernameStored == username) {
            if (passwordStored == password) {
                // Login successful, go to home screen
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
                NSUserDefaults.standardUserDefaults().synchronize()
                performSegueWithIdentifier("segueToHomeScreen", sender: nil)
            } else {
                // Display alert for wrong password
                let alert = UIAlertController(title: "Alert", message: "Wrong password", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        } else {
            // Display alert if username does not exist
            let alert = UIAlertController(title: "Alert", message: "That username does not exist", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }

    }
   
    @IBAction func newUser(sender: AnyObject) {
        // play button sound
        buttonClick?.play()
    }
    

}
