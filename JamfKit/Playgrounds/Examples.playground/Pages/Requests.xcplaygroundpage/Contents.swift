//: [Previous](@previous)

//: # JamfKit - Requests

//: 1. Import JamfKit

import JamfKit

//: 2. Configure the global instance of the `SessionManager`

try SessionManager.instance.configure(for: "http://localhost", username: "john", password: "appleseed")

//: 3. Use any instanciated model that is conforming to `Requestable`

let building = Building(json: ["id": UInt(12345), "name": "Building"])!

//: 4. Generate any request directly from the JSS object

let readAllRequest = Building.readAll()
let createRequest = building.create()
let readRequest = building.read()
let updateRequest = building.update()
let deleteRequest = building.delete()

//: #### Output

print("\n##### READ ALL")
print(readAllRequest?.httpMethod)
print(readAllRequest?.url)
print(readAllRequest?.allHTTPHeaderFields)
print("\n##### CREATE")
print(createRequest?.httpMethod)
print(createRequest?.url)
print(createRequest?.allHTTPHeaderFields)
print(createRequest?.httpBody)
print("\n##### READ")
print(readRequest?.httpMethod)
print(readRequest?.url)
print(readRequest?.allHTTPHeaderFields)
print("\n##### UPDATE")
print(updateRequest?.httpMethod)
print(updateRequest?.url)
print(updateRequest?.allHTTPHeaderFields)
print(updateRequest?.httpBody)
print("\n##### DELETE")
print(deleteRequest?.httpMethod)
print(deleteRequest?.url)
print(deleteRequest?.allHTTPHeaderFields)

//: [Next](@next)
