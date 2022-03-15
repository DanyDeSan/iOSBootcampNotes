import UIKit

// An abstraction of the component that we are going to decorate
protocol Component {
    func operation() -> String
}

// The concretation of the component that we are going to decorate
class ConcreteComponent: Component {
    
    func operation() -> String {
        return "Concrete Component"
    }
}

// The base definition of the decorator
// This decorator conforms the Component protocol
// so we can use it as Component
// But also it wrapps the functionality of the Concrete Component
// The base decorator is only meant to wrapp the concrete component
// without adding functionalitys
class BaseDecorator: Component {
    private var component: Component
    
    init(_ component: Component) {
        self.component = component
    }
    
    func operation() -> String {
        return component.operation()
    }
}


// This concrete decorator inherits from the base decorator
// this adds the new capabilities and also can have its own behaviours
class ConcreteDecoratorA: BaseDecorator {
    override func operation() -> String {
        return "Concrete decorator A \(super.operation())"
    }
}

class ConcreteDecoratorB: BaseDecorator {
    override func operation() -> String {
        return "Concrete decorator B \(super.operation())"
    }
}

let component: ConcreteComponent = ConcreteComponent()

let decoratorA: ConcreteDecoratorA = ConcreteDecoratorA(component)
let decoratorB: ConcreteDecoratorB = ConcreteDecoratorB(component)

decoratorA.operation()
decoratorB.operation()
