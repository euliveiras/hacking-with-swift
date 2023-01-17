import Cocoa

struct Employee {
    let name: String
    let password: String
    
    static let example = Employee(name: "Matheus", password: "1234kk")
}

struct Car {
    let model: String
    let seats: Int
    var gear = 0 {
        didSet {
            print("Now the car has \(gear) gears")
        }
    }
    
    mutating func setGear(_ number: Int) {
        let range = 1...10
        if !range.contains(number){
            print("Out of bounds")
        }
        self.gear += number
    }
    
}

var siena = Car(model: "Sedan", seats: 4)

print(siena.gear)

siena.setGear(1)
siena.setGear(1)
siena.setGear(1)
