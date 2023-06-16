import Foundation

// In classes and structs, a function needs to have a body but in protocol a function with empty body can exist
// Protocols are like interfaces in java
protocol CanBreathe {
    func breathe()
}

// Structures don't allow inheritance from other structs but it can allow inheritance from protocols
struct Animal: CanBreathe {
    func breathe() {
        print("Animal breathing...")
    }

}

struct Person: CanBreathe {
    func breathe() {
        print("Person breathing...")
    }
}

let dog = Animal()
dog.breathe()
let foo = Person()
foo.breathe()

// If you write function body in protocol it gives you an error
protocol CanJump {
    func jump()
}
// Use extensions to implement protocol functions
extension CanJump {
    func jump() {
        print("Jumping...")
    }
}

// Since we already have an implementation defined in the extension for the functions inside CanJump protocol we don't have to implement it again in Cat struct
// Since Cat is conforming to the protocol, it will automatically get its implementation by default
// But it can be overridden inside Cat struct
struct Cat: CanJump {

}

let whiskers = Cat()
whiskers.jump()

protocol HasName {
    var name: String { get }
    var age: Int { get set }
}

extension HasName {
    func describeMe() -> String {
        return "Your name is \(name) and you are \(age) years old"
    }
    mutating func increaseAge() {
        self.age += 1
    }
}

struct Dog: HasName {
    let name: String
    var age: Int
}

var woof = Dog(name: "Woof",age: 10)

print(woof.name)
print(woof.age)
woof.age+=1
print(woof.age)
print(woof.describeMe())
woof.increaseAge()
print(woof.age)

protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
    mutating func increaseSpeed(by value: Int) {
        self.speed += value
    }
}

struct Bike : Vehicle {
    var speed: Int = 0

}

var bike = Bike()
print(bike.speed)
bike.increaseSpeed(by: 10)
print(bike.speed)

struct Worm{

}
// Any is a very low object type and Vehicle is higher in hierarchy than Any datatype
// is keyword is used to make sure that an object conforms to a given protocol or not
func describe(obj: Any) {
    if obj is Vehicle {
        print("obj conforms to the Vehicle protocol")
    } else {
        print("obj doesn't conform to the Vehicle protocol")
    }
}

describe(obj: bike)
let worm = Worm()
describe(obj: worm)

func increaseSpeedIfVehicle(
    obj: Any
) {
    if var vehicle = obj as? Vehicle {
        print(vehicle.speed)
        vehicle.increaseSpeed(by: 10)
        print(vehicle.speed)        
    } else {
        print("This was not a vehicle")
    }
}
increaseSpeedIfVehicle(obj: bike)
// Here speed of bike is 10 only because in the above function call, swift passes the copy of bike object because in swift, structures are value types but not reference types
print(bike.speed)
let c = readLine()
 