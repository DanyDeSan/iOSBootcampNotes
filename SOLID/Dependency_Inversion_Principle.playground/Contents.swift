import UIKit

// Dependency Inversion Example

"""

    You should depend on abstractions, not concretions.

"""

// The abstraction
protocol Computer {
    var brand: String { get set }
    
    func turnOn()
    func turnOff()
}

// The concretion
class MacBookPro: Computer {
    var brand: String
    init(brand: String) {
        self.brand = brand
    }
    
    func turnOn() {
        print("Turning on with sound 🎶")
    }
    
    func turnOff() {
        print("Turning off")
    }
}


final class Developer {
    
    private var computer: Computer // Instead of using MacbookPro we are using Computer, the abstraction.
    
    init(computer: Computer) {
        self.computer = computer
    }
    
    func startToWork() {
        computer.turnOn()
        openXcode()
    }
    
    private func openXcode() {
        print("Opening xcode")
    }
    
    func callItADay() {
        computer.turnOff()
    }
}

var dany: Developer = Developer(computer: MacBookPro(brand: "Apple"))
dany.startToWork()
dany.callItADay()
