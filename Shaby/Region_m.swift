//
//  Region_m.swift
//  Shaby
//
//  Created by bsamh on 04/02/2024.
//

import Foundation
import CloudKit

struct Region {
    var recordID: CKRecord.ID
    var regionID: String
    var regionName: String
    var recipeIDs: [String] // Assuming this connects to multiple recipes
    var image: CKAsset?

    init?(record: CKRecord) {
        guard
            let regionID = record["regionID"] as? String,
            let regionName = record["regionName"] as? String,
            let recipeIDs = record["recipeID"] as? [String] // Assuming this is correct based on your schema
        else { return nil }

        self.recordID = record.recordID
        self.regionID = regionID
        self.regionName = regionName
        self.recipeIDs = recipeIDs
        self.image = record["Image"] as? CKAsset
    }
}
