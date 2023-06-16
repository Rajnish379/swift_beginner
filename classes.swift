import Foundation

class Person {
    var name: String
    var age: Int

    // Order doesn't matter while defining the variables inside the constructor
    init(
        name: String,
        age: Int
    ) {
        self.name = name
        self.age = age
    }
    // Don't use mutating prefix here because the variables are automatically made to be mutable in classes
    func increaseAge() {
        self.age += 1
    }
}

// Here the rule related to let stays the same i.e., you cannot assign foo to another instance of class but you can change the instance of foo internally as done below with increasing age
// Unlike structs, classes allow internal mutability without even having to make the variable from let to var
let foo = Person(name: "Foo",
age: 20)

print(foo.age)

// foo.age can be changed both externally and internally
foo.increaseAge()
foo.age += 10
print(foo.age)
// Unlike structs where the constructor will be created for us implicitly, whereas for classes we have to create the constructor ourselves


// Here bar gets a reference of foo but not a copy of it
let bar = foo
bar.increaseAge()
print(bar.age)
print(foo.age)

// === operator is a swift operator which is used to confirm if two variables are pointing to the same instance of class in memory

if foo === bar {
    print("Foo and Bar point to the same memory")
} else {
    print("They don't point to the same memory")
}


class Vehicle {
    func goVroom() {
        print("Vroom vroom")
    }
}


class Car: Vehicle {

}

// Swift inheritance 
let car = Car()
car.goVroom()

// age can only be set internally
class Person2 {
    private(set) var age: Int
    init(age: Int){
        self.age = age
    }
    func increaseAge() {
        self.age += 1
    }
}

let baz = Person2(age:20)
print(baz.age)
baz.increaseAge()
print(baz.age)

class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int

    // Designated initializers cannot delegate their work to other designated initializers
    // i.e. they have to do their work by themselves
    init() { 
        self.model = "X"
        self.year = 2023
    }

    init(
        model: String,
        year: Int
    ) {
        self.model = model
        self.year = year
    }

    // Convenience initializers can delegate their work to other designated initializers
    convenience init(
        model: String
    ) {
        self.init(
            model: model,
            year: 2023
        )
    }
}

// Inside a designated initializer of your sub class you cannot call a convenience initializer of your super class, i.e., they can only call the designated initializers of their super class
class TeslaModelY: Tesla {
    override init() {
        super.init(model:"Y",year: 2023)
    }

}

let modelY = TeslaModelY()
print(modelY.model)
print(modelY.year)
print(modelY.manufacturer)

// Be careful here because even though person is a local variable inside doSomething function, it has access to the entire fooBar which is a Person2 class instance because classes are reference types
let fooBar = Person2(age: 20)
print(fooBar.age)
func doSomething(with person: Person2) {
    person.increaseAge()
}
doSomething(with:fooBar)
print(fooBar.age)

class MyClass {
    init() {
        print("Initialized")
    }
    func doSomething() {
        print("Do Something")
    }
    deinit {
        print("Deinitialized")
    }
}

// After the code inside the closure is executed, the deinitializer is called to remove all instances of the class from the memory 
let myClosure = {
let myClass = MyClass()
myClass.doSomething()
}

myClosure()

let c = readLine()