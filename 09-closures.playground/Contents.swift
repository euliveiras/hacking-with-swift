import Cocoa

func greet(_ user: String) {
    print("Hello, \(user)")
}

let greetAdmin = greet

greetAdmin("Admin")

//let sayHello = {
//    print("Hello")
//}
//
//sayHello()

func getUserData(for id: Int) -> String {
    if id == 1889 {
        return "Taylor Swift"
    } else {
        return "Unknow"
    }
}

let data: (Int) -> String = getUserData

let user = data(1889)

print(user)

let sayHello = { (name: String) -> String in
    "Hi, \(name)"
}

print(sayHello("Matheus"))

let team = [ "Arthas", "Uther", "Abbaddon", "Jaina", "Thrall", "Garrosh" ]

let paladinOfLightFirst = team.sorted(by: {
    (name1: String, name2: String) -> Bool in
        if name1  == "Uther" {
            return true
        } else if name2 == "Uther" {
            return false
        }
        
        return name1 < name2
    }
)

print(paladinOfLightFirst)

let shamanFirst = team.sorted(by: {
    a, b in
    if a == "Thrall" {
        return true
    } else if b == "Thrall" {
        return false
    }
    return a < b
    }
)

print(shamanFirst)

let warriorFirst = team.sorted {
    a, b in
    if a == "Garrosh" {
        return true
    } else if b == "Garrosh" {
        return false
    }
    return a < b
}

print(warriorFirst)

let womanFirst = team.sorted {
    if $0 == "Jaina" {
        return true
    } else if $1 == "Jaina" {
        return false
    }
    return $0 < $1
}

print(womanFirst)

let reversedTeam = team.sorted { $0 > $1 }

print(reversedTeam)

let measureSize = { (size: Int) -> Void in
    switch size {
    case 1...20:
        print("Is between 1 and 20")
    default:
        print("Out of bounds")
    }
}

measureSize(2)

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let numbers = makeArray(size: 5) {
    Int.random(in: 0...20)
}

let numbers2 = makeArray(size: 3, using: {
    Int.random(in: 0...20)
})

print(numbers2)
print(numbers)

func doSomeImportantWork(first: () -> Void, second: () -> Void, third: () -> Void){
    print("About to start first work...")
    first()
    print("About to start second work")
    second()
    print("About to start last work")
    third()
    print("finished all tasks")
}

doSomeImportantWork {
    print("First")
} second: {
   print("Second")
} third: {
  print("Third")
}

func checkPoint5(){
    let luckyNumbers = [ 7, 4, 38, 21, 16, 15, 12, 33, 31, 49 ]
    
    let result = luckyNumbers
            .filter { !$0.isMultiple(of: 2) }
            .sorted { $0 > $1 }
            .map { "\($0) is a lucky number!" }
    
    print(result)
}

checkPoint5()
