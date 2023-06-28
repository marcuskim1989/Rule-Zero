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
                t.primaryKey(K.Columns.idColumn, .text)//.primaryKey()
                t.column(K.Columns.colorsColumn)
                t.column(K.Columns.formatColumn)
                t.column(K.Columns.budgetContraintsColumn)
                t.column(K.Columns.limitedColumn)
                t.column(K.Columns.matchTypeColumn)
                
                /*
                 case id = "id"
                 case colors = "colors"
                 case format = "format"
                 case budgetConstraints = "budget_constraints"
                 case limited = "limited"
                 case matchType = "match_type"
                 
                 
                 static let idColumn = "id"
                 static let colorsColumn = "colors"
                 static let formatColumn = "format"
                 static let budgetContraintsColumn = "budget_constraints"
                 static let limitedColumn = "limited"
                 static let matchTypeColumn = "match_type"
                 static let customRulesColumn = "custom_rules"
                 
                 */
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
        /*
         
         let dbQueue = try DatabaseQueue(path: "/path/to/database.sqlite")

         // 2. Define the database schema
         try dbQueue.write { db in
             try db.create(table: "player") { t in
                 t.primaryKey("id", .text)
                 t.column("name", .text).notNull()
                 t.column("score", .integer).notNull()
             }
         }

         

         

         let players: [Player] = try dbQueue.read { db in
             try Player.fetchAll(db)
         }
         
         */
        
        // Add more migrations for other tables if needed
        
        return migrator
    }
    
    /*
     
     // 4. Write and read in the database
     try dbQueue.write { db in
         try Player(id: "1", name: "Arthur", score: 100).insert(db)
         try Player(id: "2", name: "Barbara", score: 1000).insert(db)
     }
     */
    
    
    func addRuleBookToDatabase(_ ruleBook: RuleBook) throws {
            
        print(ruleBook)
        
        do {
            
            try! dbQueue.write { db in
                
                try ruleBook.insert(db)
                
            }
            
        } catch {
            print("Inside addRuleBookToDatabase catch. Adding failed.")
        }
        }
    
    func fetchRuleBookFromDatabase() throws -> RuleBook {
        try dbQueue.read { db in
            let ruleBook = try RuleBook.fetchOne(db, key: 1)
            return ruleBook ?? RuleBook(id: "id", colors: "error", format: "error", budgetConstraints: "error", limited: "error", matchType: "error")
        
        }
    }
}


