//
//  Food.swift
//  T-REX
//
//  Created by Elliot on 3/3/16.
//  Copyright © 2016 Delta Tech. All rights reserved.
//

import UIKit

class Food {
    
    // MARK: Properties
    var name: String
    var photo: UIImage?
    
    
    // MARK: Types
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
    }
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        
        
        // Initialization should fail if there is no name
        if name.isEmpty {
            return nil
        }
    }

}