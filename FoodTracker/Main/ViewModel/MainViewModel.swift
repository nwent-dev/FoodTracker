//
//  MainViewModel.swift
//  FoodTracker
//
//  Created by Александр Калашников on 13/6/25.
//

import Foundation
import RealmSwift

class MainViewModel: ObservableObject {
    
    let realm = try! Realm()
    @ObservedResults(Food.self) var foods
    
    func addFood(name: String, weight: Int, date: Date) {
        let food = Food()
        food.name = name
        food.weight = weight
        food.date = date
        try! realm.write {
            realm.add(food)
        }
    }
    
    func getFoodCountForDay(date: Date) -> Int {
        var result = 0
        for food in foods {
            if Calendar.current.isDate(date, inSameDayAs: food.date) {
                result += 1
            }
        }
        return result
    }
    
    func timeFormatter(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    func dateFormatter(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}
