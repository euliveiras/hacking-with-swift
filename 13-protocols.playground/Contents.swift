import Cocoa

protocol Vehicle {
    var type: String { get }
    var numberOfSeats: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

protocol isEletric {
    
}

struct Car: Vehicle, isEletric{
    let type = "car" 
    var numberOfSeats: Int = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof(){
        print("It's a nice day!")
    }
}

struct Airplane: Vehicle {
    let type = "airplane"
    var numberOfSeats: Int = 100
    
    func estimateTime(for distance: Int) -> Int {
        distance / 200
    }
    
    func travel(distance: Int) {
        print("I'm flying \(distance)km")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("\(vehicle.type) is too slow. I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
let airplane = Airplane()

commute(distance: 1000000, using: car)
commute(distance: 10000, using: airplane)

func getEstimateTravel(vehicles: [Vehicle], distance: Int){
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.type): \(estimate) hours to travel \(distance)km")
    }
}

getEstimateTravel(vehicles: [car, airplane], distance: 500)

//

func getSomeRandomNumber() -> some Equatable{
    Int.random(in: 1...10)
}

func getSomeRandomBoolean() -> some Equatable{
    Bool.random()
}

let num = getSomeRandomNumber()

print(getSomeRandomNumber() == getSomeRandomNumber())

protocol View {}

class Button: View {
    
}

let button = Button()

func createButton() -> View {
    button
}

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var string = """
Some
random
string
"""
print(string.lines)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.readingHours = pageCount / 50
        self.pageCount = pageCount
    }
}

let lotr = Book(title: "Lord of the rings", pageCount: 1128)
let prideAndPrejudice = Book(title: "Pride and Prejudice", pageCount: 578, readingHours: 24)

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello(){
        print("Hi! Mi name is \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let matheus = Employee(name: "Matheus")
matheus.sayHello()

// checkpoint 8

protocol Building {
    var numberOfRooms: Int { get set }
    var buyCost: Int { get set }
    var seller: String { get set }
    
    func printSales()
}

extension Building {
    func printSales(){
        print("""
            This build has \(numberOfRooms) rooms.
            Costs \(buyCost).
            The agent seller is \(seller)
            """)
    }
}

struct House: Building {
    var numberOfRooms: Int
    var buyCost: Int
    var seller: String
}

struct Office: Building {
    var numberOfRooms: Int
    var buyCost: Int
    var seller: String
}

let myHouse = House(numberOfRooms: 6, buyCost: 300_000, seller: "Me")
let myOffice = Office(numberOfRooms: 2, buyCost: 500_000, seller: "Me")

