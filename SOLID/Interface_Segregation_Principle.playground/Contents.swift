import UIKit

//Interface segregation principle o Principio de segregación de la interfaz
//El Principio de segregación de la interfaz indica que es mejor tener diferentes interfaces (protocolos) que sean específicos para cada cliente, que tener un interfaz general. Además, indica que un cliente no tendría que implementar métodos que no utilice.
//
//Por ejemplo, podemos crear una interfaz para animales que incluya métodos de desplazamiento:
//

protocol AnimalProtocol {
    func walk()
    func swimm()
    func fly()
}

struct Wale: AnimalProtocol{
    func walk() {
        
    }
    
    func swimm() {
        <#code#>
    }
    
    func fly() {
        <#code#>
    }
    
}

protocol WalkProtocol {
    func walk()
}
protocol SwimmProtocol {
    func swimm()
}
protocol FlyProtocol {
    func fly()
}

struct NewWale: SwimmProtocol{
    func swimm() {
        print("i swimm in the sea")
    }
}

struct Cocodrile: SwimmProtocol, WalkProtocol{
    func swimm() {
        print("i swimm ")
    }
        
    func walk() {
        print("i walk too")
    }
    
    
}

struct Pelican: WalkProtocol, SwimmProtocol, FlyProtocol {
    func walk() {
        print("i walk")
    }
    
    func swimm() {
        print("i swimm")
    }
    
    func fly() {
        print("i fly too")
    }
    
    
}

var pelican = Pelican()
pelican.walk()
pelican.swimm()
pelican.fly()
