import Foundation

// func add(
//     _ lhs: Int,
//     _ rhs: Int
// ) -> Int {
//     lhs + rhs
// }

let add: (Int, Int) -> Int = 
{ (lhs: Int,rhs: Int) -> Int in

lhs+rhs

}

print(add(20,30))


// using is the external argument name where the function has to be passed
func customAdd(
    _ lhs: Int,
    _ rhs: Int,
    using function: (Int, Int) -> Int 
) -> Int {
    function(lhs,rhs)
}

// in keyword here lets swift know where the body of the internal function starts from 
print(customAdd(
    20,
    49,
    using: { (lhs: Int,rhs: Int) -> Int in 
    lhs + rhs
    }
))

// if our closure is at the end of the function then swift follows a trailing closure syntax where it removes the external argument
print(customAdd(
    30,70
) {
    (lhs: Int, rhs: Int) -> Int in 
    lhs+rhs
})

// Swift automatically infers the data types of the inner closure from the definition itself even though we haven't mentioned them inside the calling function
// Only disadvantage using this syntax is that the compiler has to put more work here in verifying that the data types of the arguments given are actually Int or not whereas in the previous code we are explicitly mentioning that the datatypes of the given variables are Int
print(customAdd(
    30,90
){
    (lhs,rhs) in
    lhs+rhs
})

// More difficulty for the compiler to comprehend this line
print(customAdd(3,90) { $0 + $1 })

// Writing code which is difficult for compiler to understand is fine if it is being done in smaller codebases 
// But for larger codebases where there are thousands of source files to compile it is not a good way to be followed

let ages = [30,20,19,40]
// Sorting in descending order
print(ages.sorted(by: {(lhs: Int,rhs: Int) -> Bool in 
lhs>rhs
}))

// Short form of sorted function
print(ages.sorted(by: <))

func customAdd2(
    using function: (Int, Int) -> Int,
    _ lhs: Int,
    _ rhs: Int 
) -> Int {
    function(lhs,rhs)
}

// The functions below look more dirtier because we have used the closure at the beginning of the function instead of following the trailing closure syntax
// It's recommended to follow the trailing closure syntax so that the code looks more cleaner
print(customAdd2(
    using: {(lhs, rhs) in 
    lhs + rhs}, 20, 60
))

print(customAdd2(using: {$0 + $1 + 90},20,57))


func add10To(_ value: Int) -> Int {
    value + 10
}

func add10(value: Int) -> Int {
    value + 10
}


func add20To(_ value: Int) -> Int {
    value + 20
}

func doAddition(
    on value: Int,
    using function: (Int) -> Int
) -> Int {
    function(value)
}

// Any function without a func keyword beside it is actually a closure

print(doAddition(on: 20,using: add10To(_:)))

print(doAddition(on: 20,using: add20To(_:)))

print(doAddition(on: 45, using: add10(value:)))

let c = readLine()