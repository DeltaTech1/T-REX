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
    var vegetables = ["Broccoli", "Carrots", "Spinach", "Cucumber", "Potato"]
    var proteins = ["Beef", "Chicken", "Fish", "Turkey", "Eggs"]
    var dairy = ["Milk", "Cheese", "Yogurt", "Ice Cream"]
    var grains = ["Cereal", "Rice", "Bread", "Oatmeal", "Pasta"]
    
    var fruitsimage = [UIImage(named: "apple1")!,UIImage(named: "Bananas")!,UIImage(named: "Orange")!,UIImage(named: "Strawberry")!,UIImage(named: "Pear")!]
    var vegetablesimage = [UIImage(named: "broccoli1")!,UIImage(named: "carrots")!,UIImage(named: "spinach")!,UIImage(named: "cucumber")!,UIImage(named: "potato")!]
    var proteinsimage = [UIImage(named: "beef1")!,UIImage(named: "chicken")!,UIImage(named: "fish")!,UIImage(named: "turkey")!,UIImage(named: "eggs")!]
    var dairyimage = [UIImage(named: "milk")!,UIImage(named: "Cheese")!,UIImage(named: "yogurt")!,UIImage(named: "icecream")!]
    var grainsimage = [UIImage(named: "cereal")!,UIImage(named: "rice")!,UIImage(named: "bread")!,UIImage(named: "oatmeal")!,UIImage(named: "pasta")!]
    
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
            viewController.images = fruitsimage
        }
        
        else if foods == vegetables {
            viewController.images = vegetablesimage
        }
        
        else if foods == grains {
            viewController.images = grainsimage
        }
        
        else if foods == proteins {
            viewController.images = proteinsimage
        }
        
        else {
            viewController.images = dairyimage
        }
        
    }
    
}
