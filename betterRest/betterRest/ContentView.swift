//
//  ContentView.swift
//  betterRest
//
//  Created by Matheus Oliveira  on 19/02/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State var sleepAmount = 8.0
    @State var wakeUp = defaultWakeTime
    @State var coffeeIntake = 1
    
    @State var alertTitle = ""
    @State var alertMessage = ""
    @State var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var estimatedSleepTime: String {
        return calculateBedTime()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    DatePicker("Select the time you want to wake up", selection: $wakeUp, displayedComponents: [.hourAndMinute])
                        .labelsHidden()
                    
                } header: {
                    Text("When do you want to wake up?")
                }
                
                Text("Desired amount to sleep")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                
                Section {
                    Picker("Coffee cups", selection: $coffeeIntake){
                        ForEach(1...20, id: \.self) { cup in
                            Text("\(cup) cup")
                        }
                    }
                }
//                Text("Daily coffee intake")
//                    .font(.headline)
//                    .navigationTitle("Better rest")
//                    .toolbar {
//                        Button("Calculate", action: calculateBedTime)
//                    }
//                    .alert(alertTitle, isPresented: $showingAlert){
//                            Button("ok") {}
//                    } message: {
//                        Text(alertMessage)
//                    }
                HStack(alignment: .center) {
                    Text("Your sleep time is \(estimatedSleepTime)")
                }
             .navigationTitle("Better rest")   }
        }
        
        //        VStack {
        //            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25) //            DatePicker("Please, select a date", selection: $wakeUp,in: Date.now..., displayedComponents: [.hourAndMinute , .date])
        //
        //            Spacer()
        //
        //            Text(Date.now.formatted(date: .long, time: .omitted))
        //        }
        //        .padding()
        //    }
        //
        //    func trivialExample() {
        //        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        //    }
    }
    func calculateBedTime() -> String {
        do {
            let config = MLModelConfiguration()
            let model =  try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeIntake))
            
            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "Sorry, there was a problem calculating your sleep bedtime"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
