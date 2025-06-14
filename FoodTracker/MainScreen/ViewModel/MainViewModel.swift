//
//  MainViewModel.swift
//  FoodTracker
//
//  Created by Александр Калашников on 13/6/25.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var foodData: [Food] = [Food(name: "Пироженое", date: Date(), weight: 300)]
    
    func addFood(food: Food) {
        if !food.name.isEmpty && food.weight != 0 {
            foodData.append(food)
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
