//
//  FoodModel.swift
//  FoodTracker
//
//  Created by Александр Калашников on 13/6/25.
//

import Foundation

struct Food: Identifiable, Codable {
    let id = UUID()
    var name: String
    var date: Date
    var weight: Int // gramms
    
}
