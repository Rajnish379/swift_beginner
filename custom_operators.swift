import Foundation

let firstName: String? = "Foo"
let lastName: String? = " Bar"
// Concatenation of optional strings is not available by default with + operator
// Whereas for normal strings concatenation is possible with the + operator
let fullName = firstName + lastName
print(fullName)

// binary infix
func + (
    lhs: String?,
    rhs: String?
) -> String? {
    switch(lhs, rhs) {
        case(.none, .none):
        return nil
        case let (.some(value),.none),
        let(.none,.some(value)):
        return value
        case let (.some(lhs),.some(rhs)):
        return lhs + rhs
    }
}

// unary prefix

prefix operator ^
prefix func ^ (value: String) -> String {
    value.uppercased()
}
let lowercaseName = "Foo Bar"
let uppercaseName = ^lowercaseName
print(uppercaseName)

postfix operator *
postfix func * (value: String) -> String {
    "*** \(value) ***"
}

let withStars = lowercaseName*
print(withStars)

struct Person {
    let name: String
}

struct Family {
    let members: [Person]
}

// + between two persons 
func + (
    lhs: Person,
    rhs: Person
) -> Family {
    Family(
        members: [
            lhs,rhs
        ]
    )
}

// + between a family and person to add person into family
func + (
    lhs: Family,
    rhs: Person
) -> Family {
   var members = family.members
   members.append(rhs)
   return Family(
    members: members
   )
}

func + (
    lhs: Family,
    rhs: [Person]
) -> Family {
    var members = lhs.members
    members.append(contentsOf: rhs)
    return Family(
        members: members
    )
}

let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")
let daughter1 = Person(name: "Daughter 1")
let daughter2 = Person(name: "Daughter 2")

let family = mom + dad
let familyWithSon = family + son
print(family)
print(familyWithSon)
print(family.members.count)
print(familyWithSon.members.count)
let familyWithDaughters = familyWithSon + [daughter1,daughter2]
print(familyWithDaughters.members.count)

let c = readLine()