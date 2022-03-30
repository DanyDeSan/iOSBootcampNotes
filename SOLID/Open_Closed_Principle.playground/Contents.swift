import UIKit

protocol Beverage {
    func cost() -> Int
}

class Expresso: Beverage {
    func cost() -> Int {
        return 2
    }
}

protocol CondimentDecorator: Beverage {
    var beverage: Beverage { get set }
    
}
class Milk: CondimentDecorator {
    func cost() -> Int {
        return 2
    }
    
    var beverage: Beverage
    init(beverage: Beverage) { self.beverage = beverage }
}
class Mocha: CondimentDecorator {
    func cost() -> Int {
        return 3 + beverage.cost()
    }
    
    var beverage: Beverage
    init(beverage: Beverage) { self.beverage = beverage }
        
}
class Soy: CondimentDecorator {
    func cost() -> Int {
        return 4 + beverage.cost()
    }
    
     var beverage: Beverage
     init(beverage: Beverage) { self.beverage = beverage }
}

var expresso: Beverage = Expresso()
expresso = Mocha(beverage: expresso)
expresso = Soy(beverage: expresso)

print(expresso.cost())


