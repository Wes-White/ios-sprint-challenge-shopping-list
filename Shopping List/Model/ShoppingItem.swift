//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Wesley Ryan on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
    var name: String
    var isAdded: Bool
    var image: UIImage {
        
        return UIImage(named: name)!
    }
    
    init(name: String, isAdded: Bool = false) {
        self.name = name
        self.isAdded = isAdded
        
    }
    
    
}
