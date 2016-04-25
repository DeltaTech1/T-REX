//
//  FoodViewController.swift
//  T-REX
//
//  Created by Elliot on 3/3/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Table view connection to controller
    @IBOutlet weak var FoodTableView: UITableView!
    
    // maximum servings for each food group
    var fruitMax = 3
    var veggieMax = 4
    var grainMax = 9
    var proteinMax = 2
    var dairyMax = 2
    
    // array for each food group
    var fruits = ["Apple", "Avocado", "Banana", "Cherry", "Coconut", "Grapes", "Mango", "Orange", "Pineapple", "Strawberry"]
    var vegetables = ["Bell Pepper", "Broccoli", "Cabbage", "Carrot", "Corn", "Cucumber", "Mushroom", "Potato", "Radish", "Spinach"]
    var grains = ["Bread", "Cereal", "Muffin", "Oats", "Pasta", "Popcorn", "Pretzel", "Rice"]
    var proteins = ["Bacon", "Burger", "Chicken", "Egg", "Salmon", "Sausage", "Steak", "Tofu", "Tuna"]
    var dairy = ["Milk", "Cheese", "Ice Cream", "Yogurt"]
    
    var foods = [String]()
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // if first entry in table is Apple (Fruit Table)
        if (foods[0] == "Apple") {
            // initial fruit count
            var fruitSum = 0
            // Calculate sum of fruits
            for title in fruits {
                let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                fruitSum += Int(individualCount)
            }
            
            // if fruit count is equal to max servings
            if (fruitSum == fruitMax) {
                // show alert if recommended servings met
                let alert = UIAlertController(title: "Good job!", message: "You ate enough fruit today!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
                return
                // if fruit count is greater than max servings
            } else if (fruitSum > fruitMax) {
                // show alert if exceeded recommended servings
                let alert = UIAlertController(title: "Watch out...", message: "You've had enough fruit today", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
                return
            }
        }
        
        // if first entry in table is Bell Pepper (Vegetable Table)
        if (foods[0] == "Bell Pepper") {
            // initial veggie count
            var veggieSum = 0
            // Calculate sum of vegetables
            for title in vegetables {
                let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                veggieSum += Int(individualCount)
            }
            
            // if veggies count is equal to max servings
            if (veggieSum == veggieMax) {
                // show alert if recommended servings met
                let alert = UIAlertController(title: "Good job!", message: "You ate enough vegetables today!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
                return
                // if veggies count is greater than max servings
            } else if (veggieSum > veggieMax) {
                // show alert if exceeded recommended servings
                let alert = UIAlertController(title: "Watch out...", message: "You've had enough vegetables today", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
                return
            }
        }
        
        // if first entry in table is Bread (Grain Table)
        if (foods[0] == "Bread") {
            // initial grain count
            var grainSum = 0
            // Calculate sum of grains
            for title in grains {
                let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                grainSum += Int(individualCount)
            }
            
            // if grain count is equal to max servings
            if (grainSum == grainMax) {
                // show alert if recommended servings met
                let alert = UIAlertController(title: "Good job!", message: "You ate enough grains today!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
                return
                // if grain count is greater than max servings
            } else if (grainSum > grainMax) {
                // show alert if exceeded recommended servings
                let alert = UIAlertController(title: "Watch out...", message: "You've had enough grains today", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
                return
            }
        }
        
        // if first entry in table is Bacon (Protein Table)
        if (foods[0] == "Bacon") {
            // intial protein count
            var proteinSum = 0
            // Calculate sum of proteins
            for title in proteins {
                let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                proteinSum += Int(individualCount)
            }
            
            // if protein count is equal to max servings
            if (proteinSum == proteinMax) {
                // show alert if recommended servings met
                let alert = UIAlertController(title: "Good job!", message: "You ate enough protein today!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
                return
                // if protein count is greater than max servings
            } else if (proteinSum > proteinMax) {
                // show alert if exceeded recommended servings
                let alert = UIAlertController(title: "Watch out...", message: "You've had enough protein today", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
                return
            }
        }
        
        // if first entry in table is Milk (Dairy Table)
        if (foods[0] == "Milk") {
            // initial dairy count
            var dairySum = 0
            // Calculate sum of dairy
            for title in dairy {
                let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                dairySum += Int(individualCount)
            }
            
            // if dairy count is equal to max servings
            if (dairySum == dairyMax) {
                // show alert if recommended servings met
                let alert = UIAlertController(title: "Good job!", message: "You ate enough dairy today!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
                return
                // if dairy count is greater than max servings
            } else if (dairySum > dairyMax) {
                // show alert if exceeded recommended servings
                let alert = UIAlertController(title: "Watch out...", message: "You've had enough dairy today", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
                return
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // fuction to return the food count as integer
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    // Use reusable table view cell with foods & images
    // Sending info to cell and returning values
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FoodCell", forIndexPath: indexPath) as! FoodTableViewCell
        cell.loadItem(title: foods[indexPath.row], image: images[indexPath.row])
        
        return cell
    }
  
    

}

