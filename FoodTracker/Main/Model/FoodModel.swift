//
//  FoodModel.swift
//  FoodTracker
//
//  Created by Александр Калашников on 13/6/25.
//

import Foundation
import RealmSwift

//struct Food: Identifiable, Codable {
//    let id = UUID()
//    var name: String
//    var date: Date
//    var weight: Int // gramms
//}

class Food: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var weight: Int 
    @Persisted var date: Date
    
//    init(name: String, weight: Int, date: Date) {
//        self.name = name
//        self.weight = weight
//        self.date = date
//    }
}
