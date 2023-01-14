import Cocoa

var greeting = "Hello, playground"

func printTimesTables(number: Int, end: Int) -> Void {
    for i in 1...end {
        print("\(i) x \(number) is \(i*number)")
    }
}

printTimesTables(number: 7, end: 24)

func hasSameLetters (word1: String, word2: String) -> Bool {
    return word1.sorted() == word2.sorted()
}

//func hasSameLetters (word1: String, word2: String) -> Bool {
//    word1.sorted() == word2.sorted()
// quando temos uma linha só na função, podemos omitir a keyword return
//}

print(hasSameLetters(word1: "2ABCD", word2: "DCBA"))
print(hasSameLetters(word1: "ABCD", word2: "DCBA"))

func pythagoras(a: Double, b: Double) -> Double {
   sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)

print(c)

func getUser() -> [String:String]{
    ["name": "Taylor", "lastName": "Swift"]
}

print(getUser()["name"])

func getUserWithTuples() -> (FirstName: String, LastName: String){
    (FirstName: "Taylor", LastName: "Swift")
//    ("Taylor", "Swift")
//    Podemos emitir o nome das propriedades de uma Tuple no retorno
}

let (FirstName, _ ) = getUserWithTuples()
print(FirstName)
//print(LastName)


func isUppercased(_ string: String) -> Bool {
    string == string.uppercased()
}

print(isUppercased("MATHEUSs"))

func table(for number: Int) -> Void {
    for i in 1...10 {
        print("\(i) x \(number) is \(i*number)")
    }
}

table(for: 8)
