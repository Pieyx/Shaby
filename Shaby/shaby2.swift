//
//  Recipe_m.swift
//  Shaby
//
//  Created by bsamh on 04/02/2024.
//

import Foundation

import CloudKit

// Recipe.swift
struct Recipe_m {
    var recordID: CKRecord.ID
    var name: String
    var difficulty: String
    var ingredientIDs: [String]
    var directions: [String]
    var flavors: String
    var regionID: String
    var image: CKAsset?

    init?(record: CKRecord) {
        guard
            let name = record["Name"] as? String,
            let difficulty = record["Difficulty"] as? String,
            let ingredientIDs = record["IngredientID"] as? [String],
            let directions = record["directions"] as? [String],
            let flavors = record["flavors"] as? String,
            let regionID = record["regionID"] as? String
        else { return nil }

        self.recordID = record.recordID
        self.name = name
        self.difficulty = difficulty
        self.ingredientIDs = ingredientIDs
        self.directions = directions
        self.flavors = flavors
        self.regionID = regionID
        self.image = record["Image"] as? CKAsset
    }
}
