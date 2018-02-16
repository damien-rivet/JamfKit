//: [Previous](@previous)

//: # JamfKit - Requests

//: 1. Import JamfKit

import JamfKit

//: 2. Configure the global instance of the `SessionManager`

try SessionManager.instance.configure(for: "http://localhost", username: "john", password: "appleseed")

//: 3. Use any instanciated model that is conforming to `Requestable`

let building = Building(json: ["id": UInt(12345), "name": "test"])!



//: 4. Generate any request directly from the global instance of the `SessionManager`

let request = SessionManager.instance.request(for: building, method: .delete)

//: #### Output

print(request?.httpMethod)
print(request?.url)
print(request?.allHTTPHeaderFields)

//: [Next](@next)
