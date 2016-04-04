//
//  FoodGroupViewController.swift
//  T-REX
//
//  Created by Fidel Gonzalez on 3/15/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class FoodGroupViewController: UIViewController {

    var fruits = ["Apple", "Banana", "Grapes", "Orange", "Strawberry"]
    var vegetables = ["Broccoli", "Carrot", "Cucumber", "Potato", "Spinach"]
    var proteins = ["Beef", "Chicken", "Egg", "Fish", "Pork"]
    var dairy = ["Milk", "Cheese", "Yogurt"]
    var grains = ["Bread", "Cereal", "Pasta", "Rice"]
    
    var fruitsimage = [UIImage(named: "apple")!, UIImage(named: "banana")!, UIImage(named: "grapes")!, UIImage(named: "orange")!, UIImage(named: "strawberry")!]
    var vegetablesimage = [UIImage(named: "broccoli")!, UIImage(named: "carrot")!, UIImage(named: "cucumber")!, UIImage(named: "potato")!, UIImage(named: "spinach")!]
    var proteinsimage = [UIImage(named: "steak")!, UIImage(named: "chicken")!, UIImage(named: "egg")!, UIImage(named: "fish")!, UIImage(named: "bacon")!]
    var dairyimage = [UIImage(named: "milkbox")!, UIImage(named: "cheese")!, UIImage(named: "yogurt")!]
    var grainsimage = [UIImage(named: "bread")!, UIImage(named: "cereal")!, UIImage(named: "pasta")!, UIImage(named: "rice")!]
    
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
    
//    @IBAction func infoPressed(sender: AnyObject) {
//        performSegueWithIdentifier("showInfo", sender: self)
//    }
    
    
    
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
