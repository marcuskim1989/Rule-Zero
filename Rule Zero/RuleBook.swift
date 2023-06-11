//
//  DataModel.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/22/23.
//

import Foundation
import GRDB

struct RuleBook: Codable, FetchableRecord, PersistableRecord {
    var id: Int = 1
    var colors: String
    var format: String
    var budgetConstraints: String
    var limited: String
    var matchType: String
    //var customRules: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case colors
        case format
        case budgetConstraints
        case limited
        case matchType
        //case customRules = "custom_rules"
    }
}
