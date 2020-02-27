//
//  PersistanceLayer.swift
//  Divvy
//
//  Created by Henry Calderon on 2/26/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation

struct PersistenceLayer {
    private(set) var items: [MarketItem] = []
    private static let userDefaultsHabitsKeyValue = "ITEMS_ARRAY"

    init() {
        self.loadItems()
    }
    
    private mutating func loadItems(){
        let userDefaults = UserDefaults.standard
        guard
            let habitData = userDefaults.data(forKey: PersistenceLayer.userDefaultsHabitsKeyValue),
            let items = try? JSONDecoder().decode([MarketItem].self, from: habitData) else {
                return
        }
        self.items = items
        
    }
//==============================================================
    
    // Step 7
    @discardableResult

       // This Generates the item and saves it.
    mutating func createNewMarketItem(image: String, itemDetail1: String,itemDetail2: String,itemDetail3: String) -> MarketItem {

           let newItem = MarketItem(image: image, itemDetail1: itemDetail1 , itemDetail2: itemDetail2, itemDetail3: itemDetail3)
           self.items.insert(newItem, at: 0) // Prepend the habits to the array
           self.saveItems()

           return newItem
       }
    //What allows the item data to be saved.
    private func saveItems() {
        // Step 9
        guard let itemsData = try? JSONEncoder().encode(self.items) else {
            fatalError("could not encode list of items")
        }

        //Step 10: If we do successfully decode our array of habits we then set that json data inside our User Defaults for its given key!
        let userDefaults = UserDefaults.standard
        userDefaults.set(itemsData, forKey: PersistenceLayer.userDefaultsHabitsKeyValue)
        userDefaults.synchronize()

    }
    
//    //Completeing the Items
//    mutating func markHabitAsCompleted(_ itemIndex: Int) -> MarketItem {

       // Step 12
//        var updatedItem = self.items[itemIndex]

        // Step 16
//        let now = Date()
//        updatedHabit.lastCompletionDate = now

        // Step 17
//        self.habits[habitIndex] = updatedHabit

        // Step 18
//        self.saveHabits()
//        return updatedHabit
//    }
    
    // Step 20: The next function comes in handy after we added a new habit and update the collection of habits present in the table view!
     mutating func setNeedsToReloadHabits() {
            self.loadItems()
    }

}
