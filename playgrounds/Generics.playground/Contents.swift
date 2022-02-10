import UIKit

// An abstracion of product
protocol Product: CustomStringConvertible, CustomDebugStringConvertible {
    var priceMXN: Double { get }
}

// An abstraction of an iPhone
struct iPhone: Product {
    var description: String = "iPhone"
    var debugDescription: String = "iPhone"
    var priceMXN: Double = 30_000.00
}

// A class specific of an iPhone Seller
class iPhoneSeller {
    var iphoneStock: [iPhone]
    init(stock: [iPhone]) {
        self.iphoneStock = stock
    }
    func sell() -> iPhone {
        return iphoneStock.removeFirst()
    }
    func buy(iphone: iPhone) {
        print("Bought \(iphone)")
        iphoneStock.append(iphone)
    }
}

var iPhoneStock : [iPhone] = [iPhone(),iPhone(),iPhone()]
var iphoneSeller: iPhoneSeller = iPhoneSeller(stock: iPhoneStock)

print(iphoneSeller.sell())
iphoneSeller.buy(iphone: iPhone())


// If we create a new product, we should create its seller
struct XboxSeriesX: Product {
    var description: String = "XboxSeriesX"
    var debugDescription: String = "XboxSeriesX"
    var priceMXN: Double = 15_000.00
}

class XboxSeller {
    var xboxStock: [XboxSeriesX]
    
    init(xboxStock: [XboxSeriesX]) {
        self.xboxStock = xboxStock
    }
    
    func sell() -> XboxSeriesX {
        return xboxStock.removeFirst()
    }
    
    func buy(xbox: XboxSeriesX) {
        xboxStock.append(xbox)
    }
}

struct Playstation5: Product {
    var description: String = "Playstation 5"
    
    var debugDescription: String = "Playstation 5"
    var priceMXN: Double = 15_000.00
}

class PlaystationSeller {
    var playstationStock: [Playstation5]
    
    init(playstationStock: [Playstation5]) {
        self.playstationStock = playstationStock
    }
    
    func sell() -> Playstation5{
        return self.playstationStock.removeFirst()
    }
    
    func buy(playstation: Playstation5) {
        self.playstationStock.append(playstation)
    }
}

// But we can create a generic seller which can handle
// every type of product
class Seller<P> {
    var productInventary: [P]
    
    init(products: [P]) {
        self.productInventary = products
    }
    
    func sell() -> P {
        let productToBeSelled: P = productInventary.removeFirst()
        print("Selling an \(productToBeSelled)")
        return productToBeSelled
    }
    
    func buy(product: P) {
        print("Bought \(product)")
        productInventary.append(product)
    }
}

var iphones: [iPhone] = [iPhone](repeating: iPhone(), count: 4)
// Is equivalent to declare
// var iphones: [iPhone] = [iPhone(), iPhone(), iPhone(), iPhone()]
var xboxs: [XboxSeriesX] = [XboxSeriesX](repeating: XboxSeriesX(), count: 4)
var playstations: [Playstation5] = [Playstation5](repeating: Playstation5(), count: 4)


// We use the same class seller, to create a seller for every type of product.
var genericIPhoneSeller: Seller = Seller(products: iphones)
print(genericIPhoneSeller.sell())
genericIPhoneSeller.buy(product: iPhone())

var xboxSeller: Seller = Seller(products: xboxs)

var playstationSeller: Seller<Playstation5> = Seller<Playstation5>(products: playstations)


// But we can apply restrictions to the generics

// Given the following protocol

protocol Console {}

// Extending the previous classes

extension XboxSeriesX: Console {}
extension Playstation5: Console {}

// Creating new Consoles
struct NintendoSwitch: Product, Console {
    var description: String = "Nintendo Switch"
    var debugDescription: String = "Nintendo Switch"
    
    var priceMXN: Double = 8_000.00
}

// Now we are going to create a generic seller, which only
// sells and buys Consoles
class ConsoleSeller<P:Console> {
    var stock: [P]
    init(stock: [P]) {
        self.stock = stock
    }
    
    func sell() -> P {
        return stock.removeFirst()
    }
    
    func buy(newConsole: P) {
        stock.append(newConsole)
    }
}

var genericXboxConsoleSeller: ConsoleSeller = ConsoleSeller(stock: xboxs)

var switchStock: [NintendoSwitch] = [NintendoSwitch](repeating: NintendoSwitch(), count: 4)
var genericNintendoSwitchSeller: ConsoleSeller = ConsoleSeller(stock: switchStock)

// But if we try to sell iPhones with the console seller
// var genericiPhoneConsoleSeller: ConsoleSeller = ConsoleSeller(stock: iPhoneStock)


// We can create also generic functions

func checkPrice<P:Product>(of product: P) -> String {
    return "\(product.priceMXN)"
}
checkPrice(of: iPhone())
checkPrice(of: XboxSeriesX())


// Arrays for example are generics
// We are going to create our own Stack of products

struct ProductStack<P>{
    var items: [P] = [P]()
    mutating func pop() -> P {
        return items.removeLast()
    }
    
    mutating func push(_ item: P) {
        items.append(item)
    }
}

var iphoneStack: ProductStack<iPhone> = ProductStack<iPhone>()
iphoneStack.push(iPhone())
let iphone = iphoneStack.pop()




//Challenges

// 1. Crear un seller parecido al console seller, pero que solo maneje teléfonos celulares y otro que solo maneje computadoras.

// 2. Crear una 'cola' o 'queue' por medio de genericos.
// Referencia de las queue https://www.tutorialspoint.com/data_structures_algorithms/dsa_queue.htm
//



protocol CellPhone {}

protocol Computer {}

extension iPhone: CellPhone{}

struct GooglePixel: Product, CellPhone {
    
    var description: String = "Google Pixel"
    var debugDescription: String = "Google Pixel"
    
    var priceMXN: Double = 25_000
}


struct MacbookPro: Product, Computer {
    var description: String = "MacBook Pro"
    var debugDescription: String = "MacBook Pro"
    var priceMXN: Double = 35_000
}

struct PCGamer: Product, Computer {
    var description: String = "PC Gamer"
    var debugDescription: String = "PC Gamer"
    
    var priceMXN: Double = 40_000
}

class CellPhoneSeller <C: CellPhone> {
    var cellphoneStock: [C]
    
    init(stock: [C]) {
        self.cellphoneStock = stock
    }
    
    func buy(cellphone: C) {
        cellphoneStock.append(cellphone)
    }
    
    func sell() -> C {
        return cellphoneStock.removeLast()
    }
}


class ProductQueue <P: Product> {
    var queue: [P] = [P]()
    
    func enqueue(product: P) {
        queue.append(product)
    }
    
    func dequeue() -> P {
        return queue.removeFirst()
    }
    
    func peek() -> P? {
        return queue.first
    }
}

var iphoneQueue: ProductQueue<iPhone> = ProductQueue<iPhone>()

iphoneQueue.enqueue(product: iPhone())
