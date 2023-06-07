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
    @State private var selectedColors = ""
    @State private var selectedFormat = ""
    @State private var selectedBudgetOption = ""
    @State private var selectedLimitedFormat = ""
    @State private var selectedMatchType = ""
    
    
    let colors = ["White", "Blue", "Black", "Red", "Green"]
    
    
    let formats = ["Commander", "Brawl", "Oathbreaker", "100-Card Singleton", "Canadian Highlander", "Frontier", "Standard", "Pioneer", "Modern", "Legacy", "Vintage", "Block Constructed", "Tiny Leaders", "Old School 93/94", "Tribal", "Silver Bordered"]
    
    
    let budgetOptions = ["Penny Dreadful", "Pauper", "Peasant", "Artisan", "Rares-Only"]
    
    
    let limitedFormats = ["Cube", "Draft", "Sealed", "Pack Wars", "Reverse Draft", "Rochester", "Chaos Draft"]
    
    
    let matchTypes = ["Horde", "Two-Headed Giant", "Star", "Archenemy", "Emperor", "Duel Commander"]
    
    
    
    
    
    var body: some View {
        
        
        
        VStack {
            
            VStack {
                
                Text("Colors")
                
                Picker("Select an option", selection: $selectedColors) {
                    ForEach(colors, id: \.self) { option in
                        Text(option)
                    }
                    
                }.pickerStyle(WheelPickerStyle())
            }.onAppear {
                do {
                    let manager = try SQLiteManager()
                    
                } catch {
                    print("Failed to create SQLiteManager instance: \(error)")
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
                
                let rulebook = RuleBook(colors: selectedColors, format: selectedFormat, budgetConstraints: selectedBudgetOption, limited: selectedLimitedFormat, matchType: selectedMatchType)
                
                

                        }
        }
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.portrait)
        
        
    }
}
