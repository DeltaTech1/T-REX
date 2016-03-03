//
//  LoginViewController.swift
//  T-REX
//
//  Created by Elliot on 1/28/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButton(sender: AnyObject) {
        
        let username = usernameTextfield.text
        let password = passwordTextfield.text
        
        let usernameStored = NSUserDefaults.standardUserDefaults().stringForKey("username")
        let passwordStored = NSUserDefaults.standardUserDefaults().stringForKey("password")
        
        // Check if usernames and passwords match
        if (usernameStored == username) {
            if (passwordStored == password) {
                // Login successful
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
   

}
