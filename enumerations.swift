import Foundation

enum Animals {
    case cat
    case dog
    case rabbit
    case hedgeHog

}

let cat = Animals.cat
print(cat)

if cat == Animals.cat {
    print("This is a cat")
} else if cat == Animals.dog {
    print("This is a dog")
} else {
    print("This is something else")
}

// func == (
//     lhs: Animals,
//     rhs: Int
// ) -> Bool {
//     lhs == .cat && rhs == 3
// }
// If we don't include all the enum cases in the switch statement the compiler will throw an error that switch must be exhaustive
// Hence we have to include a default case when we don't want to include all the cases in the switch 


switch cat {
    case .cat: 
    print("This is a cat")
    break
    case .dog:
    print("This is a dog")
    break
    case .rabbit:
    print("This is a rabbit")
    break
    case .hedgeHog:
    print("This is a hedgehog")
    break
}

// Swift enums can have values associated with their cases
enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(
    path: URL(string: "https://apple.com")!
)

// In enums which have cases associated with values we cannot simple use if statements or compare two enums directly. We have to do that in the specific format mentioned below
switch wwwApple {
    case .fileOrFolder(
        path: let path,
        name: let name
    ):
    print(path)
    print(name)
    break
    case .wwwUrl(path: let p):
    print(p)
    break
    case .song(
        artist: let artist,
        songName: let songName
    ):
    print(artist)
    print(songName)
    break

}

switch wwwApple {
    case .fileOrFolder(
        let path,
        let name
    ):
    print(path)
    print(name)
    break
    case .wwwUrl(let p):
    print(p)
    break
    case .song(
        let artist,
        let songName
    ):
    print(artist)
    print(songName)
    break

}


switch wwwApple {
    case let .fileOrFolder(
        path,
        name
    ):
    print(path)
    print(name)
    break
    case let .wwwUrl(p):
    print(p)
    break
    case let .song(
        artist,
        songName
    ):
    print(artist)
    print(songName)
    break

}

if case let .wwwUrl(path) = wwwApple {
    print(path)
}

let withoutYou = Shortcut.song(
    artist: "Symphony X",
    songName: "Without You"
)

if case let .song(artist, songName) = withoutYou {
    print(artist)
    print(songName)
}

// In case we don't need the artist variable you can simply put an _ instead of it
if case let .song(_, songName) = withoutYou {
    print(songName)
}

enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)

    var manufacturer: String {
    switch self {
        case let .car(manufacturer, _),
        let .bike(manufacturer,_):
        return manufacturer
    }
}
}




let car = Vehicle.car(manufacturer: "Tesla",
model: "X")

print(car.manufacturer)

switch car {
    case let .car(manufacturer, _):
    print(manufacturer)
    break
    case let .bike(manufacturer, _):
    print(manufacturer)
    break
}

let bike = Vehicle.bike(manufacturer: "HD",yearMade: 1987)

print(bike.manufacturer)

switch bike {
    case let .car(manufacturer, _):
    print(manufacturer)
    break
    case let .bike(manufacturer, _):
    print(manufacturer)
    break
}

enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

print(FamilyMember.father.rawValue)
print(FamilyMember.brother.rawValue)

enum FavoriteEmoji: String, CaseIterable {
    case blush = "BLUSH"
    case rocket = "ROCKET"
    case fire = "FIRE"
}

print(FavoriteEmoji.allCases)
print(FavoriteEmoji.allCases.map(\.rawValue))

if let blush = FavoriteEmoji(rawValue: "BLUSH") {
    print("Found the blush emoji")
    print(blush)
} else {
    print("This emoji doesn't exist")
}

if let snow = FavoriteEmoji(rawValue: "SNOW") {
    print("Snow exists?! Really?")
    print(snow)
} else {
    print("This emoji doesn't exist")
}

enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong()
print(myHeight)

indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperation)

    func calculateResult(
        of operation: IntOperation? = nil
    ) -> Int {
        switch operation ?? self {
            case let .add(lhs,rhs):
            return lhs + rhs
            case let .subtract(lhs,rhs):
            return lhs-rhs
            case let .freeHand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freeHand(.add(2,4))
// Calling the function is important here because if you simply print freeHand you will only get the enum back
print(freeHand.calculateResult())



let c = readLine()


