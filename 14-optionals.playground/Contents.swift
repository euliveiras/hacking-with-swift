import Cocoa

func square(_ num: Int){
    num * num
}

let num: Int? = nil

if let num = num {
    // shadowing
    print("Square of \(num) is \(square(num))")
} else {
    print("Num is null")
}

func findGreatestValue(in numbers: [Int]) -> Int? {
    if numbers.count == 0 {
        return nil
    }
    
    var greatestValue = Int()
    for num in numbers {
        if num > greatestValue {
            greatestValue = num
        }
    }
    
    return greatestValue
}

findGreatestValue(in: [1, 3, 56, 0, 21323])

func printSquare(_ number: Int?){
    guard let unwrappedNumber = number else {
        print("function is missing param")
        return
    }
    
    print(unwrappedNumber * unwrappedNumber)
}

printSquare(nil)
printSquare(20)

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)

print(book.author ?? "Anonymous")

// checkpoint 9

func randomNumber(in arr: [Int]?) -> Int { arr?.randomElement() ?? Int.random(in: 1...100) }

print(randomNumber(in: nil))
print(randomNumber(in: []))
print(randomNumber(in: [1]))
print(randomNumber(in: [1,2,3,4,5,6]))
print(randomNumber(in: []))
