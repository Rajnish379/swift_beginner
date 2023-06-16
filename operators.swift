import Foundation

let myAge = 22
let yourAge = 20

if myAge > yourAge {
	print("I'm older than you")
} else if myAge < yourAge {
	print("I'm younger than you")
} else {
	print("Oh hey, we are the same age")
}

let myMothersAge = myAge + 30
print(myMothersAge)
let doubleMyAge = myAge * 2 // this is an infix operation because the * operator is sitting in between the two arguments 
print(doubleMyAge)

/// 1. unary prefix
let foo = !true
print(foo)

/// 2. unary postfix
let name = Optional("Vandad")
print(type(of: name))
// The ! operator force grabs the name inside the Optional class 
let unaryPostFix = name!
print(type(of: unaryPostFix))

/// 3. binary infix
let result = 1 + 2
let names = "Foo" + " " + "Bar"
print(names)
print(result)

let age = 30
// let message: String
// if age >= 18 {
// 	message = "You are an adult"
// } else {
// 	message = "You are not yet an adult"
// }

// There is no internal formatter in swift unlike other programming languages like rust and dart
let message = age >= 18 ? "You are an adult" : "You are not yet an adult"
print(message)
let r = readLine()