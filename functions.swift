import Foundation

func noArgumentsAndNoReturnValue() {
    print("I don't know what I'm doing")
}

noArgumentsAndNoReturnValue()

func plusTwo(value: Int) {
    let newValue = value + 2
    print(newValue)
}
plusTwo(value: 30)

func newPlusTwo(value: Int) -> Int {
    value + 2
}

print(newPlusTwo(value: 44))

func customAdd(
    value1: Int,
    value2: Int
) -> Int {
    value1 + value2
}
let customAdded = customAdd(
    value1: 10,
    value2: 20
)

print(customAdded)

// Function which doesn't require the arguments to be named while calling
// Have to use an _ before the name of the argument to make it internal 
func customMinus(
    _ lhs: Int,
    _ rhs: Int
) -> Int {
    lhs - rhs
} 
let customSubtracted = customMinus(20,10)
print(customSubtracted)

// Use discardableResult annotation to let the compiler know that we are not using the result of the function anywhere so the compiler won't output any warnings about the function result being unused
@discardableResult
func myCustomAdd(
    _ lhs: Int,
    _ rhs: Int
) -> Int {
    lhs + rhs
}

print(myCustomAdd(20,90))


// Function inside function 
// Here only the outer function will be able to access the child function inside it but not any other functions can access it besides the parent
func doSomethingComplicated(
    with value: Int
) -> Int {
    func mainLogic(value: Int) -> Int {
        value + 2
    }
    return mainLogic(value: value + 3)
}
print(doSomethingComplicated(with: 30))

func getFullName(
    firstName: String = "Foo",
    lastName: String = "Bar"
) -> String {
    "\(firstName) \(lastName)"
}

print(getFullName())
print(getFullName(firstName: "Baz"))
print(getFullName(lastName: "Foo"))
print(getFullName(firstName: "Baz", lastName: "Qux"))

let l = readLine()