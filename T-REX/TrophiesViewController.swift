//
//  TrophiesViewController.swift
//  T-REX
//
//  Created by Dyan Abad on 3/21/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit
import AVFoundation

class TrophiesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //Dyan added new trophies
    let trophies = ["5-A-Day", "Strong Bones", "Got Milk?", "Brain Power", "Super Vision", "Protein Pro"]
    let imageArray = [UIImage(named: "trophies"), UIImage(named: "trophies"), UIImage(named: "trophies"), UIImage(named: "trophies"), UIImage(named: "trophies"), UIImage(named: "trophies")]
    let reqImages = [UIImage(named: "fiveaday"), UIImage(named: "strongbones"), UIImage(named: "gotmilk"), UIImage(named: "brainpower"), UIImage(named: "supervision"), UIImage(named: "proteinpro")]
    let lockedArray = [UIImage(named:"locked"), UIImage(named: "locked"), UIImage(named: "locked"), UIImage(named: "locked"), UIImage(named: "locked"), UIImage(named: "locked")]
    //fidel
    let reqText = ["Eat 5 total servings of fruits and/or vegetables", "Have 2 total servings of dairy", "Have a serving of milk", "Eat 4 servings of foods that sharpen your brain", "Eat 4 servings of foods that sharpen your vision", "Have 2 total servings of protein"]
    let infoText = ["", "", "", "(These include avocado, berries, dark leafy greens, whole grain foods, and fatty fish)", "(These include carrots, dark leafy greens, citrus fruits, berries, eggs, and fatty fish)", ""]
    
    var dairy = ["Milk", "Cheese", "Ice Cream", "Yogurt"]
    var fruits = ["Apple", "Avocado", "Banana", "Cherry", "Coconut", "Grapes", "Mango", "Orange", "Pineapple", "Strawberry"]
    var vegetables = ["Bell Pepper", "Broccoli", "Cabbage", "Carrot", "Corn", "Cucumber", "Mushroom", "Potato", "Radish", "Spinach"]
    var grains = ["Bread", "Cereal", "Muffin", "Oats", "Pasta", "Popcorn", "Pretzel", "Rice"]
    var proteins = ["Bacon", "Burger", "Chicken", "Egg", "Salmon", "Sausage", "Steak", "Tofu", "Tuna"]
    var gotMilk = ["Milk"]
    var brainPower = ["Avocado", "Broccoli", "Oats", "Salmon", "Spinach", "Strawberry", "Rice", "Tuna"]
    var superVision = ["Broccoli", "Carrot", "Egg", "Orange", "Salmon", "Spinach", "Strawberry", "Tuna"]

    var percussiveHit : AVAudioPlayer?
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

        // Do any additional setup after loading the view.
        
        // create percussive-hit player
        if let percussiveHit = self.setupAudioPlayerWithFile("percussive-hit", type: "wav") {
            self.percussiveHit = percussiveHit
        }
        // create button-click player
        if let buttonClick = self.setupAudioPlayerWithFile("button-click", type: "wav") {
            self.buttonClick = buttonClick
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.trophies.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        cell.titleLabel?.text = self.trophies[indexPath.row]
        if indexPath.row == 1 {
            var dairyCount:Float = 0.0
            for title in dairy {
                
                let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                dairyCount += Float(individualCount)
            }
            if dairyCount >= 2.0 {
                cell.imageView.alpha = 1.0
                let alert = UIAlertController(title: "Congratulations!", message: "You have unlocked a Trophy!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
                cell.imageView.image = self.lockedArray[indexPath.row]
                cell.imageView.alpha = 0.5
            }
        }
        else if indexPath.row == 0 {
            var fiveadayCount: Float = 0.0
            for title in fruits {
                let fruitCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                fiveadayCount += Float(fruitCount)
            }
            for title in vegetables {
                let veggieCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                fiveadayCount += Float(veggieCount)
            }
            if fiveadayCount >= 5.0 {
                cell.imageView.alpha = 1.0
                let alert = UIAlertController(title: "Congratulations!", message: "You have unlocked a Trophy!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
                cell.imageView.image = self.lockedArray[indexPath.row]
                cell.imageView.alpha = 0.5
            }
        }
        else if indexPath.row == 2 {
            var milkCount:Float = 0.0
            for title in gotMilk {
                let superFoodsCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                milkCount += Float(superFoodsCount)
            }
            if milkCount == 1.0 {
                cell.imageView.alpha = 1.0
                let alert = UIAlertController(title: "Congratulations!", message: "You have unlocked a Trophy!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
                cell.imageView.image = self.lockedArray[indexPath.row]
                cell.imageView.alpha = 0.5
            }
        }
        else if indexPath.row == 3 {
            var brainCount: Float = 0.0
            for title in brainPower {
                let brainFoodsCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                brainCount += Float(brainFoodsCount)
            }
            if brainCount >= 4.0 {
                cell.imageView.alpha = 1.0
                let alert = UIAlertController(title: "Congratulations!", message: "You have unlocked a Trophy!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
                cell.imageView.image = self.lockedArray[indexPath.row]
                cell.imageView.alpha = 0.5
            }
        }
        else if indexPath.row == 4 {
            var visionCount: Float = 0.0
            for title in superVision {
                let visionFoodsCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                visionCount += Float(visionFoodsCount)
            }
            if visionCount >= 4.0 {
                cell.imageView.alpha = 1.0
                let alert = UIAlertController(title: "Congratulations!", message: "You have unlocked a Trophy!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
                cell.imageView.image = self.lockedArray[indexPath.row]
                cell.imageView.alpha = 0.5
            }
        }
        else if indexPath.row == 5 {
            var proteinCount: Float = 0.0
            for title in proteins {
                let proteinProCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                proteinCount += Float(proteinProCount)
            }
            if proteinCount >= 2.0 {
                cell.imageView.alpha = 1.0
                let alert = UIAlertController(title: "Congratulations!", message: "You have unlocked a Trophy!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
                cell.imageView.image = self.lockedArray[indexPath.row]
                cell.imageView.alpha = 0.5
            }
        }
        return cell
    }
    //fidel
    @IBAction func fiveadayPressed(sender: AnyObject) {
        performSegueWithIdentifier("showRequirements", sender: reqText)
    }
    @IBAction func infoTexPressed(sender: AnyObject) {
        performSegueWithIdentifier("showRequirements", sender: infoText)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        buttonClick?.play()
        self.performSegueWithIdentifier("showRequirements", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRequirements"
        {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let viewController = segue.destinationViewController as! RequirementsViewController
            viewController.image = self.reqImages[indexPath.row]!
            viewController.title = self.trophies[indexPath.row]
            viewController.reqtext = self.reqText[indexPath.row]
            viewController.informationText = self.infoText[indexPath.row]
        }
    }
    
    @IBAction func infoButton(sender: AnyObject) {
        percussiveHit?.play()
    }
    

}
