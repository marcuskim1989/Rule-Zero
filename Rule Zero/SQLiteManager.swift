//
//  SQLiteManager.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/22/23.
//

import GRDB
import Foundation

struct SQLiteManager {
   // static let shared = try! DatabaseManager()
    
    let dbQueue: DatabaseQueue
    
    init() throws {
        // Initialize the database queue
        
        let databaseURL = try FileManager.default
                    .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                    .appendingPathComponent(K.tableName)
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
            try db.create(table: K.tableName) { t in
                t.autoIncrementedPrimaryKey(K.Columns.idColumn)
                t.column(K.Columns.colorsColumn, .text).notNull()
                t.column(K.Columns.formatColumn, .integer).notNull()
                t.column(K.Columns.budgetContraintsColumn)
                t.column(K.Columns.limitedColumn)
                t.column(K.Columns.matchTypeColumn)
            }
        }
        
        
        
        // Add more migrations for other tables if needed
        
        return migrator
    }
    
    func addRuleBookToDatabase(_ ruleBook: RuleBook) throws {
            
            try dbQueue.write { db in
                try ruleBook.insert(db)
            }
        
        do {
            let tableExists = try dbQueue.read { db in
                try db.tableExists(K.tableName)
            }
            
            
            if tableExists {
                print("Table \(K.tableName) exists.")
            } else {
                print("Table \(K.tableName) does not exist.")
            }
        } catch {
            print("Error reading table")
        }
        }
    
    func fetchRuleBookFromDatabase() throws -> RuleBook {
        try dbQueue.read { db in
            let ruleBook = try RuleBook.fetchOne(db, key: 1)
            return ruleBook ?? RuleBook(id: 1, colors: "error", format: "error", budgetConstraints: "error", limited: "error", matchType: "error")
        
        }
    }
}


