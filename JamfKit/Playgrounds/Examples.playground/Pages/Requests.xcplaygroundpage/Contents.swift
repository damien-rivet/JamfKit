//: [Previous](@previous)

//: # JamfKit - Requests

//: 1. Import JamfKit

import JamfKit

//: 2. Configure the global instance of the `SessionManager`

try SessionManager.instance.configure(for: "http://localhost/jss", username: "john", password: "appleseed")

//: 3. Use any instanciated model that is conforming to `Requestable`

let building = Building(json: ["id": UInt(12345), "name": "Some building"])!

//: 4. Generate any request directly from the JSS class / object

let readAllRequest = Building.readAllRequest()
let createRequest = building.createRequest()
let readStaticRequest = Building.readRequest(identifier: "12345")
let readRequest = building.readRequest()
let updateRequest = building.updateRequest()
let deleteStaticRequest = Building.deleteRequest(identifier: "12345")
let deleteRequest = building.deleteRequest()
let deleteRequestWithName = building.deleteRequestWithName()

//: #### Output

print("\n##### CREATE")
print(createRequest?.httpMethod)
print(createRequest?.url)
print(createRequest?.allHTTPHeaderFields)
print(createRequest?.httpBody)
print("\n##### READ ALL")
print(readAllRequest?.httpMethod)
print(readAllRequest?.url)
print(readAllRequest?.allHTTPHeaderFields)
print("\n##### READ STATIC")
print(readStaticRequest?.httpMethod)
print(readStaticRequest?.url)
print(readStaticRequest?.allHTTPHeaderFields)
print("\n##### READ")
print(readRequest?.httpMethod)
print(readRequest?.url)
print(readRequest?.allHTTPHeaderFields)
print("\n##### UPDATE")
print(updateRequest?.httpMethod)
print(updateRequest?.url)
print(updateRequest?.allHTTPHeaderFields)
print(updateRequest?.httpBody)
print("\n##### DELETE STATIC")
print(deleteStaticRequest?.httpMethod)
print(deleteStaticRequest?.url)
print(deleteStaticRequest?.allHTTPHeaderFields)
print("\n##### DELETE")
print(deleteRequest?.httpMethod)
print(deleteRequest?.url)
print(deleteRequest?.allHTTPHeaderFields)
print("\n##### DELETE WITH NAME")
print(deleteRequestWithName?.httpMethod)
print(deleteRequestWithName?.url)
print(deleteRequestWithName?.allHTTPHeaderFields)

//: [Next](@next)
