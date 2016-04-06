//
//  RequirementsViewController.swift
//  T-REX
//
//  Created by Dyan Abad on 3/21/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class RequirementsViewController: UIViewController {
    
    // Link image and label text on storyboard to controller
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    // set image var to image class
    var image = UIImage()
    // set variable to empty string
    var reqtext = ""
    // set variable for unearned trophy
    var trophyEarned = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = self.image
        infoLabel?.text = reqtext

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
