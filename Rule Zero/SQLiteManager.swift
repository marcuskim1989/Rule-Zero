//
//  SQLiteManager.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/22/23.
//

import GRDB

struct SQLiteManager {
   // static let shared = try! DatabaseManager()
    
    private let dbQueue: DatabaseQueue
    
    private init() throws {
        // Initialize the database queue
        dbQueue = try DatabaseQueue(path: "path/to/database.sqlite")
        
        // Run migrations to create tables
        try migrator.migrate(dbQueue)
    }
    
    // Create the table using a migration
    private var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        
        migrator.registerMigration("createProductsTable") { db in
            try db.create(table: "Hello, world!") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("john", .text).notNull()
                t.column("score", .integer).notNull()
            }
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


