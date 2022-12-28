import Cocoa

var greeting = "Hello, playground"

let exName = "Daniel Boezio"
let ourName = "Adrielle Reis"

if ourName < exName {
    print("A vem antes do B")
}

var arr = [ 1, 2, 3 ]

if arr.count >= 3 {
    arr.removeLast()
    arr.append(5)
}

print(arr)

var userName: String = String();

// é bem ineficiente para o swift comparar strings
// logo é melhor usar isEmpty para sabermos se uma string é vazia
/*if userName == "" {
    userName = "Anonymous"
}*/

if userName.isEmpty {
    userName = "Anonymous"
}

print("Hello, \(userName)")

let age = 18
let name = "Matheus"

if age >= 18 && name == "Matheus" {
    print("Você pode votar, \(name).")
} else if age == 17 {
    print("Apenas um ano para votar!!!!")
} else {
    print("Você não pode votar.")
}

var hasParentalConsent = true;

if age >= 20 || hasParentalConsent {
    print("You can buy a game!")
} else {
    print("You cannot buy a game :(.")
}

enum Transport {
    case helicopter, carr, scoooter, bike, airplane
}

let transport = Transport.helicopter

if transport == .airplane || transport == .helicopter {
    print("Let's fly!!")
} else if transport == .carr {
    print("You're will be stuck in traffic.")
} else if transport == .bike {
    print("Hope that exists a bike path")
} else {
    print("Im will need to hire some scooter!")
}

enum Forecast {
    case rain, sun, snow, wind
}

let weather = Forecast.sun

switch weather {
case .sun:
    print("It's a sunny day!")
default:
    print("Something went wrong!")
}

let day = 5

switch day {
case 5:
    print("5")
    fallthrough
case 4:
    print("4")
    fallthrough
case 3:
    print("3")
    fallthrough
case 2:
    print("2")
    fallthrough
case 1:
    print("1")
    fallthrough
default:
    print("default")
}

var names = [ "Taylor", "Darth Maul", "Luna" ]
names.removeAll()

let crewCount = names.isEmpty ? "No one" : "Has \(names.count) count"

print(crewCount)


