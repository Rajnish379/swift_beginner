import Foundation

let name = "Raj"
let name2 = "Adi"

var names = [
	name,
	name2
]

names.append("Bar")
names.append("Baz")

print(names)


// let objects are immutable whereas var objects are mutable
// if we use let for declaring an array then we cannot mutate it nor assign a new value to it but var objects can be assigned a completely new value and can also be mutated like appending new elements to a var array is possible
// use swiftc fileName.swift to compile the code and generate a .exe file of it 
// use lldb fileName to open lldb repl
// use r inside lldb repl to run your code
// use readLine() to halt the program because if you don't use it the program will be executed and terminated really quickly
let foo = "v"
var foo2 = foo

foo2 = "foo 2"
print(foo)
print(foo2)

// This is a structure
let moreNames = [
	"Foo",
	"Bar"
]
var copy = moreNames
copy.append("Baz")
print(moreNames)
print(copy)


// NSMutableArray is a reference type
// This is a class NSMutableArray which is mutable internally 
let oldArray = NSMutableArray(
	array: [
		"Foo",
		"Bar"
	]
)

oldArray.add("Baz")
var newArray = oldArray
newArray.add("Qux")

// Here we would expect that only the newArray will be affected
// But since it is a reference type even though we are only changing the newArray, oldArray will also be changed automatically
// Hence we have to be careful with reference types
print(oldArray)
print(newArray)

let someNames = NSMutableArray(
	array: [
		"Foo",
		"Bar"
	]
)
// someNames = ["Bla"] this won't work because although the NSMutableArray is mutable internally it isn't mutable externally because it is a let
// NSMutableArray is the mutable variant of NSArray

func changeTheArray(_ array: NSArray) {
	// Here the as! keyword is promoting the datatype of copy variable from NSArray to an NSMutableArray
	let copy = array as! NSMutableArray
	copy.add("Baz")
}
// Here even though we are changing the copy of someNames, someNames is also getting affected because of the reference behavior of NSMutableArray
changeTheArray(someNames)
print(someNames)
let n = readLine()



