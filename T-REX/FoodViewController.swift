//
//  FoodViewController.swift
//  T-REX
//
//  Created by Elliot on 3/3/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var FoodTableView: UITableView!

    var fruit = ["Apple", "Banana", "Orange", "Strawberries", "Pear"]
    var images = [UIImage(named: "apple600.png"),UIImage(named: "Bananas.png"),UIImage(named: "Orange.png"),UIImage(named: "Strawberry.png"),UIImage(named: "Pear.png"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    /*
        foodTableView.registerClass(FoodTableViewCell.self, forCellReuseIdentifier: "FoodCell")
    */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruit.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FoodCell", forIndexPath: indexPath) as! FoodTableViewCell

        cell.foodImage.image = images[indexPath.row]
        cell.foodLabel.text = fruit[indexPath.row]
        
        return cell
    }
    /*
    // MARK:  UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        print("You selected cell #\(indexPath.row)")
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

