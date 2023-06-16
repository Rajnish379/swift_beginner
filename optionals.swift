import Foundation

func multiplyByTwo(_ value: Int? = nil) -> Int {
    if let value {
        return value * 2
    } else {
        return 0
    }
}

// You can never pass this function an empty value normally because the argument that the compiler is expecting for this function is an Integer
// But by using optionals we can do this
print(multiplyByTwo())
print(multiplyByTwo(nil))
print(multiplyByTwo(4))
print(multiplyByTwo(8))

let age: Int? = nil
if age != nil {
    print("Age is there! How Odd!")
} else {
    print("Age is nil. Correct.")
}

if let age {
    print("Age is there. How odd! Its value is \(age)")
} else {
    print("No age is present. As expected")
}

func checkAge() {
 
    // guards have to return or else they will throw an error
    guard age != nil else {
        print("Age is nil as expected")
        return 
    }
    print("Age is not nil here. Strange!")
}

checkAge() 

let age2: Int? = 10
func checkAge2() {
    guard let age2 else{
        print("Age is nil. How strange")
        return 
    }
    print("Age2 is not nil as expected. Value = \(age2)") // Unwrapping of optionals can also be done with a guard

}
checkAge2()

switch age {
    case .none:
    print("Age has no value as expected")
    break
    case let .some(value):
    print("Age has the value of \(value)")
    break
}

// We can compare optional values with normal values without unwrapping them at all
// But the only thing is here we would think of age2 as a normal variable but not optional 
if age2 == 0 {
    print("Age2 is 0 as expected, and is not nil")
} else {
    print("Age2 is not 0, How strange!")
}

// Here we would know that age2 is indeed an optional value
if age2 == .some(10) {
    print("Age2 is 10 as expected, and is not nil")
} else {
    print("Age2 is not 0, How strange!")
}

struct Person {
    let name: String
    let address: Address?
    struct Address {
        let firstLine: String?
    }
}

let foo: Person = Person(
    name: "Foo",
    address: nil
)

// Here the optional ? operator check whether the address itself is present or not for the person. Here the address is nil hence it goes into the else block and prints the expected line
if let fooFirstAddressLine = foo.address?.firstLine {
    print(fooFirstAddressLine)
} else {
    print("Foo doesn't have an address with first line, as expected")
}

if let fooAddress = foo.address,
    let firstLine = fooAddress.firstLine {
        print(fooAddress)
        print(firstLine)
    }

let bar: Person? = Person(
    name: "Bar",
    address: Person.Address(
        firstLine: nil
    )
)

// Optionality continues until it can't continue any further
if bar?.name == "Bar",
bar?.address?.firstLine == nil {
    print("Bar's name is bar and has no first line of address")
} else {
    print("Seems like something isn't working right!")
}

let baz: Person? = Person(
    name: "Baz",
    address: Person.Address(
        firstLine: "Baz first line"
    )
)

switch baz?.address?.firstLine{
    case let .some(firstLine) where
    firstLine.starts(with: "Baz"):
    print("Baz first address line = \(firstLine)")
    case let .some(firstLine):
    print("Baz first address line that didn't match the previous case")
    print(firstLine)
    case .none:
    print("Baz first address line is nil??? Weird!")
}

func getFullName(
    firstName: String,
    lastName: String?
) -> String? {
    if let lastName {
        return "\(firstName) \(lastName)"
    } else {
        return nil
    }
}

print(getFullName(
    firstName: "Foo",
    lastName: nil
))

print(getFullName(
    firstName: "Foo",
    lastName: "Bar"
)!)

func getFullName2(
    firstName: String,
    lastName: String?
) -> String? {
     guard let lastName else {
        return nil
    } 
        return "\(firstName) \(lastName)" 
}



let c = readLine()