import UIKit

// Protocols

// Reference
// https://docs.swift.org/swift-book/LanguageGuide/Protocols.html

// Here wCe declare a protocol
protocol AProtocol {
    // 'get set' means that the variable should be gettable and settable. In short words, it must be a Variable
    var requiredVariable: Int { get set }
    // 'set' means that the variable should only be settable, in other words must be a constant
    var anotherRequiredVariable: Int { get }
    
    func aRequiredFunction()
    static func aStaticFuncRequired()
}

// Here we create a class that conforms to a protocol
class AClass: AProtocol {
    
    var requiredVariable: Int
    let anotherRequiredVariable: Int
    
    init(requiredVariable: Int, anotherRequiredVariable: Int) {
        self.requiredVariable = requiredVariable
        self.anotherRequiredVariable = anotherRequiredVariable
    }
    
    func aRequiredFunction() {
        print("This is a required function!")
    }
    // Remember that static funcs can only be used without an instance. Only by calling the class name.
    static func aStaticFuncRequired() {
        print("This is a requirede static func!")
    }
    
    func doOtherStuff() {
        print("Do other stuff")
    }
}


let classInstance: AClass = AClass(requiredVariable: 1, anotherRequiredVariable: 1)
classInstance.aRequiredFunction()
// Using the static func
AClass.aStaticFuncRequired()

// Is this instance declared the same as the previous?
let anotherClassInstance: AProtocol = AClass(requiredVariable: 1, anotherRequiredVariable: 1)

// Short answer no
classInstance.doOtherStuff()
// This line will not compile.
// anotherClassInstance.doOtherStuff()

/**
 The reason is that anotherClassInstance is declared as
 'AProtocol' type, so the reference only has access to the
 methods and attributes defined in the protocol, not the methods
 defined in AClass even if we used that initializer.
 */


// Lets see this example

protocol Developer {
    var name: String { get }
    var ocupation: String { get }
    
    func develop()
}

class iOSDeveloper: Developer {
    var name: String
    var ocupation: String
    
    init(name: String, ocupation: String) {
        self.name = name
        self.ocupation = ocupation
    }
    func develop() {
        openXcode()
        print("Im doing iOS development")
    }
    func openXcode() {
        print("Opeining Xcode")
    }
    func learnSwift() {
        print("Learn swift")
    }
}

class AndroidDeveloper: Developer {
    var name: String
    var ocupation: String
    
    init(name: String, ocupation: String) {
        self.name = name
        self.ocupation = ocupation
    }
    func develop() {
        openAndroid()
        print("Im doing Android development")
    }
    
    func openAndroid() {
        print("Opening Android Studio")
    }
    
    func learnKotlin() {
        print("Learning Kotlin")
    }
}

var developer1: iOSDeveloper = iOSDeveloper(name: "Dany", ocupation: "iOS Developer")
developer1.develop()
developer1.learnSwift()

var developer2: AndroidDeveloper = AndroidDeveloper(name: "Ulises", ocupation: "Android Developer")
developer2.develop()
developer2.learnKotlin()

class Employer {
    var developer: Developer?
    
    func putDeveloperToWork() {
        guard let developer = developer else {
            print("No developer around :(")
            return
        }
        developer.develop()
    }
    
}

var employer: Employer = Employer()
employer.developer = developer1
employer.putDeveloperToWork()

employer.developer = developer2
employer.putDeveloperToWork()


// Employer holds a variable of type 'Developer'
// It doesnt know wether developer is 'AndroidDeveloper' or 'iOSDeveloper'

// We can extend a protocol so we can add a default implementation

extension Developer {
    // A new func that is not defined on the original protocol
    func openTerminal() {
        print("Opeining Terminal")
    }
    // A default implementation of a method defined on the original protocol
    func develop() {
        print("Im just gonna open VSCode!")
    }
}

// Both use the same default implementation
developer1.openTerminal()
developer2.openTerminal()
// Both use their own implementation instead of the default.
developer1.develop()
developer2.develop()

class AnotherDeveloper: Developer {
    var name: String
    
    var ocupation: String
    
    init(name: String, ocupation: String) {
        self.name = name
        self.ocupation = ocupation
    }
}

let developer3: Developer = AnotherDeveloper(name: "Josue", ocupation: "Freelance")
// Here it uses the default implementation provided by the protocol extension.
developer3.develop()


// How can we make an existing type to conform a protocol?

//Having this protocol

protocol Printable {
    func printValue()
}

// We can use extensions!
extension Int: Printable {
    func printValue() {
        print(self)
    }
}

extension Double: Printable {
    func printValue() {
        print(self)
    }
}


//Let's test it

var integer: Int = 1
integer.printValue()
var double: Double = 2.0
double.printValue()

/*
 We have already used protocols!
 
 UITableViewDelegate and UITableViewDataSource are both protocols!
 
 The first one defines the methods necessary to handle table
 view events
 
 The second defines the methods necessary to obtain the data to
 feed the table view.
 
 But, what is a Delegate?
 
 */

protocol Delegate {
    func didRegisterSomething(message: String)
    func shouldDoSomething() -> Bool
}

class ClassA: Delegate {
    func didRegisterSomething(message: String) {
        print(message)
    }
    
    func shouldDoSomething() -> Bool {
        return false
    }
}

class ClassB {
    var delegate: Delegate?
    
    func anEventHappened() {
        delegate?.didRegisterSomething(message: "something happened")
    }
    
    func askDelegateToDoSomething() {
        print(delegate?.shouldDoSomething())
    }
}


