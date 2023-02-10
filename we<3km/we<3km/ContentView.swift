//
//  ContentView.swift
//  we<3km
//
//  Created by Matheus Oliveira  on 09/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var inputValue: Double = 0.0
    @State var outputFormat: String = "kilometers"
    
    @FocusState var isInputValueFocused: Bool
    
    let formatsDict = [ "kilometers": 1.0, "meters": 3280.84, "feet": 3280.84, "yards": 3280.84, "miles":  0.62137121212119317271]
        
    var outputValue: Double {
        var result = 0.0
        for i in formatsDict {
            if i.key == outputFormat {
                 result = i.value
            }
        }
        return result * inputValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Transform", value: $inputValue, format: .number)
                        .focused($isInputValueFocused)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Input value")
                }
                
                Section {
                    Text("kilometers")
                } header: {
                    Text("Input unit")
                }
                
                Section {
                    Picker("Output unit", selection: $outputFormat) {
                        ForEach(formatsDict.sorted(by: >), id: \.key) { key, value in
                            Text(key)
                        }
                    }
                }
                
                Section {
                    Text(outputValue, format: .number)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("We<3km")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isInputValueFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
