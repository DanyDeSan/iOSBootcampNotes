import UIKit

// Protocols

// Reference
// https://docs.swift.org/swift-book/LanguageGuide/Protocols.html

// Here we declare a protocol
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


// Challenges

