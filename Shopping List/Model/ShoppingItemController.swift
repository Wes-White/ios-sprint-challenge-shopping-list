//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Wesley Ryan on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemsController {
    
    var items: [ShoppingItem] {
        
        var result = [
            ShoppingItem(name: "Apples" , imageName: "Apple"),
            ShoppingItem(name: "Grapes" , imageName: "Grapes"),
            ShoppingItem(name: "Milk" , imageName: "Milk"),
            ShoppingItem(name: "Muffin" , imageName: "Muffin"),
            ShoppingItem(name: "Popcorn" , imageName: "Popcorn"),
            ShoppingItem(name: "Soda" , imageName: "Soda"),
            ShoppingItem(name: "Strawberries" , imageName: "Strawberries")
        ]
        
        return result
    }
    
}
