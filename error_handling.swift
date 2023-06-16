import Foundation

struct Person{
    let firstName: String?
    let lastName: String?

    enum Errors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNamesAreNil
    }

    // if there are conditions inside the if statement separated by comma that means its an and condition
    // throws keyword means that the function can throw an error
    func getFullName() throws -> String {
      switch(firstName, lastName) {
        case(.none, .none):
            throw Errors.bothNamesAreNil
        case(.none, .some):
            throw Errors.firstNameIsNil
        case(.some,.none):
            throw Errors.lastNameIsNil
        case let (.some(firstName),.some(lastName)):
            return "\(firstName) \(lastName)"
      }
    }
}

let foo = Person(
    firstName: nil,
    lastName: nil
)

// Here we are creating a context to catch the error using do block and when the error is thrown, it is catched by the catch block and is printed 
do {
let fullName = try foo.getFullName()

} catch {
    print("Got an error = \(error)")
}


// Looking for specific types of errors can be done using the is keyword inside the catch block
do {
let fullName = try foo.getFullName()
print(fullName)
} catch is Person.Errors { // Here after doing the pattern matching to find out that the error is a Person.Errors error, the error variable is not available to us anymore
    print("Got an error")
}

let bar = Person(
    firstName: nil,
    lastName: nil
)

do {
let fullName = try bar.getFullName()
print(fullName)
} catch Person.Errors.firstNameIsNil {
    print("First name is nil")
} catch Person.Errors.lastNameIsNil {
    print("Last name is nil")
} catch Person.Errors.bothNamesAreNil {
    print("Both names are nil")
} catch {
    print("Some other error was thrown")
}

struct Car {
    let manufacturer: String

    enum Errors: Error {
        case invalidManufacturer
    }

    init(
        manufacturer: String
    ) throws {
        if manufacturer.isEmpty {
            throw Errors.invalidManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do {
    let myCar = try Car(manufacturer: "")

} catch Car.Errors.invalidManufacturer {
    print("Invalid manufacturer")
} catch {
    print("Some other error")
}

// If we call a method using optional try then we don't have access to the error object even though the try statement throws an error
if let yourCar = try? Car(manufacturer: "Tesla") {
    print("Success, your car = \(yourCar)")
} else {
    print("Failed to construct and error is not accessible now")
}


// If we use force try then the entire program will crash and hence it is not recommended to use this syntax even though it exists
let theirCar = try! Car(manufacturer: "Ford")
print(theirCar.manufacturer)


struct Dog {
    let isInjured: Bool
    let isSleeping: Bool

    enum BarkingErrors: Error {
        case cannotBarkIsSleeping
    }

    enum RunningErrors: Error {
        case cannotRunIsInjured
    }

    func bark() throws {
        if isSleeping {
            throw BarkingErrors.cannotBarkIsSleeping
        }
        print("Bark...")

    }

    func run() throws{
        if isInjured {
            throw RunningErrors.cannotRunIsInjured
        }
        print("Run...")
    }

    // Within a throwing function you can use try statements without having to wrap them around do and catch blocks
    func barkAndRun() throws {
        try bark()
        try run()
    }
}

// Dont use flower brackets while initializing struct use () brackets only
let dog = Dog (
    isInjured: true,
    isSleeping: true
)

do {
    try dog.barkAndRun()
} catch Dog.BarkingErrors.cannotBarkIsSleeping,
    Dog.RunningErrors.cannotRunIsInjured { // Here swift goes into the catch block even if one of the two errors only occurs
        print("Cannot-bark-is-sleeping OR Cannot-run-is-injured")

 } catch {
    print("Some other error")
 }



// Catches only cannot bark is sleeping error
 do {
    try dog.barkAndRun()
} catch Dog.BarkingErrors.cannotBarkIsSleeping,
    Dog.RunningErrors.cannotRunIsInjured { 
        print("Cannot-bark-is-sleeping")

 } catch Dog.RunningErrors.cannotRunIsInjured {
    print("Cannot-run-is-injured")
 } catch {
    print("Some other error")
 }


// For a function to be marked as rethrows it needs to have a closure function which throws something
 func fullName(
    firstName: String?,
    lastName: String?,
    calculator: (String?, String?) throws -> String? 
 ) rethrows -> String? {
    try calculator(
        firstName,
        lastName
    )
 }

 enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
 }

// A conversion from String? type to String is basically a promotion of type from a optional string to a regular string
// A promotion is fine for pattern matching but a demotion is not
 func + (
    firstName: String?,
    lastName: String?
 ) throws -> String {
    guard let firstName, !firstName.isEmpty else {
        // Making sure that firstName exists and is not empty using guard
        throw NameErrors.firstNameIsInvalid
    }
    guard let lastName, !lastName.isEmpty else {
        // Making sure that firstName exists and is not empty using guard
        throw NameErrors.lastNameIsInvalid
    }
    return "\(firstName) \(lastName)"
 }

do{
    let fooBar = try fullName(
        firstName: "Foo",
        lastName: "Bar", 
        calculator: +
    )
    print(fooBar!)
} catch NameErrors.firstNameIsInvalid {
    print("First name is invalid")
} catch NameErrors.lastNameIsInvalid {
    print("Last name is invalid")
} catch let err {
    print("Some other error = \(err)")
}

enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: Int)
}

func getPreviousPositiveInteger(
    from int: Int
) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return Result.failure(
            IntegerErrors.noPositiveIntegerBefore(
                thisValue: int
            )
        )
    }
    return Result.success(int - 1)
}

func performGet(forValue value: Int) {
    switch getPreviousPositiveInteger(from: value) {
        case let .success(previousValue):
            print("Previous value is \(previousValue)")
        case let .failure(error):
            switch error {
                case let .noPositiveIntegerBefore(thisValue):
                print("No positive integer before \(thisValue)")
            }
    }
}

performGet(forValue: 0)
performGet(forValue: 2) 


let c = readLine()