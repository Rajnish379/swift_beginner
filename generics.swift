import Foundation

let x = 10
let y = 20
let z = x + y



func perform<N: Numeric>(
    _ op: (N, N) -> N,
    on lhs: N,
    and rhs: N
) -> N  {
    op(lhs,rhs)
}

let xt = perform(+, on: 10.1, and: 20.2)
print(xt)

// Here the perform is inferring the type of the result to be an int based on the input arguments, thanks to generics
print(perform(+, on: 10, and: 20))
print(perform(-, on: 10, and: 20))
print(perform(*, on: 10, and: 20))
print(perform(/, on: 20, and: 10))

func perform2<N>(
    _ op: (N, N) -> N,
    on lhs: N,
    and rhs: N
) -> N where N: Numeric {
    op(lhs,rhs)
}

// Here the perform is inferring the type of the result to be an int based on the input arguments, thanks to generics
print(perform2(+, on: 10, and: 20))
print(perform2(-, on: 10, and: 20))
print(perform2(*, on: 10, and: 20))
print(perform2(/, on: 20, and: 10))

protocol CanJump {
    func jump()
}

protocol CanRun {
    func run()
}

struct Person: CanJump, CanRun {
    func jump() {
        print("Jumping...")
    }
    func run() {
        print("Running...")
    }
}

func jumpAndRun<T: CanJump & CanRun>(_ value: T){
    value.jump()
    value.run()
}

let person = Person()
jumpAndRun(person)

extension [String] {
    func longestString() -> String? {
        self.sorted{(lhs: String, rhs: String) -> Bool in
        lhs.count > rhs.count 
        }.first
    }
}

print(["Foo","Bar Baz","Qux"].longestString()!)

protocol View {
    func addSubView(_ view: View)
}

extension View {
    func addSubView(_ view: View){
        // empty
    }
}

struct Button: View {
    // empty
}

struct Table: View{
    //empty
}


protocol PresentableAsView {
    associatedtype ViewType: View
    func produceView() -> ViewType
    func configure(
        superView: View,
        thisView: ViewType
    )
    func present(
        view: ViewType,
        on superView: View
    )
}

extension PresentableAsView {
    func configure(
        superView: View,
        thisView: ViewType
    ) {
        // empty by default
    }
    func present(
        view: ViewType,
        on superView: View
    ) {
        superView.addSubView(view)
    }
}

struct MyButton: PresentableAsView {
    func produceView() -> Button {
       return Button()
    }

    func configure(
        superView: View,
        thisView: Button
    ) {

    }
}

// Only the objects who conform to the PresentableAsView protocol and who has the ViewType as Button only will get access to the functions defined in the extension
extension PresentableAsView where ViewType == Button {
    func doSomethingWithButton() {
        print("This is a button")
    }
    
}

let button = MyButton()
button.doSomethingWithButton()

extension [Int] {
    func average() -> Double {
        // Here in reduce, 0 is the seed value and it keeps on applying the + operation on a list starting with zero until only one integer is left which is the sum of all the integers in the list
        return Double(self.reduce(0, +)) / Double(self.count)
    }
}

print([1,2,3,4].average())



let c = readLine() 