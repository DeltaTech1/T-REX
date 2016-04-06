//
//  FoodGroupViewController.swift
//  T-REX
//
//  Created by Fidel Gonzalez on 3/15/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class FoodGroupViewController: UIViewController {
    
    // Linking progress view bars from storyboard to controller
    @IBOutlet weak var fruitsProgress: UIProgressView!
    @IBOutlet weak var veggiesProgress: UIProgressView!
    @IBOutlet weak var grainsProgress: UIProgressView!
    @IBOutlet weak var proteinProgress: UIProgressView!
    @IBOutlet weak var dairyProgress: UIProgressView!
    
    // maximum servings for each food group
    var fruitMax = 3
    var veggieMax = 4
    var grainMax = 9
    var proteinMax = 2
    var dairyMax = 2
    
    // array for each food group
    var fruits = ["Apple", "Banana", "Grapes", "Orange", "Strawberry"]
    var vegetables = ["Broccoli", "Carrot", "Cucumber", "Potato", "Spinach"]
    var proteins = ["Beef", "Chicken", "Egg", "Fish", "Pork"]
    var dairy = ["Milk", "Cheese", "Yogurt"]
    var grains = ["Bread", "Cereal", "Pasta", "Rice"]
    
    // image array for each food group
    var fruitsimage = [UIImage(named: "apple")!, UIImage(named: "banana")!, UIImage(named: "grapes")!, UIImage(named: "orange")!, UIImage(named: "strawberry")!]
    var vegetablesimage = [UIImage(named: "broccoli")!, UIImage(named: "carrot")!, UIImage(named: "cucumber")!, UIImage(named: "potato")!, UIImage(named: "spinach")!]
    var proteinsimage = [UIImage(named: "steak")!, UIImage(named: "chicken")!, UIImage(named: "egg")!, UIImage(named: "fish")!, UIImage(named: "bacon")!]
    var dairyimage = [UIImage(named: "milkbox")!, UIImage(named: "cheese")!, UIImage(named: "yogurt")!]
    var grainsimage = [UIImage(named: "bread")!, UIImage(named: "cereal")!, UIImage(named: "pasta")!, UIImage(named: "rice")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // initial fruit count
        var fruitSum = 0
        // Calculate sum of fruits
        for title in fruits {
            let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
            fruitSum += Int(individualCount)
        }
        
        // Change color of fruit progress bar
        // if fruit count is less than max servings, color is blue
        if (fruitSum < fruitMax) {
            fruitsProgress.progressTintColor = UIColor.blueColor()
            // if fruit count is equal to max servings, color is green
        } else if (fruitSum == fruitMax) {
            fruitsProgress.progressTintColor = UIColor.greenColor()
            // if fruit count is greater than max servings, color is red
        } else {
            fruitsProgress.progressTintColor = UIColor.redColor()
        }
        
        // Change fruit progress
        fruitsProgress.progress = Float(fruitSum) / Float (fruitMax)
        
        // initial veggie count
        var veggieSum = 0
        // Calculate sum of vegetables
        for title in vegetables {
            let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
            veggieSum += Int(individualCount)
        }
        
        // Change color of veggie progress bar
        // if veggie count is less than max servings, color is blue
        if (veggieSum < veggieMax) {
            veggiesProgress.progressTintColor = UIColor.blueColor()
            // if veggies count is equal to max servings, color is green
        } else if (veggieSum == veggieMax) {
            veggiesProgress.progressTintColor = UIColor.greenColor()
            // if veggie count is greater than max servings, color is red
        } else {
            veggiesProgress.progressTintColor = UIColor.redColor()
        }
        
        // Change veggie progress
        veggiesProgress.progress = Float(veggieSum) / Float (veggieMax)
        
        // initial grain count
        var grainSum = 0
        // Calculate sum of grains
        for title in grains {
            let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
            grainSum += Int(individualCount)
        }
        
        // Change color of grain progress bar
        // if grain count is less than max servings, color is blue
        if (grainSum < grainMax) {
            grainsProgress.progressTintColor = UIColor.blueColor()
            // if grain count is equal to max servings, color is green
        } else if (grainSum == grainMax) {
            grainsProgress.progressTintColor = UIColor.greenColor()
            // if grain count is greater than max servings, color is red
        } else {
            grainsProgress.progressTintColor = UIColor.redColor()
        }
        
        // Change grains progress
        grainsProgress.progress = Float(grainSum) / Float (grainMax)
        
        // intial protein count
        var proteinSum = 0
        // Calculate sum of proteins
        for title in proteins {
            let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
            proteinSum += Int(individualCount)
        }
        
        // Change color of protein progress bar
        // if protein count is less than max servings, color is blue
        if (proteinSum < proteinMax) {
            proteinProgress.progressTintColor = UIColor.blueColor()
            // if protein count is equal to max servings, color is green
        } else if (proteinSum == proteinMax) {
            proteinProgress.progressTintColor = UIColor.greenColor()
            // if protein count is greater than max servings, color is red
        } else {
            proteinProgress.progressTintColor = UIColor.redColor()
        }
        
        // Change protein progress
        proteinProgress.progress = Float(proteinSum) / Float (proteinMax)
        
        // initial dairy count
        var dairySum = 0
        // Calculate sum of dairy
        for title in dairy {
            let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
            dairySum += Int(individualCount)
        }
        
        // Change color of dairy progress bar
        // if dairy count is less than max servings, color is blue
        if (dairySum < dairyMax) {
            dairyProgress.progressTintColor = UIColor.blueColor()
            // if dairy count is equal to max servings, color is green
        } else if (dairySum == dairyMax) {
            dairyProgress.progressTintColor = UIColor.greenColor()
            // if dairy count is greater than max servings, color is red
        } else {
            dairyProgress.progressTintColor = UIColor.redColor()
        }
        
        // Change dairy progress
        dairyProgress.progress = Float(dairySum) / Float (dairyMax)
        
    }

    // Perform segue based on button pressed
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
    // Prepare actions in fuction before perfoming segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let viewController = segue.destinationViewController as! FoodViewController
        
        let foods = sender as! [String]
        viewController.foods = foods
        // if foods var equals fruits send fruits image array
        if foods == fruits {
            viewController.images = fruitsimage
        }
        // if foods var equals vegetables send vegtables images array
        else if foods == vegetables {
            viewController.images = vegetablesimage
        }
        // if foods var equals grains send grains images array
        else if foods == grains {
            viewController.images = grainsimage
        }
        // if foods var equals proteins send proteins images array
        else if foods == proteins {
            viewController.images = proteinsimage
        }
        // otherwise send dairy images array
        else {
            viewController.images = dairyimage
        }
        
    }

}
