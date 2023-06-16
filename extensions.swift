import Foundation

extension Int {
    func plusTwo() -> Int {
        self + 2
    }
}
// self is actually the current instance on which the extension is being applied
let two = 2
print(two.plusTwo())

struct Person {
    let firstName: String
    let lastName: String
    
}

// We can extend a struct using extensions and add a new constructor or initializer on top of the default constructor or initializer that swift provides to you 
extension Person {
    init(fullName: String) {
        let components = fullName.components(separatedBy: " ")
        self.init(
            firstName: components.first ?? fullName,
            lastName: components.last ?? fullName
        )
    }
}

let person = Person(fullName: "Foo Bar")
print(person.firstName)
print(person.lastName)

protocol GoesVroom {
    var vroomValue: String { get }
    func goVroom() -> String
}

extension GoesVroom {
    func goVroom() -> String {
       return "\(self.vroomValue) goes vroom!"
    }
}

struct Car {
    let manufacturer: String
    let model: String
}

let modelX = Car(
    manufacturer: "Tesla",
    model: "X"
)

extension Car: GoesVroom {
    var vroomValue: String {
        "\(self.manufacturer) model \(self.model)"
    }

}

print(modelX.goVroom())

// Using extensions we can extend a class and add a new convenience initializer
class MyDouble {
    let value: Double
    init(value: Double){
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)
    }
}
// let myDouble = MyDouble()
// myDouble.value
// Below code is a fancy way of writing the above two lines in a single line
print(MyDouble().value)


// We can even extend protocols using extensions and when we extend it, all the structures and classes which conform to the protocol will automatically get the newly added function in the extension 
extension GoesVroom {
    func goVroomVroomEvenMore() -> String {
        "\(self.vroomValue) is vrooming even more!"
    }
}
print(modelX.goVroomVroomEvenMore())
let c = readLine() 