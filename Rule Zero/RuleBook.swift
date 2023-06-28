//
//  DataModel.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/22/23.
//

import Foundation
import GRDB

/*
 
 // 3. Define a record type
 struct Player: Codable, FetchableRecord, PersistableRecord {
     var id: String
     var name: String
     var score: Int
 }
 */


struct RuleBook: Codable, FetchableRecord, PersistableRecord {
    var id: Int
    var colors: String
    var format: String
    var budgetConstraints: String
    var limited: String
    var matchType: String
    //var customRules: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case colors = "colors"
        case format = "format"
        case budgetConstraints = "budget_constraints"
        case limited = "limited"
        case matchType = "match_type"
        //case customRules = "custom_rules"
        
        
    }
}
/*
 
 "id"
 "colors"
 "format"
 "budget_constraints"
 "limited"
 "match_type"
 "custom_rules"
 
 */
