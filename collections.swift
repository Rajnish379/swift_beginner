import Foundation

let numbers = [1,2,3,4]
print(numbers.first)
print(numbers.last)
print(numbers.count)
print(numbers.map(-))

var mutatingNumbers = [4,5,6]
mutatingNumbers.append(7)
print(mutatingNumbers)
mutatingNumbers.insert(3, at: 0)
print(mutatingNumbers)

mutatingNumbers.insert(contentsOf: [1,2],
at: 0)

for value in numbers {
    print(value)
}
for value in numbers where value % 2 == 0 {
    print(value)
}

// map is a generic function because it allows us to change the result value to a different type than that of the input type
let values = numbers.map {(value: Int) -> String in  String(value * 2)}

print(values);

print(numbers.filter {(value: Int) -> Bool in 
value >= 3})

// compact map is a combination of map and filter
print(numbers.compactMap {(value: Int) -> String? in
value % 2 == 0 ? String(value): nil})

// filter cannot change the datatype of the result
// If you want to do both filtering of values and also change the datatype of the result set use compact map
let numbers2: [Int?] = [1,2,nil, 4,5]
print(numbers2.count)
let notNils = numbers2.filter{(value: Int?) -> Bool in
value != nil}
print(notNils)

// Collections here can store even duplicate values as new values
let numbers3 = [1,2,1,2]
print(numbers3.count)

// Use as [Any] suffix after initializing the array so that it can support heterogenous objects
let stuff1 = [
    1,"Hello",2,"World"
] as [Any]
print(stuff1)
print(stuff1.count)

let stuff2: [Any] = [
    1,"Hello",2,"World"
] 

// In sets ordering is destroyed entirely after removing the duplicates
let uniqueNumbers = Set([1,2,1,2,3])
print(uniqueNumbers.count)
print(uniqueNumbers.map(-))

let myNumbers = Set([1,2,3,nil,5])
// compact map removes the nil values 
let notNilNumbers = Set(
    myNumbers.compactMap {
        $0
    }
)
print(notNilNumbers)

// Set with heterogenous objects can be created by declaring the Set datatype as AnyHashable
let stuff3: Set<AnyHashable> = [
    1,2,3,"Vandad"
]
print(stuff3.count)

// as? operator is used to filter out elements with only a particular datatype in collections
let intsInStuff1 = stuff1
    .compactMap { (value: Any) -> Int? in 
    value as? Int}

let stringsInStuff1 = stuff1
    .compactMap { (value: Any) -> String? in 
    value as? String}

// Compact map on set returns array but not a set
let intsInStuff3 = stuff3
    .compactMap { (value: AnyHashable) -> Int? in 
    value as? Int}
print(intsInStuff1)
print(stringsInStuff1)
print(intsInStuff3)

print(type(of: intsInStuff3))

struct Person : Hashable{
    let id: UUID
    let name: String
    let age: Int
}

let fooId = UUID()
let foo = Person(
    id: fooId,
    name: "Foo",
    age: 20
)
let bar = Person(
    id: fooId,
    name: "Bar",
    age: 30
)

let people: Set<Person> = [foo,bar]
print(people)
print(people.count)

struct Person2: Hashable {
    let id: UUID
    let name: String
    let age: Int

    // Here we have mentioned to hasher that we have to consider id only while implementing the hashing mechanism for sets
func hash(into hasher: inout Hasher) {
    hasher.combine(id)
}

// We also have to override the == operator so that we can change the default behaviour of equality where it normally checks all the fields of struct to where it checks only the id of the structs
static func == (
    lhs: Self,
    rhs: Self
) -> Bool {
    lhs.id == rhs.id
}
}



let bazId = UUID()
let baz = Person2(
    id: bazId,
    name: "Baz",
    age: 20
)

let qux = Person2(
    id: bazId,
    name: "Qux",
    age: 30
)

let people2 = Set([baz,qux])
print(people2.count)
print(people2.first)
print(people2.first!.name)

let userInfo = [
    "name": "Foo",
    "age": 20,
    "address": [
        "line1": "Address line 1",
        "postCode": "12345"
    ]
] as [String: Any]  // We are specifying to swift that the keys are of type String and the values are of type Any

print(userInfo["name"])
print(userInfo["age"])
print(userInfo["address"])
// Here as we are telling that the value of the dictionary is of type any, we have to tell swift to force cast it into a dictionary of type [String:String] so we can extract the key's value present in the nested dictionary
// We should never do this force cast because the program will crash if the "address" key doesn't exist or if the dictionary inside the address key is not of type [String:String]
print((userInfo["address"] as! [String:String])["postCode"])

print(userInfo.keys)
print(userInfo.values)


for (key,value) in userInfo {
    // For every iteration, the key and its corresponding value will be printed in consecutive lines
    print(key)
    print(value)
}

// Only age:20 will be printed here
for (key,value) in userInfo where value is Int {
    print(key)
    print(value)
}

// Here we are checking for dictionary entries whose values are integers and length of key is greater than 2
// if key.count > 3 nothing will be printed because length of age is exactly three
for (key,value) in userInfo where value is Int && key.count>2 {
    print(key)
    print(value)
}

let c = readLine()  