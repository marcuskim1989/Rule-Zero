//
//  DataModel.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/22/23.
//

import Foundation
import GRDB

struct RuleBook: Codable, FetchableRecord, PersistableRecord {
    var colors: String
    var format: String
    var budgetConstraints: String
    var limited: String
    var matchType: String
    //var customRules: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case colors
        case format
        case budgetConstraints = "budget_constraints"
        case limited
        case matchType = "match_type"
        //case customRules = "custom_rules"
    }
}
