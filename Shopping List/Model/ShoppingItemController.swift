//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Wesley Ryan on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

extension String {
    static let shouldLoadOrSave = "shouldLoadOrSave"
}


class ShoppingItemController {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingList: [ShoppingItem] = []
    
    var items: [ShoppingItem] = []
    
    var addedItems: [ShoppingItem] {
        return items.filter{ $0.isAdded == true }
    }
    
    var unaddedItems: [ShoppingItem] {
        return items.filter{ $0.isAdded == false }
    }
    
    
    init() {
        
        if !UserDefaults.standard.bool(forKey: .shouldLoadOrSave) {
            for item in itemNames {
                items.append(ShoppingItem(name: item))
            }
            saveToPersistentStore()
            print("**Saving**")
            UserDefaults.standard.set(true, forKey: .shouldLoadOrSave)
        } else if UserDefaults.standard.bool(forKey: .shouldLoadOrSave) {
            loadFromPersistentStore()
            print("**Loading**")
        }
    }
    
    
    
    func addNewShoppingItem(name: String, image: String) {
        items.append(ShoppingItem(name: name))
        saveToPersistentStore()
    }
    
    func updateHasBeenAdded(for item: ShoppingItem) {
        
        for i in 0..<items.count {
            if items[i] == item {
                if items[i].isAdded {
                    
                    for element in 0..<shoppingList.count {
                        if shoppingList[element] == items[i] {
                            shoppingList.remove(at: element)
                            return
                        }
                    }
                    items[i].isAdded = false

                } else {
                    items[i].isAdded = true
                    shoppingList.append(items[i])
                }
            }
        }
        saveToPersistentStore()
        print(shoppingList)
    }
    
    
    // MARK: - Persistence
    
    var shoppingItemsURL: URL? {
        let fileManager = FileManager()
        
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        return documentsDir?.appendingPathComponent("ShoppingItems.plist")
    }
    
    func saveToPersistentStore() {
        let encoder = PropertyListEncoder()
        
        do {
            
            let shoppingItemsData = try encoder.encode(items)
            
            guard let itemsURL = shoppingItemsURL else { return }
            
            try shoppingItemsData.write(to: itemsURL)
        } catch {
            print("Error saving items: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let itemsURL = shoppingItemsURL else { return }
        let decoder = PropertyListDecoder()
        
        do {
            let itemsData = try Data(contentsOf: itemsURL)
            let decodedItems = try decoder.decode([ShoppingItem].self, from: itemsData)
            
            self.items = decodedItems
        } catch {
            print("Error retreving items: \(error)")
        }
    }
    
    
    
}
