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
    
    
    let trophies = ["5-A-Day", "Strong Bones", "Superfoods!"]
    let imageArray = [UIImage(named: "trophies"), UIImage(named: "trophies"), UIImage(named: "trophies")]
    let reqImages = [UIImage(named: "apple"), UIImage(named: "milkbox"), UIImage(named: "broccoli")]
    //fidel
    let reqText = ["Eat 5 servings of fruits and vegetables", "Consume daily recomended Dairy", "Eat 3 superfoods"]
    var dairy = ["Milk", "Cheese", "Yogurt"]
    var fruits = ["Apple", "Banana", "Grapes", "Orange", "Strawberry"]
    var vegetables = ["Broccoli", "Carrot", "Cucumber", "Potato", "Spinach"]
    var grains = ["Bread", "Cereal", "Pasta", "Rice"]
    var proteins = ["Beef", "Chicken", "Egg", "Fish", "Pork"]

    
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
            for title in dairy{
                
                let individualCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                dairyCount += Float(individualCount)
            }
            if dairyCount > 2 {
                cell.imageView.alpha = 1.0
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
            if fiveadayCount >= 5 {
                cell.imageView.alpha = 1.0
            }
            else {
                cell.imageView.alpha = 0.5
            }
        }
        else if indexPath.row == 2 {
            var superCount:Float = 0.0
            for title in vegetables{
                let superFoodsCount = NSUserDefaults.standardUserDefaults().doubleForKey(title)
                superCount += Float(superFoodsCount)
            }
            if superCount == 3 {
                cell.imageView.alpha = 1.0
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
