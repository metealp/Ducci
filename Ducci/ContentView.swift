//
//  ContentView.swift
//  Ducci
//
//  Created by Mete Alp Kizilcay on 13.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numberOfPeople: Int = 2 //we need to add +2 because of started at 2
    @State private var checkAmount: String = ""
    @State private var tipPercentage = 1
    
    var totalPerPerson: Double {
        let tip = Double(tipPercentages[tipPercentage]) / 100 + 1
        var totalPayment = (Double(checkAmount) ?? 0.0) * tip
        let result = totalPayment / Double(numberOfPeople + 2)
        return result
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach (2 ..< 25){ number in
                            Text("\(number) people")
                        }
                    }
                    
                }
                
                Section (header: Text("How much tip do you want to give")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach (0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                
                }
//                Text("$\(String(format: "%.2f", totalPerPerson))")  ###this is the old way
                
                Section (header: Text("Total per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                        .foregroundColor(tipPercentages[tipPercentage] != 0 ? .blue : .red)
                }
            }
//            .navigationBarTitle("Ducci", .inline)
            .navigationBarTitle("Ducci", displayMode: .inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
