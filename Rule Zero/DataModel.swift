//
//  DataModel.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/22/23.
//

import Foundation
import GRDB

struct Product: Codable, FetchableRecord, PersistableRecord {
    var id: Int
    var name: String
    var score: Int
    
}


//struct Player: Codable, FetchableRecord, PersistableRecord {
//    var id: String
//    var name: String
//    var score: Int
//}
