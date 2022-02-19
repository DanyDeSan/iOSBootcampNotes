import UIKit

// Principio de Substitución de Liskov – SOLID

// Principio Liskov bien aplicado por addSubview metodo
//func setupUI() {
//    let emailLabel = UILabel()
//    view.addSubview(emailLabel)
//
//    let emailTextField = UITextField()
//    view.addSubview(emailTextField)
//
//


// Principio Liskov mal aplicado/ rompe con el principio
import UIKit
//Ejemplo de como se rompe el principio
class Bird {
    var currentAltitude = 0
    
    func fly() {
        currentAltitude = Int.random(in: 1...300)
    }
}
class Pigeon: Bird {
    override func fly() {
        // Las palomas vuelan a menos altura
        currentAltitude = Int.random(in: 1...100)
    }
}

// Los cuervos no necesitan sobreescribir nada de su superclase
class Raven: Bird { }
// Los Swifts no necesitan sobreescribir nada de su superclase
class Swift: Bird { }

//Estamos sobre escribiendo la Clase lo cual esta mal ya que si queremos implementar canvas
class Chicken: Bird {
    
    override func fly() {
        fatalError("Chickens can NOT fly. Do not use this method.")
    }
}

