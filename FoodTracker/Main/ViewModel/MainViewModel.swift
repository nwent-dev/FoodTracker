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
    var foodData: [Food] = [/*Food(name: "Пироженое", weight: 300, date: Date())*/]
    
    func addFood(name: String, weight: Int, date: Date) {
        let food = Food()
        food.name = name
        food.weight = weight
        food.date = date
        foodData.append(food)
        try! realm.write {
            realm.add(food)
        }
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
