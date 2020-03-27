//
//  AddShoppingItemViewController.swift
//  Shopping List
//
//  Created by Wesley Ryan on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class AddShoppingItemViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var shoppingItemController: ShoppingItemController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addiceCreamButtonTapped(_ sender: Any) {
        imageView.image = UIImage(named: "icecream")
        shoppingItemController?.addNewShoppingItem(name: "Ice Cream", image: "icecream")
    }

    @IBAction func addBreadButtonTapped(_ sender: Any) {
        imageView.image = UIImage(named: "bread")
        shoppingItemController?.addNewShoppingItem(name: "Bread", image: "bread")
    }

    @IBAction func addVeggiesButtonTapped(_ sender: Any) {
        imageView.image = UIImage(named: "veggies")
        shoppingItemController?.addNewShoppingItem(name: "Veggies", image: "veggies")
    }

    @IBAction func addCandyButtonTapped(_ sender: Any) {
        imageView.image = UIImage(named: "candy")
        shoppingItemController?.addNewShoppingItem(name: "Candy", image: "candy")
    }
}
