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
    
//    // Step 7
//    @discardableResult
//
//       // Step 8
//       mutating func createNewMarketItem() -> MarketItem {
//
//           let newItem = MarketItem()
//           self.items.insert(newItem, at: 0) // Prepend the habits to the array
//           self.saveItems()
//
//           return newItem
//       }
    //Saving Items
//    private func saveHabits() {
//        // Step 9
//        guard let habitsData = try? JSONEncoder().encode(self.habits) else {
//            fatalError("could not encode list of habits")
//        }
//
//        // Step 10
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(habitsData, forKey: PersistenceLayer.userDefaultsHabitsKeyValue)
//        userDefaults.synchronize()
//
//    }
    
//    //Completeing the Items
//    mutating func markHabitAsCompleted(_ habitIndex: Int) -> Habit {
//
//       // Step 12
//        var updatedHabit = self.habits[habitIndex]
//
//       // Step 13
//        guard updatedHabit.completedToday == false else { return updatedHabit }
//
//        updatedHabit.numberOfCompletions += 1
//
//        // Step 14
//        if let lastCompletionDate = updatedHabit.lastCompletionDate, lastCompletionDate.isYesterday {
//            updatedHabit.currentStreak += 1
//        } else {
//            updatedHabit.currentStreak = 1
//        }
//
//        // Step 15
//        if updatedHabit.currentStreak > updatedHabit.bestStreak {
//            updatedHabit.bestStreak = updatedHabit.currentStreak
//        }
//
//        // Step 16
//        let now = Date()
//        updatedHabit.lastCompletionDate = now
//
//        // Step 17
//        self.habits[habitIndex] = updatedHabit
//
//        // Step 18
//        self.saveHabits()
//        return updatedHabit
//    }
}
