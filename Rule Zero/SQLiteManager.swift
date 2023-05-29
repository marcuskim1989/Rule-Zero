//
//  SQLiteManager.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/22/23.
//

import GRDB
import Foundation

class SQLiteManager {
   // static let shared = try! DatabaseManager()
    
    let dbQueue: DatabaseQueue
    
    init() throws {
        // Initialize the database queue
        
        let databaseURL = try FileManager.default
                    .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                    .appendingPathComponent("mydatabase.sqlite")
        dbQueue = try DatabaseQueue(path: databaseURL.path)
        
        // Run migrations to create tables
        try migrator.migrate(dbQueue)
        
        if FileManager.default.fileExists(atPath: databaseURL.path) {
            print("SQLite database file exists.")
        } else {
            print("SQLite database file does not exist.")
        }
    }
    
    // Create the table using a migration
    private var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        
        migrator.registerMigration("createRuleBookTable") { db in
            try db.create(table: "RuleBook") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("Colors", .text).notNull()
                t.column("Format", .integer).notNull()
                t.column("Budget Constraints")
                t.column("Limited")
                t.column("Match")
            }
        }
        
        do {
            let tableExists = try dbQueue.read { db in
                try db.tableExists("RuleBook")
            }
            
            
            if tableExists {
                print("Table 'RuleBook' exists.")
            } else {
                print("Table 'RuleBook' does not exist.")
            }
        } catch {
            print("Error reading table")
        }
        
        
//        try dbQueue.write { db in
//            try db.create(table: "player") { t in
//                t.primaryKey("id", .text)
//                t.column("name", .text).notNull()
//                t.column("score", .integer).notNull()
//            }
//        }
        
        // Add more migrations for other tables if needed
        
        return migrator
    }
    
    // ... other database operations ...
}


