import UIKit


//
// Reference https://medium.com/@who_am_i/builder-design-pattern-in-ios-d528c7614eac

enum Meat {
    case beef
    case chicken
    case tofu
}

enum Sauces {
    case mayonaisse
    case mustard
    case ketchup
    case barbeque
}


enum Topping {
    case cheese
    case onion
    case lettuce
    case pickles
    case tomatoes
}

struct Hamburguer {
    let topping: [Topping]
    let sauce: [Sauces]
    let meat: Meat
}


class HamburguerBuilder {
    
    var meat: Meat = .beef
    var sauce: [Sauces] = [Sauces]()
    var topping: [Topping] = [Topping]()
    
    
    func addSauces(_ sauces: Sauces) {
        self.sauce.append(sauces)
    }
    
    func removeLastSauce() {
        self.sauce.removeLast()
    }
    
    func addTopping(_ topping: Topping) {
        self.topping.append(topping)
    }
    
    func removeLastTopping() {
        self.topping.removeLast()
    }
    
    func setMeat(_ meat: Meat) {
        self.meat = meat
    }
    
    func build() -> Hamburguer {
        return Hamburguer(topping: topping,
                          sauce: sauce,
                          meat: meat)
    }
}

class BurguerShop {
    func createCheeseBurguer(with builder: HamburguerBuilder) -> Hamburguer {
        builder.setMeat(.beef)
        builder.addTopping(.cheese)
        builder.addTopping(.onion)
        builder.addTopping(.lettuce)
        builder.addTopping(.tomatoes)
        builder.addSauces(.mustard)
        builder.addSauces(.ketchup)
        return builder.build()
    }
    
    func createVegetarianBurguer(with builder: HamburguerBuilder) -> Hamburguer {
        builder.setMeat(.tofu)
        builder.addTopping(.cheese)
        builder.addTopping(.lettuce)
        builder.addTopping(.pickles)
        builder.addSauces(.mayonaisse)
        builder.addSauces(.barbeque)
        return builder.build()
    }
}

var carlsJunior: BurguerShop = BurguerShop()
var burguerBuilder: HamburguerBuilder = HamburguerBuilder()
var burguer: Hamburguer = carlsJunior.createCheeseBurguer(with: burguerBuilder)


// Lets use protocols


protocol AbstractHamburguerBuilderProtocol {
    func addSauces(_ sauce: Sauces) -> Self
    func removeLastSauce()
    func addTopping(_ topping: Topping) -> Self
    func removeLastTopping()
    func setMeat(_ meat: Meat) -> Self
    func build() -> Hamburguer
}

class SwiftyHamburguerBuilder: AbstractHamburguerBuilderProtocol {
    
    var sauces: [Sauces] = [Sauces]()
    var toppings: [Topping] = [Topping]()
    var meat: Meat = .beef
    
    
    func addSauces(_ sauce: Sauces) -> Self {
        sauces.append(sauce)
        return self
    }
    
    func removeLastSauce() {
        sauces.removeLast()
    }
    
    func addTopping(_ topping: Topping) -> Self {
        toppings.append(topping)
        return self
    }
    
    func removeLastTopping() {
        toppings.removeLast()
    }
    
    func setMeat(_ meat: Meat) -> Self {
        self.meat = meat
        return self
    }
    
    func build() -> Hamburguer {
        return Hamburguer(topping: toppings, sauce: sauces, meat: meat)
    }
    
}

class BurguerShopAlternate {
    
    func createCheeseBurguer(with burguerBuilder: AbstractHamburguerBuilderProtocol) -> Hamburguer {
        burguerBuilder.addSauces(.barbeque)
            .addSauces(.ketchup)
            .addSauces(.mustard)
            .addTopping(.lettuce)
            .addTopping(.onion)
            .addTopping(.pickles)
            .build()
    }
}

