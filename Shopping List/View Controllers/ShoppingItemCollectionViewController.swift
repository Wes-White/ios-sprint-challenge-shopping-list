//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Wesley Ryan on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
        
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowOrderVC" {
            guard let ShowOrderVC = segue.destination as? CheckoutViewController else { return }
            
            ShowOrderVC.shoppingItemController = shoppingItemController
        } else if segue.identifier == "AddShoppingItem" {
            guard let AddShoppingItem = segue.destination as? AddShoppingItemViewController else { return }
            
            AddShoppingItem.shoppingItemController = shoppingItemController
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingItemController.items.count
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        cell.shoppingItem = shoppingItemController.items[indexPath.item]
        
        
        return cell
    }
    
    
    func itemFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingItemController.addedItems[indexPath.row]
        } else {
            return shoppingItemController.unaddedItems[indexPath.row]
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return }
        
        cell.shoppingItem = shoppingItemController.items[indexPath.item]
        cell.delegate = self
        cell.hasBeenButtonTapped(self)
    }
}


extension ShoppingItemsCollectionViewController: ShoppingItemCellDelegate {
    func toggleHasBeenRead(for cell: ShoppingItemCollectionViewCell) {
        guard let item = cell.shoppingItem else { return }
        shoppingItemController.updateHasBeenAdded(for: item)
        collectionView?.reloadData()
    }
}
