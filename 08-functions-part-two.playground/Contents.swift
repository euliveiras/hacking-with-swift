import Cocoa

func table(for number: Int, end: Int = 10){
    for i in 1...end {
        print("\(i) * \(number) is equal to \(i * number)")
    }
}

table(for: 7)
table(for: 5, end: 12)

var characters = [ "Lana", "Wario", "Taylor", "Sterling", "Mason" ]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "GOOD"
    } else {
        return "EXCELLENT"
    }
}

let password = "123"

do {
    let result = try checkPassword(password)
//    let result = try! checkPassword(password)
    print("Password rating: \(result)")
} catch PasswordError.short{
    print("Please, use a longer password")
} catch PasswordError.obvious{
    print("I have the same combination on my luggage!")
} catch {
    print("There is an error: \(error.localizedDescription)")
}

enum SqrtError: Error {
    case outOfBounds, noRoot
}

func getNumberSqrt(_ number: Int) {
    func customizedSqrt() throws -> Int {
        
        if number > 100_000 {
            throw SqrtError.outOfBounds
        } else if number < 0 {
            throw SqrtError.outOfBounds
        }
        
        for i in 1...10_000 {
            if i * i == 10_000 && number != 10_000 {
                throw SqrtError.noRoot
            } else if i * i == number {
                return i
            } else if i * i > number {
                throw SqrtError.noRoot
            }
        }
        throw SqrtError.noRoot
    }
    
    
    do {
        let result = try customizedSqrt()
        print("Square root of \(number) is \(result)")
    } catch SqrtError.noRoot{
            print("There is no square root for \(number)")
    } catch SqrtError.outOfBounds{
            print("Number must be between the range of 1 and 100.000")
    } catch {
        print("There is an error: \(error.localizedDescription)")
    }
}

getNumberSqrt(25)
getNumberSqrt(80)
getNumberSqrt(23123)
getNumberSqrt(74)
getNumberSqrt(9)
getNumberSqrt(7)
getNumberSqrt(100_000_000)
getNumberSqrt(-2)
