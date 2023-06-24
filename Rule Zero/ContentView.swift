//
//  ContentView.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/15/23.
//

import SwiftUI
import GRDB

struct ContentView: View {
    //    @State private var id: Int64 = -1
    //    @State private var name: String = ""
    //    @State private var price: Double = 0
    
    
    @State private var selectedColors = "White"
    @State private var selectedFormat = "Commander"
    @State private var selectedBudgetOption = "Penny Dreadful"
    @State private var selectedLimitedFormat = "Cube"
    @State private var selectedMatchType = "Horde"
    @State var ruleBook: RuleBook!
    @State var sqliteManager: SQLiteManager!
    
    let colors = ["White", "Blue", "Black", "Red", "Green"]
    
    
    let formats = ["Commander", "Brawl", "Oathbreaker", "100-Card Singleton", "Canadian Highlander", "Frontier", "Standard", "Pioneer", "Modern", "Legacy", "Vintage", "Block Constructed", "Tiny Leaders", "Old School 93/94", "Tribal", "Silver Bordered"]
    
    let budgetOptions = ["Penny Dreadful", "Pauper", "Peasant", "Artisan", "Rares-Only"]
    
    let limitedFormats = ["Cube", "Draft", "Sealed", "Pack Wars", "Reverse Draft", "Rochester", "Chaos Draft"]

    let matchTypes = ["Horde", "Two-Headed Giant", "Star", "Archenemy", "Emperor", "Duel Commander"]
    

    init() {
            
        //initializeSQLiteManager()
        
    }

    var body: some View {
        
        VStack {
            
            VStack {
                
                Text("Colors")
                
                Picker("Select an option", selection: $selectedColors) {
                    ForEach(colors, id: \.self) { option in
                        Text(option)
                    }
                    
                }.pickerStyle(WheelPickerStyle())
            }
            
//            .onAppear {
//                initializeSQLiteManager()
//            }
            
            
            
        }.onAppear {
            do {
                self.sqliteManager = try SQLiteManager()
                
                print("self.sqliteManager is \(self.sqliteManager)")
    //            guard let sqliteManager = sqliteManager else {
    //                    fatalError("SQLiteManager is not initialized")
    //            }
            } catch {
                fatalError("Failed to initialize SQLiteManager: \(error)")
            }
        }
            
            VStack {
                
                Text("Format")
                
                Picker("Select an option", selection: $selectedFormat) {
                    ForEach(formats, id: \.self) { option in
                        Text(option)
                    }
                    
                }.pickerStyle(WheelPickerStyle())
            }
            
            
            VStack {
                
                Text("Budget Constraints")
                
                Picker("Select an option", selection: $selectedBudgetOption) {
                    ForEach(budgetOptions, id: \.self) { option in
                        Text(option)
                    }
                    
                }.pickerStyle(WheelPickerStyle())
            }
            
            VStack {
                
                Text("Limited Format")
                
                Picker("Select an option", selection: $selectedLimitedFormat) {
                    ForEach(limitedFormats, id: \.self) { option in
                        Text(option)
                    }
                    
                }.pickerStyle(WheelPickerStyle())
                
                
            }
            
            
            
            VStack() {
                
                Text("Match rules")
                
                Picker("Select an option", selection: $selectedMatchType) {
                    ForEach(matchTypes, id: \.self) { option in
                        Text(option)
                    }
                    
                }.pickerStyle(WheelPickerStyle())
            }
            
            Button("Save") {
               
                
                let ruleBook = RuleBook(id: "id", colors: selectedColors, format: selectedFormat, budgetConstraints: selectedBudgetOption, limited: selectedLimitedFormat, matchType: selectedMatchType)
                
                do {
                    print(ruleBook)
                    
//                    guard sqliteManager != nil {
//                        print("sqliteManager is nil")
//                    }
                    
                    try sqliteManager.addRuleBookToDatabase(ruleBook)
                    
                    
                    
                } catch {
                    print("Adding Unsuccessful")
                }
                
                
                
                
                    
                            }
        
        Button("Fetch") {
           
            do {
                
                let ruleBook = try sqliteManager.fetchRuleBookFromDatabase()
                
                Text("Colors: \(ruleBook.colors)")
                Text("Format: \(ruleBook.format)")
                Text("Budget Constraints: \(ruleBook.budgetConstraints)")
                Text("Limited: \(ruleBook.limited)")
                Text("Match Type: \(ruleBook.matchType)")
                
            } catch {
                print("Failed to fetch data ")
            }
            
            
        }
                
                /*
                 
                 var colors: String
                 var format: String
                 var budgetConstraints: String
                 var limited: String
                 var matchType: String
                 */

        
            
            
    }
        
        
    

//    func initializeSQLiteManager() {
//        do {
//            self.sqliteManager = try SQLiteManager()
//
//        } catch {
//            print("Could initialize SQLiteManager")
//        }
//    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            return ContentView()
    }
}
