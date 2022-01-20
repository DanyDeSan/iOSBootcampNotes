import Foundation

// Optional declaration

var userAge: Int?
var userHeight: Double?
var userName: String?


// Diference between optional value and non optional value

// Declaration without value.
var optionalInteger: Int?
// Declaration with value asignated
var nonOptionalInteger: Int = 0


// Optional Unwrapping

var myName: String?
// Variable is currently nil
// Output will be: Nil
print(myName)
// Variable has a string
// But output will be: Optional("Daniel")
myName = "Daniel"
print(myName)

// If myName has a value, then that value is assigned to name, which is a non-optional value
// so we can use it as a normal string without worries.
if let name: String = myName {
    // Output will be "Daniel"
    print(name)
}


func evaluate(optional: String?) -> String {
    // Guard statements can only be used inside code blocks such as functions or closures.
    // The else block of the guard must always return or not falthroug
    guard let nonOptional: String = optional else { return "" }
    return nonOptional
}
var optionalA: String?
// Will print an empty string because optional is nil, so it will fall to the else block of the guard statement
print(evaluate(optional: optionalA))
optionalA = "A String"
// It will print "A String"
print(evaluate(optional: optionalA))

// Nil coalecing
var number: Int?
//Output will be 0
print(number ?? 0)
number = 1
//Output will be 1
print(number ?? 0)

//Optional Chaining

//Given the following structs

struct Address {
    var street: String
    var number: String
    var city: String
    var country: String
    var zipCode: Int
}

struct User {
    var name: String
    var age: String?
    var address: Address?
}

var danyAddress: Address = Address(street: "Calle",
                                   number: "11",
                                   city: "CDMX",
                                   country: "MEX",
                                   zipCode: 04977)
var dany: User = User(name: "Dany",
                      age: "26",
                      address: danyAddress)

// Output will be: Optional("Calle")
print(dany.address?.street)
if let street: String = dany.address?.street {
    //Output will be: "Calle"
    print(street)
}


// Implicity unwrapped optionals

var aSafeOptional: String?
// This wont compile :(
// var aCopyOfOptional: String = aSafeOptional


var implicityUnwrappedOptional: String!

implicityUnwrappedOptional = "Be safe!"
let anotherCopy: String = implicityUnwrappedOptional
// Force unwrapp
print(implicityUnwrappedOptional!)
// ! operator can also be used with normal optionals, but DONT USE IT


// Optional usage examples

// The Double's constructor that accepts a strings returns an optional Double
var doubleFromString: Double? = Double("1.0")

// When down casting some times it is required to use optional binding
class Parent {}
class Son: Parent {}

var parentObject: Parent = Son()
var maybeASon: Son? = parentObject as? Son
var forcedSon: Son = parentObject as! Son // Avoid using it!
