//
//  ContentView.swift
//  Rule Zero
//
//  Created by Marcus Y. Kim on 5/15/23.
//

import SwiftUI
import GRDB

struct ContentView: View {
    @State private var id: Int64 = -1
    @State private var name: String = ""
    @State private var price: Double = 0
    
    var sql = SQLiteManager()
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Product Details")) {
                    TextField("ID", value: $id, formatter: NumberFormatter())
                    TextField("Name", text: $name)
                    TextField("Price", value: $price, formatter: NumberFormatter())
                }
                
                Button(action: {
                    sql.insertProduct(id: <#T##Int64#>, name: <#T##String#>, price: <#T##Double#>)
                }) {
                    Text("Save Product")
                }
            }
            .padding()
        }.onAppear {
            let dbQueue = try DatabaseQueue()
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
