//
//  FoodGroupViewController.swift
//  T-REX
//
//  Created by Fidel Gonzalez on 3/15/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class FoodGroupViewController: UIViewController {

    var fruits = ["Apple", "Banana", "Orange", "Strawberries", "Pear"]
    var vegetables = ["Broccoli", "Carrots", "Spinach"]
    var proteins = ["Beef", "Chicken", "Fish"]
    var dairy = ["Milk", "Cheese", "Yogurt"]
    var grains = ["Cereal", "Rice"]
    
    var images = [UIImage(named: "apple600.png")!,UIImage(named: "Bananas.png")!,UIImage(named: "Orange.png")!,UIImage(named: "Strawberry.png")!,UIImage(named: "Pear.png")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func fruitsPressed(sender: AnyObject) {
        performSegueWithIdentifier("showTable", sender: fruits)
    }
    
    @IBAction func vegetablesPressed(sender: AnyObject) {
        performSegueWithIdentifier("showTable", sender: vegetables)
    }
    
    @IBAction func grainsPressed(sender: AnyObject) {
        performSegueWithIdentifier("showTable", sender: grains)
    }
    
    @IBAction func proteinPressed(sender: AnyObject) {
        performSegueWithIdentifier("showTable", sender: proteins)
    }
    
    @IBAction func dairyPressed(sender: AnyObject) {
        performSegueWithIdentifier("showTable", sender: dairy)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let viewController = segue.destinationViewController as! FoodViewController
        
        
        let foods = sender as! [String]
        viewController.foods = foods
        if foods == fruits {
            viewController.images = images
        }
        
        else if foods == vegetables {
            viewController.images = images
        }
        
        else if foods == grains {
            viewController.images = images
        }
        
        else if foods == proteins {
            viewController.images = images
        }
        
        else {
            viewController.images = images
        }
        
    }
    
}
