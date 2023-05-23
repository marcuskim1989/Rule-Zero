//
//  SQLiteManager.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/22/23.
//

import GRDB

struct SQLiteManager {
    
    var dbQueue: DatabaseQueue
    
    init(dbQueue: DatabaseQueue) {
        self.dbQueue = dbQueue
    }
    
    func createProductTable() throws {
        var migrator = DatabaseMigrator()
        migrator.registerMigration("createProductTable") { db in
            try db.create(table: Product.databaseTableName) { t in
                t.column(Product.Columns.id.rawValue)
                t.column(Product.Columns.name.rawValue)
                t.column(Product.Columns.price.rawValue)
            }
        }
        
        
        try migrator.migrate(dbQueue)
        
        do {
            try createProductTable()
        } catch {
            // Handle any errors
            print("Error creating product table: \(error)")
        }
    }
    
    func insertProduct(id: inout Int64, name: inout String, price: inout Double) {
        let product = Product(
            id: id,
            name: name,
            price: price,
            customAttributes: [:]
        )
        
        do {
            try dbQueue.write { db in
                try product.save(db)
            }
            
            // Clear form fields after successful insertion
            name = ""
            price = 0
            category = ""
            description = ""
            rating = 0
            
            // Show success message
            print("Product saved successfully!")
        } catch {
            // Handle error during database operation
            print("Error saving product: \(error)")
        }
    }
   
}


