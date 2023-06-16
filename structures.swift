import Foundation

struct Person {
    let name: String
    let age: Int
}

let foo = Person(
    name: "Rajineesh",
    age: 22
    )

print(foo.name)
print(foo.age)

struct CommodoreComputer {
    let name: String
    let manufacturer: String
    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore"
    }

}

let c64 = CommodoreComputer(
    name: "My Commodore"
)

print(c64.name)
print(c64.manufacturer)

struct Person2 {
    let firstName: String
    let lastName: String

    // Computer properties lets us define constructor for a variable which makes use of the already given values in the structure
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let fooBar = Person2(firstName: "Foo",lastName:"Bar")
print(fooBar.firstName)
print(fooBar.lastName)

print(fooBar.fullName)

struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int) {
        print("Driving...")
        currentSpeed = speed
    }
}

// Can't call a mutating function on an immutable variable because here the immutableCar is marked as a let constant and hence changing the value of the structure defined as let constant using a mutating function is not allowed
let immutableCar = Car(currentSpeed: 10)
// immutableCar.drive(speed: 20)

var mutableCar = Car(currentSpeed: 10)
// mutableCar.drive(speed:30)
// print(mutableCar.currentSpeed)
print(mutableCar.currentSpeed)
let copy = mutableCar
mutableCar.drive(speed: 30)
print(mutableCar.currentSpeed)
print(copy.currentSpeed)

struct LivingThing {
    init() {
        print("I'm a living thing")
    }
}

struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    // Here we are creating a function which can copy the value of one bike into another bike struct with a speed argument for changing the currentSpeed of the new bike to the value of the speed argument specified
    func copy(currentSpeed: Int) -> Bike {
        Bike( manufacturer: self.manufacturer,
        currentSpeed: currentSpeed
        )
    }
}

let bike1 = Bike(
    manufacturer: "HD",
    currentSpeed: 40
)

var bike2 = bike1.copy(currentSpeed: 50)
print(bike1.currentSpeed)
print(bike2.currentSpeed)


let c = readLine()