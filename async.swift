import Foundation
import _Concurrency



func calculateFullName (
    firstName: String,
    lastName: String
) async -> String {
     try? await Task.sleep(for: .seconds(3))
    return "\(firstName) \(lastName)"
}

Task {
    let result1 = await calculateFullName(
        firstName: "Foo",
        lastName: "Bar"
    )
    print(result1)
}
let c = readLine()


    // let result1 = await calculateFullName(
    //     firstName: "Foo",
    //     lastName: "Bar"
    // )
    // while true{
    //     print("Raj")
    // }



