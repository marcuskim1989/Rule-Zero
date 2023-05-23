//
//  DataModel.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/22/23.
//

import Foundation
import GRDB

struct Product: TableRecord, Codable {
    var id: Int64
    var name: String
    var price: Double
    var customAttributes: [String: String]
    
    
    // Define the table name
    static let databaseTableName = "product"
    
    // Define the columns
    enum Columns: String, ColumnExpression, CaseIterable {
        case id
        case name
        case price
        case customAttributes
    }
}
