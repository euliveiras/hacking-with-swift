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

let platforms = [ "macOs", "iOS", "watchOS", "tvOS" ]

for os in platforms {
    print("swift works great in \(os)!")
}

for i in 1...10 {
    print("\(i) table")
    for j in 1...10 {
        print("\(i) * \(j) = \(i*j)")
    }
}

for x in 1..<5 {
    print("Counting up to 5", x)
}

var lyric = "haters gonna hate"

for _ in 1..<5 {
    lyric += " hate"
}

print(lyric)

var countDown = 10

while countDown > 0 {
    print("\(countDown)...")
    countDown-=1
    if countDown == 0{
        print("BOOOOOOOOOOOOOOOOOOOOOOOOOOOM!")
    }
}

let id = Int.random(in:  1...100)
let decimal = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    print("I rolled \(roll)")
    roll = Int.random(in: 1...20)
    if roll == 20 {
        print("\(roll), critical hit, bitch!")
    }
}

let filenames = [ "photo.jpeg", "card.txt", "avatar.jpg", "app.error", "icon.jpeg" ]

for filename in filenames {
    if filename.hasSuffix("error"){
        print("Fatal error.")
        break
    } else if(filename.hasSuffix("jpeg") != true){
        continue
    }
    print("Filename ended with suffix .jpeg: \(filename)")
}

let number1 = 13
let number2 = 27

var multiples = [Int]()

for i in 1...100_000 {
    if(i.isMultiple(of: number1) && i.isMultiple(of: number2)){
        multiples.append(i)
        
    }
    if(multiples.count == 10){
        print(multiples)
        break;
    }
}
