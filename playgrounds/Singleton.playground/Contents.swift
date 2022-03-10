import UIKit

// Singleton

// Reference https://refactoring.guru/es/design-patterns/singleton/swift/example

class ASingleton {
    
    // The init must be private so there is only one way to create it
    private init() {}
    
    // The shared instance of the class which acts as the singleton
    static var sharedInstance: ASingleton = ASingleton()
    
    // A simple function that does something
    func doStuff() {
        print("Do some stuff")
    }
}

ASingleton.sharedInstance.doStuff()

// We cannot create another instance
// let aSingleton = ASingleton()

// We can only use the sharedInstance

// Singletons are very used in iOS
UserDefaults.standard
FileManager.default
URLSession.shared
OperationQueue.main

class MessageRecorder {
    
    private var message: String = ""
    
    private init() {}
    
    static var sharedInstance: MessageRecorder = MessageRecorder()
    
    func getMessage() -> String {
        return message
    }
    
    func setMessage(message: String) {
        self.message = message
    }
}

class Client {
    var clientMessage: String
    private var messageRecorder: MessageRecorder = MessageRecorder.sharedInstance
    
    init(clientMessage: String) {
        self.clientMessage = clientMessage
    }
    
    func recordMessage() {
        messageRecorder.setMessage(message: clientMessage)
    }
}

let clientA = Client(clientMessage: "A")
let clientB = Client(clientMessage: "B")
let clientC = Client(clientMessage: "C")

clientA.recordMessage()
clientB.recordMessage()
clientB.recordMessage()
clientA.recordMessage()

print(MessageRecorder.sharedInstance.getMessage())


let clients = [clientA,clientB,clientC]


// A little experiment
clients.randomElement()?.recordMessage()
clients.randomElement()?.recordMessage()
clients.randomElement()?.recordMessage()


print(MessageRecorder.sharedInstance.getMessage())
