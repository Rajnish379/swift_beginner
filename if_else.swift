import Foundation

let name = "Rajineesh"
let age = 22
let uname = "Adhi"
let uage = 19

if name == "rajineesh" {
    print("Your name is \(name)")
} else {
    print("Oops, I guessed it wrong")
}  // else statement is optional i.e., only an if is also fine

if name == "Rajineesh" {
    print("Now I guessed it correctly")
} else if name == "Foo" {
    print("Are you foo?")
} else {
    print("Okay I give up")
}

if "Rajineesh" == name {
    print("An uncommon way of doing this")
}

if name == "Rajineesh" && age == 24 {
    print("Name s Rajineesh and age is 22")
} else if age == 22 {
    print("I only guessed the age right")
} else {
    print("I don't know what I'm doing")
}

if age == 22 || name == "Foooooooooo" {
    print("Either age is 22, name is Foo or both")
} else if name == "Rajineesh" || age == 22 {
    print("It's too late to get in this clause")
}


// Here even though age is not 20 the statement inside if still gets printed because we are mixing both or and operators and the condition after the or operator holds true
// Since there are no parentheses inside the if condition that means the compiler knows that the developer hasn't provided any precedence and the conditions are checked simply from left to right
if name == "Rajineesh" && age == 20 && uname == "Adhi" || uage == 19 {
 print("My name is Rajineesh and I'm 20 and your name is Adhi...OR... you are 19")
}

if (name == "Rajineesh" && age == 23) || (uname == "Adhi" || uage == 19) {
    print("My name is Rajineesh and I'm 23... OR... your name is Adhi or you are 19")
} else {
    print("Hmm, that didn't work so well")
}
 let r = readLine()