var classA: ClassA = ClassA()

var classB: ClassB = ClassB()

classB.delegate = classA

classB.anEventHappened()
classB.askDelegateToDoSomething()

/**
 Class A is the delegate of Class B
 When anEventHappened is triggered on class B, it reports back
 to class A
 
 When askDelegateToDoSomething, class B 'asks' through 'shouldDoSomething()' to class A for an answer.
 */


/**
 Going back to table views...
 The table view constantly asks the view controller for the number of rows, the number of sections, and even asks the view controller to provide the cells.
 */

"""
    Important Protocols
    - Equatable -> Provides the use of '=='
    - Comparable -> Provides the use of ">"
    - Codable -> Encode and decode a custom type
    - CaseIterable -> Iterate over values, like arrays
    - Numeric -> Provides the properties of a numeric value, and the use of arithmetic operators.
    - Hashable -> Makes it suitable to store in a dictionary
    - Identifiable -> Provides a unique id for the given type
    - CustomStringConvertible -> Provides a string description of the type
"""





// Challenges
"""
    1. For the given struct, conform it to standard Equatable and Comparable protocol. So we can do the following

P

    struct Animal {
        enum Species {
            case dog, cat, parrot, lion
        }
        var specie: Species
        var name: String
    }

"""
struct Animal {
    enum Species {
        case dog, cat, parrot, lion
    }
    var specie: Species
    var name: String
    var age: Int
}

extension Animal: Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.specie == rhs.specie && lhs.name == rhs.name && lhs.age == rhs.age
    }
}

extension Animal: Comparable {
    static func >(lhs: Self, rhs: Self) -> Bool {
        return lhs.age > rhs.age
    }
    
    static func <(lhs: Self, rhs: Self) -> Bool {
        return lhs.age < rhs.age
    }
    
    static func >= (lhs: Self, rhs: Self) -> Bool {
        return lhs.age >= rhs.age
    }
    
    static func <= (lhs: Self, rhs: Self) -> Bool {
        return lhs.age <= rhs.age
    }
}



var animal1 = Animal(specie: .cat, name: "Luna",age: 1)
var animal2 = Animal(specie: .cat, name: "Luna",age: 1)
var animal3 = Animal(specie: .dog, name: "Maple",age: 2)

animal1 == animal2
animal2 == animal3
animal1 > animal2
animal1 < animal3

"""
    Following the previous example of the employer and the developer do the following
    
    - Extend the functions of the developer.
    - Create the roles of the UX/UI designer
    - Create the roles of the QA
    - Create the roles of the Product Owner
    - The employer should have a team with all of the roles mentioned
    - The employer should put everyone to work on a single function.

Hint:
    - The employer should only use the protocol types.
    - Every role should be described as a protocol
A Freee tip:
    - You could create a parent protocol "Employee", and the all of the 'role' protocols could inherit from it.
    
"""

class Employer2 {
    
    var employees: [Employee]
    
    init(employees: [Employee]) {
        self.employees = employees
    }
    
    func putEveryOneToWork() {
        for employee in employees {
            employee.startToWork()
        }
    }
}

protocol Employee {
    func startToWork()
}

enum ProgramingLanguage {
    case swift
    case kotlin
}

protocol DeveloperProtocol: Employee {
    var programmingLanguage: ProgramingLanguage { get }
    func develop()
}

enum DesigningProgram: String {
    case Photoshop
    case Ilustrator
    case Sketch
}

protocol DesignerProtocol: Employee {
    var preferedDesignPrograms: [DesigningProgram] { get set }
    func design()
}

protocol ProductOwnerProtocol: Employee {
    func evaluateRequirements()
}


struct iOSDeveloper2: DeveloperProtocol {
    
    let programmingLanguage: ProgramingLanguage = .swift
    
    func startToWork() {
        openXcode()
        develop()
    }
    
    func develop() {
        print("Developing iOS Apps")
    }
    
    func openXcode() {
        print("Open xcode")
    }
}

struct AndroidDeveloper2: DeveloperProtocol {
    let  programmingLanguage: ProgramingLanguage = .kotlin
    
    func startToWork() {
        openAndroidStudio()
        develop()
    }
    
    func develop() {
        print("Developing Android Apps")
    }
    
    func openAndroidStudio() {
        print("Opening Android studio")
    }
}


struct UXUIDesigner: DesignerProtocol {
    var preferedDesignPrograms: [DesigningProgram]
    
    init(preferedDesignPrograms: [DesigningProgram]) {
        self.preferedDesignPrograms = preferedDesignPrograms
    }
    func startToWork() {
        openPrograms()
        design()
    }
    
    func design() {
        print("Designing :)")
    }
    
    func openPrograms() {
        for program in preferedDesignPrograms {
            print("Opening \(program.rawValue)")
        }
    }
}

struct ProductOwner: ProductOwnerProtocol {
    
    func startToWork() {
        evaluateRequirements()
    }
    
    func evaluateRequirements() {
        print("Evaluating requirements")
    }
}


var androidDeveloper: AndroidDeveloper2 = AndroidDeveloper2()
var iOSDeveloper_: iOSDeveloper2 = iOSDeveloper2()
var designer: UXUIDesigner = UXUIDesigner(preferedDesignPrograms: [.Ilustrator,.Photoshop])
var productOwner: ProductOwner = ProductOwner()

var employer2: Employer2 = Employer2(employees: [androidDeveloper,iOSDeveloper_, designer,productOwner])

employer2.putEveryOneToWork()
