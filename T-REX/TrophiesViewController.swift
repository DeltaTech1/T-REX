//
//  TrophiesViewController.swift
//  T-REX
//
//  Created by Dyan Abad on 3/21/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class TrophiesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //Dyan added new trophies
    let trophies = ["5-A-Day", "Strong Bones", "Got Milk?", "Brain Power", "Super Vision", "Protein Pro"]
    let imageArray = [UIImage(named: "trophies"), UIImage(named: "trophies"), UIImage(named: "trophies"), UIImage(named: "trophies"), UIImage(named: "trophies"), UIImage(named: "trophies")]
    let reqImages = [UIImage(named: "apple"), UIImage(named: "cheese"), UIImage(named: "milkbox"), UIImage(named: "fish"), UIImage(named: "carrot"), UIImage(named: "steak")]
    //fidel
    let reqText = ["Eat 5 total servings of fruits and vegetables", "Have 2 total servings of dairy", "Have a serving of milk", "Eat 4 foods that sharpen your brain", "Eat 4 foods that sharpen your vision", "Have 3 servings of protein"]
    let infoText = ["**It includes any selected fruits or vegetables", "**Dairy foods include Cheese, Milk, Yogurt", "**Drink 1 serving of milk", "**Brain Foods include Strawberries, Spinach, Rice, & Fish", "**Vision foods include Broccoli, Carrots, Spinach, & Fish", "**Protein foods include Chicken, Steak, Eggs, & Fish"]
    
    var dairy = ["Milk", "Cheese", "Yogurt"]
    var fruits = ["Apple", "Banana", "Grapes", "Orange", "Strawberry"]
    var vegetables = ["Broccoli", "Carrot", "Cucumber", "Potato", "Spinach"]
    var grains = ["Bread", "Cereal", "Pasta", "Rice"]
    var proteins = ["Beef", "Chicken", "Egg", "Fish", "Pork"]
    var gotMilk = ["Milk"]
    var brainPower = ["Strawberry", "Spinach", "Rice", "Fish"]
    var superVision = ["Broccoli", "Carrot", "Spinach", "Fish"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
                let alert = UIAlertController(title: "Congratulations!", message: "You have unlocked the Strong Bones Trophy!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
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
                let alert = UIAlertController(title: "Congratulations!", message: "You have unlocked the 5-A-Day Trophy!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
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
                let alert = UIAlertController(title: "Congratulations!", message: "You have unlocked the Got Milk? Trophy!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
                cell.imageView.alpha = 0.5
            }
        }
        else if indexPath.row == 3 {
            var brainCount: Float = 0.0
            for title in brainPower {
                let brainFoodsCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                brainCount += Float(brainFoodsCount)
            }
            if brainCount == 4.0 {
                cell.imageView.alpha = 1.0
                let alert = UIAlertController(title: "Congratulations!", message: "You have unlocked the Brain Power Trophy!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
                cell.imageView.alpha = 0.5
            }
        }
        else if indexPath.row == 4 {
            var visionCount: Float = 0.0
            for title in superVision {
                let visionFoodsCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                visionCount += Float(visionFoodsCount)
            }
            if visionCount == 4.0 {
                cell.imageView.alpha = 1.0
                let alert = UIAlertController(title: "Congratulations!", message: "You have unlocked the Super Vision Trophy!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
                cell.imageView.alpha = 0.5
            }
        }
        else if indexPath.row == 5 {
            var proteinCount: Float = 0.0
            for title in proteins {
                let proteinProCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                proteinCount += Float(proteinProCount)
            }
            if proteinCount >= 3.0 {
                cell.imageView.alpha = 1.0
                let alert = UIAlertController(title: "Congratulations!", message: "You have unlocked the Protein Pro Trophy!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
