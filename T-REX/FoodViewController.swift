//
//  FoodViewController.swift
//  T-REX
//
//  Created by Elliot on 3/3/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var foodTableView: UITableView!

    var food = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadFruits()
    }
    
    func loadFruits() {
        let applePhoto = UIImage(named: "apple600")!
        let apple = Food(name: "Apple", photo: applePhoto)!
        
        food += [apple]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "FoodTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! FoodTableViewCell
        let foods = food[indexPath.row]
        
        cell.foodLabel.text = foods.name
        cell.foodImage.image = foods.photo
        
        return cell
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
