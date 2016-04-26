//
//  Landing.swift
//  T-REX
//
//  Created by Fidel Gonzalez on 4/25/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class Landing: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tylerView.center.x = tylerView.center.x - self.view.frame.width
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(3) {
            self.tylerView.center.x = self.tylerView.center.x + self.view.frame.width
            
        }
    }
}
