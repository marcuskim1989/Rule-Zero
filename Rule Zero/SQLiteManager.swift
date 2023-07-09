//
//  SQLiteManager.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/22/23.
//

import GRDB
import Foundation

class SQLiteManager {
   
    
    var dbQueue: DatabaseQueue
    
    init() throws {
        // Initialize the database queue
        
        do {
            
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
            
            print("SQLiteManager initialization succeeded")
        } catch {
            
            dbQueue = try DatabaseQueue(path: "unknown")
            print("SQLiteManager initialization failed")
        }
            
        
        
    }
    
    // Create the table using a migration
    private var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        
        migrator.registerMigration("createRuleBookTable") { db in
            try db.create(table: K.tableName) { t in
                t.autoIncrementedPrimaryKey(K.Columns.idColumn)
                t.column(K.Columns.colorsColumn)
                t.column(K.Columns.formatColumn)
                t.column(K.Columns.budgetContraintsColumn)
                t.column(K.Columns.limitedColumn)
                t.column(K.Columns.matchTypeColumn)
            
            }
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
      
        
        return migrator
    }
    

    
    
    func addRuleBookToDatabase(_ ruleBook: RuleBook) throws {
            
        print(ruleBook)
        
        do {
            
            try dbQueue.write { db in
                
                try! ruleBook.insert(db)
                
                
                
            }
            
        } catch {
            print("Inside addRuleBookToDatabase catch. Adding failed.")
        }
        }
    
    func fetchRuleBookFromDatabase() throws -> RuleBook {
        try dbQueue.read { db in
            let ruleBook = try RuleBook.fetchOne(db, key: 1)
            return ruleBook ?? RuleBook(id: 0, colors: "error", format: "error", budgetConstraints: "error", limited: "error", matchType: "error")
        
        }
    }
}


