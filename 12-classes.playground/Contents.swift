import Cocoa

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()

newGame.score += 20

class Employee {
    var hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary(){
        print("I work \(hours) a day")
    }
}

final class Developer: Employee {
    func work(){
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("Yeah, i ll check twitter")
    }
}

class Manager: Employee {
    func work(){
        print("I'm going to meetings \(hours) hours.")
    }
}

let dev = Developer(hours: 6)
dev.work()

let manager = Manager(hours: 8)
manager.printSummary()

let dahl = Developer(hours: 10)
dahl.printSummary()

class Vehicle {
    let isEletric: Bool
    
    init(isEletric: Bool) {
        self.isEletric = isEletric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isEletric: Bool, isConvertible: Bool){
        self.isConvertible = isConvertible
        super.init(isEletric: isEletric)
    }
}

class Airplane: Vehicle {}

let airplane = Airplane(isEletric: false)

let car = Car(isEletric: true, isConvertible: true)

class User {
    let id: Int
    var name = "Anonymous"
    init(id: Int, name: String){
        self.id = id
        self.name = name
        print("Im alive!")
    }
    deinit {
        print("\(name) is dead!")
    }
}

var user1 = User(id: 2, name: "User 1")
var user2 = user1

user2.name = "Taylor Swift"

print(user1.name)
print(user2.name)

var users = [User]()

for i in 1...3 {
    let user = User(id: i, name: "User \(i)")
    print("User \(user.id) is in control!")
    users.append(user)
}

users.removeAll()

// CHECKPOINT

class Animal {
    private let legs: Int
    
    init(legs: Int){
        self.legs = legs
    }
}

class Dog: Animal {
    private var race: String = "Not known"
    
    init(race: String) {
        self.race = race
        super.init(legs: 4)
    }
    
    func speak(){
        print("Roowf! (Barking in unknowing dog language)")
    }
}

class Corgi: Dog {
    init(){
        super.init(race: "corgi")
    }
    
    override func speak() {
        print("Rooooooooowf! (Barking in corgi`s language")
    }
}

class Poodle: Dog {
    init(){
        super.init(race: "poodle")
    }
    
    override func speak() {
        print("Rooooooooowf! (Barking in poodle`s language")
    }
}

let corgi = Corgi()
corgi.speak()


let poodle = Poodle()
poodle.speak()

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Persian: Cat {
    init(){
        super.init(isTame: true)
    }
}

class Lion: Cat {
    init(){
        super.init(isTame: false)
    }
}

let persian = Persian()

print("Is persian tamed? \(persian.isTame)")

let lion = Lion()

print("Is persian tamed? \(lion.isTame)")
