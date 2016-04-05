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
    
    var maxFruitcount:Float = 3.0
    var maxVegetablecount: Float = 4.0
    var maxGrainscount: Float = 9.0
    var maxProteincount: Float = 2.0
    var maxDairycount: Float = 2.0
    
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
        
        var fruitCount: Float = 0.0
        for title in fruits{
            
            let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
            fruitCount += Float(individualCount)
            
        }
        if fruitCount == maxFruitcount{
            
            fruitprogressview.progressTintColor = UIColor.greenColor()
        }
        else if fruitCount > maxFruitcount{
            fruitprogressview.progressTintColor = UIColor.redColor()
        }
        else {
            fruitprogressview.progressTintColor = UIColor.blueColor()
        }
        
        fruitprogressview.progress = fruitCount / maxFruitcount
        
        var vegetableCount: Float = 0.0
        for title in vegetables{
            
            let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
            vegetableCount += Float(individualCount)
            
        }
        if vegetableCount == maxVegetablecount{
            
            vegetableProgressView.progressTintColor = UIColor.greenColor()
        }
        else if vegetableCount > maxVegetablecount{
            vegetableProgressView.progressTintColor = UIColor.redColor()
        }
        else {
            vegetableProgressView.progressTintColor = UIColor.blueColor()
        }
        
        vegetableProgressView.progress = vegetableCount / maxVegetablecount
        
        var grainsCount: Float = 0.0
        for title in grains{
            
            let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
            grainsCount += Float(individualCount)
            
        }
        if grainsCount == maxGrainscount{
            
            grainsProgressView.progressTintColor = UIColor.greenColor()
        }
        else if grainsCount > maxGrainscount{
            grainsProgressView.progressTintColor = UIColor.redColor()
        }
        else {
            grainsProgressView.progressTintColor = UIColor.blueColor()
        }
        
        grainsProgressView.progress = grainsCount / maxGrainscount
        
        var proteinCount: Float = 0.0
        for title in proteins{
            
            let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
            proteinCount += Float(individualCount)
            
        }
        if proteinCount == maxProteincount{
            
            proteinProgressView.progressTintColor = UIColor.greenColor()
        }
        else if proteinCount > maxProteincount{
            proteinProgressView.progressTintColor = UIColor.redColor()
        }
        else {
            proteinProgressView.progressTintColor = UIColor.blueColor()
        }
        
        proteinProgressView.progress = proteinCount / maxProteincount
        
        var dairyCount: Float = 0.0
        for title in dairy{
            
            let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
            dairyCount += Float(individualCount)
            
        }
        if dairyCount == maxDairycount{
            
            dairyProgressView.progressTintColor = UIColor.greenColor()
        }
        else if dairyCount > maxDairycount{
            dairyProgressView.progressTintColor = UIColor.redColor()
        }
        else {
            dairyProgressView.progressTintColor = UIColor.blueColor()
        }
        
        dairyProgressView.progress = dairyCount / maxDairycount
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
    //fidel
    @IBOutlet weak var fruitprogressview: UIProgressView!
    @IBOutlet weak var vegetableProgressView: UIProgressView!
    @IBOutlet weak var grainsProgressView: UIProgressView!
    @IBOutlet weak var proteinProgressView: UIProgressView!
    @IBOutlet weak var dairyProgressView: UIProgressView!

}
