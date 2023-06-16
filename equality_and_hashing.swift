import Foundation

struct Person: Equatable {
    let id: String
    let name: String
}

let foo1 = Person(id: "1",
name: "Foo")

let foo2 = Person(id: "1",
name: "Bar")

if foo1 == foo2 {
    print("They are equal!")
} else {
    print("They are not equal")
}

// If we don't have this extension for the Person struct, they are not equal because their names don't match
// Because of this extension they become equal because here we are overriding the == operator to compare only the id's of both of the structs
extension Person {
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.id == rhs.id
    }
}

enum AnimalType : Equatable{
    case dog(breed: String)
    case cat(breed: String)
}

let dog1 = AnimalType.dog(breed: "Labradoodle")
let dog2 = AnimalType.dog(breed: "Labradoodle")

if dog1 == dog2 {
    print("They are equal")
} else {
    print("They are not equal")
}

// extension AnimalType: Equatable {
//     static func == (
//         lhs: Self,
//         rhs: Self
//     ) -> Bool {
//         switch (lhs, rhs) {
//             case let (.dog(lhsBreed), .dog(rhsBreed)),
//                 let (.cat(lhsBreed), .cat(rhsBreed)):
//             return lhsBreed == rhsBreed
//             default:
//             return false
            
//         }
//     }
// }
// The above commented code is the same as below code which is more compact 

struct Animal: Equatable {
    let name: String
    let type: AnimalType

    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.type == rhs.type
    }
}

let cat1 = Animal(
    name: "Whiskers",
    type: .cat(
        breed: "Street cat"
    )
)

let cat2 = Animal(
    name: "Whoosh",
    type: .cat(
        breed: "Street cat"
    )
)

if cat1 == cat2 {
    print("They are equal because of their type")
} else {
    print("They are not equal")
}

struct House: Hashable {
    let number: Int
    let numberOfBedrooms: Int
}

// Hash values for both houses are same if the values for both the fields inside the structs are same for both of them
let house1 = House(
    number: 123,
    numberOfBedrooms: 2
)
print(house1.hashValue)
let house2 = House(
    number: 123,
    numberOfBedrooms: 3
)
print(house2.hashValue)

let houses = Set([house1,house2])
print(houses.count)
// We cannot have two structures with the same name in swift within the same scope 
struct NumberedHouse: Hashable {
    let number:Int
    let numberOfBedrooms: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }

    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.number == rhs.number
    }
}

let house3 = NumberedHouse(
    number: 123,
    numberOfBedrooms: 2
)

let house4 = NumberedHouse(
    number: 123,
    numberOfBedrooms: 3
)

let houses3And4 = Set([house3,house4])
print(houses3And4.count)
print(house3.hashValue)
print(house4.hashValue)
print(house3.number.hashValue)
print(house4.number.hashValue)

enum CarPart {
    case roof
    case tire
    case trunk
}

let uniqueParts: Set<CarPart> = [
    .roof,
    .tire,
    .roof,
    .trunk
]
print(uniqueParts)

enum HouseType : Hashable{
    case bigHouse(NumberedHouse)
    case smallHouse(NumberedHouse)
}

let bigHouse1 = HouseType
.bigHouse(
    NumberedHouse(
        number: 1,
        numberOfBedrooms: 1
    )
)

let bigHouse2 = HouseType
.bigHouse(
    NumberedHouse(
        number: 1,
        numberOfBedrooms: 1
    )
)

let smallHouse1 = HouseType
.smallHouse(
    NumberedHouse(
        number: 1,
        numberOfBedrooms: 1
    )
)

let allHouses: Set<HouseType> = [
    bigHouse1,bigHouse2,smallHouse1
]

// both the big houses are same because they are of the same enum type and they have the same values inside it
// Even though the values inside the NumberedHouse are same for both small and big houses, we can see that even the case inside the enum has a hash value and hence the smallHouse is different from the bigHouse
print(allHouses.count)

for value in allHouses {
    print(value)
}




let c = readLine()