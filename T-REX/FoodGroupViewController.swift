//
//  FoodGroupViewController.swift
//  T-REX
//
//  Created by Fidel Gonzalez on 3/15/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit
import AVFoundation

class FoodGroupViewController: UIViewController {
    
    // Linking progress view bars from storyboard to controller
    @IBOutlet weak var fruitsProgress: UIProgressView!
    @IBOutlet weak var veggiesProgress: UIProgressView!
    @IBOutlet weak var grainsProgress: UIProgressView!
    @IBOutlet weak var proteinProgress: UIProgressView!
    @IBOutlet weak var dairyProgress: UIProgressView!
    
    // Food group progress number label
    @IBOutlet weak var fruitLabel: UILabel!
    @IBOutlet weak var veggieLabel: UILabel!
    @IBOutlet weak var grainLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var dairyLabel: UILabel!
    
    // maximum servings for each food group
    var fruitMax = 3
    var veggieMax = 4
    var grainMax = 9
    var proteinMax = 2
    var dairyMax = 2
    
    // array for each food group
    var fruits = ["Apple", "Avocado", "Banana", "Cherry", "Coconut", "Grapes", "Mango", "Orange", "Pineapple", "Strawberry"]
    var vegetables = ["Bell Pepper", "Broccoli", "Cabbage", "Carrot", "Corn", "Cucumber", "Mushroom", "Potato", "Radish", "Spinach"]
    var proteins = ["Bacon", "Burger", "Chicken", "Egg", "Salmon", "Sausage", "Steak", "Tofu", "Tuna"]
    var dairy = ["Milk", "Cheese", "Ice Cream", "Yogurt"]
    var grains = ["Bread", "Cereal", "Muffin", "Oats", "Pasta", "Popcorn", "Pretzel", "Rice"]
    
    // image array for each food group
    var fruitsimage = [UIImage(named: "apple")!, UIImage(named: "avocado")!, UIImage(named: "banana")!, UIImage(named: "cherry")!, UIImage(named: "coconut")!, UIImage(named: "grapes")!, UIImage(named: "mango")!, UIImage(named: "orange")!, UIImage(named: "pineapple")!, UIImage(named: "strawberry")!]
    var vegetablesimage = [UIImage(named: "bellpepper")!, UIImage(named: "broccoli")!, UIImage(named: "cabbage")!, UIImage(named: "carrot")!, UIImage(named: "corn")!, UIImage(named: "cucumber")!, UIImage(named: "mushroom")!, UIImage(named: "potato")!, UIImage(named: "radish")!, UIImage(named: "spinach")!]
    var proteinsimage = [UIImage(named: "bacon")!, UIImage(named: "burger")!, UIImage(named: "chicken")!, UIImage(named: "egg")!, UIImage(named: "salmon")!, UIImage(named: "sausage")!, UIImage(named: "steak")!, UIImage(named: "tofu")!, UIImage(named: "tuna")!]
    var dairyimage = [UIImage(named: "milkbox")!, UIImage(named: "cheese")!, UIImage(named:"icecream")!, UIImage(named: "yogurt")!]
    var grainsimage = [UIImage(named: "bread")!, UIImage(named: "cereal")!, UIImage(named: "muffin")!, UIImage(named: "oats")!, UIImage(named: "pasta")!, UIImage(named: "popcorn")!, UIImage(named: "pretzel")!, UIImage(named: "rice")!]
    
    var buttonClick : AVAudioPlayer?
    var percussiveHit : AVAudioPlayer?
    
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

        // Do any additional setup after loading the view.
        
        // create button-click player
        if let buttonClick = self.setupAudioPlayerWithFile("button-click", type: "wav") {
            self.buttonClick = buttonClick
        }
        // create percussive-hit player
        if let percussiveHit = self.setupAudioPlayerWithFile("percussive-hit", type: "wav") {
            self.percussiveHit = percussiveHit
        }
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
        // Show fruit progress number
        fruitLabel.text = "\(fruitSum) / \(fruitMax)"
        
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
        // Show veggie progress number
        veggieLabel.text = "\(veggieSum) / \(veggieMax)"
        
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
        // Show grain progress number
        grainLabel.text = "\(grainSum) / \(grainMax)"
        
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
        // Show protein progress number
        proteinLabel.text = "\(proteinSum) / \(proteinMax)"
        
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
        // Show dairy progress number
        dairyLabel.text = "\(dairySum) / \(dairyMax)"
        
    }

    // Perform segue based on button pressed
    @IBAction func fruitsPressed(sender: AnyObject) {
        buttonClick?.play()
        performSegueWithIdentifier("showTable", sender: fruits)
    }
    
    @IBAction func vegetablesPressed(sender: AnyObject) {
        buttonClick?.play()
        performSegueWithIdentifier("showTable", sender: vegetables)
    }
    
    @IBAction func grainsPressed(sender: AnyObject) {
        buttonClick?.play()
        performSegueWithIdentifier("showTable", sender: grains)
    }
    
    @IBAction func proteinPressed(sender: AnyObject) {
        buttonClick?.play()
        performSegueWithIdentifier("showTable", sender: proteins)
    }
    
    @IBAction func dairyPressed(sender: AnyObject) {
        buttonClick?.play()
        performSegueWithIdentifier("showTable", sender: dairy)
    }
    
    @IBAction func infoButton(sender: AnyObject) {
        percussiveHit?.play()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Prepare actions in fuction before perfoming segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showTable") {
        
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

}
