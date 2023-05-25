//
//  SQLiteManager.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/22/23.
//

import GRDB

struct SQLiteManager {
    static let shared = try! DatabaseManager()
    
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
            try db.create(table: Product.databaseTableName) { t in
                t.autoIncrementedPrimaryKey(Product.Columns.id)
                t.column(Product.Columns.name).notNull()
                t.column(Product.Columns.price).notNull()
            }
        }
        
        // Add more migrations for other tables if needed
        
        return migrator
    }
    
    // ... other database operations ...
}


