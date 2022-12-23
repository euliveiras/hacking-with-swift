import Cocoa

var arr = [ 1, 2, 3, 4, 5]
arr[1] = 10
print(arr)

var beatles = [ "Ringo", "John", "George", "Paul"]
beatles.append("Matheus")
let firstBeatle = beatles[0]
let one = arr[0]
let firstTwoBeatles = "\(String(one))º beatle \(firstBeatle)"
print(firstTwoBeatles)

var scores: [Int] = [];
scores.append(213)
scores.append(9)
print(scores.count)

var characters = [ "Lana", "Pam", "Ray", "Taylor"]
characters.remove(at: 2)
print(characters)

characters.removeAll()
print(characters)

let bondMovies = [ "Cassino Royale", "No Time to Die", "Spectre" ]
print(bondMovies.contains("Frozen"))
print(bondMovies.contains("Spectre"))

let cities = [ "Pernambuco", "Rio de Janeiro", "Arraial", "Tijuca" ]
print(cities.sorted())

let presidents = [ "Lula", "Dilma", "Bolsonaro" ]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

var employees: [[String:String]] = [[ "name": "Taylor Swift", "job title": "Singer", "age": "Four"]]

print(employees[0]["name"])
print(employees[0]["job title"])
print(employees[0]["title", default: "unknown"])

let olympics: [Int:String] = [
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2016, default: "Unknown" ])

var mangas: [String:Int] = [:]
mangas["naruto"] = 80
mangas["one piece"] = 104
print(mangas)

var actors = Set<String>()
actors.insert("Samuel L Jackson")
actors.insert("Denzel Washington")
actors.insert("John Travolta")
actors.insert("Nicolas Cage")

let sortedActors = actors.sorted()
print("Set \(actors)")
print("Sorted Set \(sortedActors)")

enum Weekday {
    case segunda, ter, quarta, quinta, sexta
}

var selected = Weekday.segunda
print(selected)

enum UIStyle {
    case light, dark, system;
}

var colorMode: UIStyle = UIStyle.dark
colorMode = .light
print(colorMode)

let string: String
string = "String"
print(string)

/*
 Arrays store many values, and read them using indices
 
 Dictionaries store many values, and read them using keys we specify
 
 Sets store many values, ut we don't choose their order
 
 Enums create our own types to specify a range of acceptable valuesk
 */
