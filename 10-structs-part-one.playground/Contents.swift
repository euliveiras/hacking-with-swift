import Cocoa

struct Employee {
    var name = "Anonymous"
    var vacationAllocated = 0
    var vacationTaken = 0
    
    
    var vacationRemaining: Int {
        get {
        vacationAllocated - vacationTaken
        }
    
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
    
//    mutating func takeVacation(days: Int) {
//        if vacationRemaining > days {
//            vacationRemaining -= days
//            print("Im going to vacation")
//            print("Days remaining: \(vacationRemaining)")
//        } else {
//            print("Oops! There isnt enough days remaining")
//        }
//    }
    
    func showName() -> String {
        return name
    }
}

var matheus = Employee(name: "Matheus", vacationAllocated: 30)

matheus.vacationTaken = 20
print(matheus.vacationRemaining)

matheus.vacationRemaining = 100

print(matheus.vacationAllocated)

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()

game.score = 5

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old valus is: \(oldValue)")
        }
    }
}

var app = App()

app.contacts.append("Matheus Oliveira")
app.contacts.append("Ana Oliveira")
app.contacts.append("Luiza Oliveira")
app.contacts.append("Nelisa Oliveira")


struct Player {
    var name = String()
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let one = Player(name: "Matheus")

print(one.number)
print(one.number)
print(one.number)

