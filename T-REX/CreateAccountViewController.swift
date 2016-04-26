//
//  CreateAccountViewController.swift
//  T-REX
//
//  Created by Fidel, Dyan, Elliot
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit
import AVFoundation

class CreateAccountViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmTextfield: UITextField!
    
    // when username textfield is pressed, show keyboard
    @IBAction func usernameKeyboard(sender: AnyObject) {
        self.usernameTextfield.becomeFirstResponder()
    }
    
    // when password textfield is pressed, show keyboard
    @IBAction func passwordKeyboard(sender: AnyObject) {
        self.passwordTextfield.becomeFirstResponder()
    }
    
    // when confirm password textfield is pressed, show keyboard
    @IBAction func confirmKeyboard(sender: AnyObject) {
        self.confirmTextfield.becomeFirstResponder()
    }
    
    // while keyboard is showing, touch outside textfields to dismiss keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.usernameTextfield.resignFirstResponder()
        self.passwordTextfield.resignFirstResponder()
        self.confirmTextfield.resignFirstResponder()
    }
    
    // while keyboard is showing, tap return key to dismiss keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        usernameTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        confirmTextfield.resignFirstResponder()
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
        self.confirmTextfield.delegate = self
        
        // create button-click player
        if let buttonClick = self.setupAudioPlayerWithFile("button-click", type: "wav") {
            self.buttonClick = buttonClick
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // action when create button is pressed
    @IBAction func createButton(sender: AnyObject) {
        
        // play button sound
        buttonClick?.play()
        
        // entered username, password, confirm password
        let username = usernameTextfield.text
        let password = passwordTextfield.text
        let confirm = confirmTextfield.text
        
        // Check for empty fields
        if (username!.isEmpty || password!.isEmpty || confirm!.isEmpty) {
            // Display alert message if there are empty fields
            let alert = UIAlertController(title: "Alert", message: "All fields are required", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        // Check if password matches confirm password
        if (password != confirm) {
            // Display alert message if passwords don't match
            let alert = UIAlertController(title: "Alert", message: "Passwords do not match", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        // Store username and password
        NSUserDefaults.standardUserDefaults().setObject(username, forKey: "username")
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "password")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        // Display alert message with confirmation
        let alert = UIAlertController(title: "Success", message: "You have created an account", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func cancelButton(sender: AnyObject) {
        // play button sound
        buttonClick?.play()
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
