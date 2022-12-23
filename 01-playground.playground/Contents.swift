import UIKit

var greeting = "Hello, playground"

let character = "random"

print(character.count)
print(character.uppercased())
print("greeting has prefix Hello? \(greeting.hasPrefix("Hello"))")
print("greeting has sufix ground? \(greeting.hasSuffix("playground"))")

func isDouble(_ num: Int) -> Void {
    let result = num.isMultiple(of: 2)
    if result {
        print("\(num) is double")
    } else {
        print("\(num) is odd")
    }
}

isDouble(10)
isDouble(0)
isDouble(3)

let floatNumber = 0.1 + 0.2

print(floatNumber)

var isAuthenticated = false;
isAuthenticated.toggle()
print(isAuthenticated)
// toggle e um metodo que flipa o valor do booleanoa

let people = "Haters"
let action = "hate"
let str = people + " gonna " + action

print(str)

let celsius = 32.0
let fahrenheirt = (celsius * 9 / 5) + 32

print("""
The temperature in celsius is \(celsius)℃.
In fahrenheirt is \(fahrenheirt)℉.
""")
