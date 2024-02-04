//
//  Ingredients_m.swift
//  Shaby
//
//  Created by bsamh on 04/02/2024.
//

import Foundation
import CloudKit

struct Ingredient {
    var recordID: CKRecord.ID
    var ingredientID: String
    var quantity: Double
    var item: String
    var recipeID: String
    var unit: String

    init?(record: CKRecord) {
        guard
            let ingredientID = record["IngredientID"] as? String,
            let quantity = record["Quantity"] as? Double,
            let item = record["item"] as? String,
            let recipeID = record["recipeID"] as? String,
            let unit = record["unit"] as? String
        else { return nil }

        self.recordID = record.recordID
        self.ingredientID = ingredientID
        self.quantity = quantity
        self.item = item
        self.recipeID = recipeID
        self.unit = unit
    }
}
