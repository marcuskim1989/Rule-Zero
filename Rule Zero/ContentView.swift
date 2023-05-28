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
    
    let options1 = ["White", "Blue", "Black", "Red", "Green"]
    @State private var selectedOption1 = "Option 1"
    
    let options2 = ["Commander", "Brawl", "Oathbreaker", "100-Card Singleton", "Canadian Highlander", "Frontier", "Standard", "Pioneer", "Modern", "Legacy", "Vintage", "Block Constructed", "Tiny Leaders", "Old School 93/94", "Tribal", "Silver Bordered"]
    @State private var selectedOption2 = "Option 1"
    
    let options3 = ["Penny Dreadful", "Pauper", "Peasant", "Artisan", "Rares-Only"]
    @State private var selectedOption3 = "Option 1"
    
    let options4 = ["Cube", "Draft", "Sealed", "Pack Wars", "Reverse Draft", "Rochester", "Chaos Draft"]
    @State private var selectedOption4 = "Option 1"
    
    let options5 = ["Horde", "Two-Headed Giant", "Star", "Archenemy", "Emperor", "Duel Commander"]
    @State private var selectedOption5 = "Option 1"
    
    var body: some View {
        VStack {
            //            Form {
            //                Section(header: Text("Product Details")) {
            //                    TextField("ID", value: $id, formatter: NumberFormatter())
            //                    TextField("Name", text: $name)
            //                    TextField("Price", value: $price, formatter: NumberFormatter())
            //                }
            //
            //                Button(action: {
            //                }) {
            //                    Text("Save Product")
            //                }
            //            }
            //            .padding()
            
            Picker("Select an option", selection: $selectedOption1) {
                ForEach(options1, id: \.self) { option in
                    Text(option)
                }
                
            }.pickerStyle(WheelPickerStyle())
            
            Picker("Select an option", selection: $selectedOption2) {
                ForEach(options2, id: \.self) { option in
                    Text(option)
                }
                
            }.pickerStyle(WheelPickerStyle())
            
            
            Picker("Select an option", selection: $selectedOption3) {
                ForEach(options3, id: \.self) { option in
                    Text(option)
                }
                
            }.pickerStyle(WheelPickerStyle())
            
            Picker("Select an option", selection: $selectedOption4) {
                ForEach(options4, id: \.self) { option in
                    Text(option)
                }
                
            }.pickerStyle(WheelPickerStyle())
            
            
            Picker("Select an option", selection: $selectedOption5) {
                ForEach(options5, id: \.self) { option in
                    Text(option)
                }
                
            }.pickerStyle(WheelPickerStyle())
        }
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
