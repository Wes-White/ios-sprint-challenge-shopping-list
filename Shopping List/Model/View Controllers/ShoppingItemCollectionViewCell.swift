//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Wesley Ryan on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var item: ShoppingItem? {
        
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        imageView.image = item?.image
        statusLabel.text = "Not Added"
        foodTypeLabel.text = item?.name
    }
}
