import UIKit

// Reference
// https://docs.swift.org/swift-book/LanguageGuide/Extensions.html


// Extensions allow us to extend the capabilities of Enums, Structs and classes.

struct BankTransaction {
    var date: Date
    var amount: Double
    var reference: Int
    var destinyAccount: Int
    static var USDValue: Double = 20
}

BankTransaction.USDValue

// Here we extend bank transaction struct
extension BankTransaction {
    // On extension we CAN NOT add new variables
    // but we can add COMPUTED VARIABLES
    var dateFormatted: String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "dd-MM-YYYY"
        return formatter.string(from: date)
    }
    var usdAmount: Double {
        return amount / 20
    }
    
    // On extension we can add more functions
    mutating func update(reference: Int) {
        self.reference = reference
    }
}

var transaction1: BankTransaction = BankTransaction(date: Date(), amount: 100, reference: 12341, destinyAccount: 942003294093)

print(transaction1.dateFormatted)
print(transaction1.usdAmount)
transaction1.update(reference: 22222)
print(transaction1.reference)

// We can apply extensions to enumerations too
enum PaymentEndpoint: String {
    case perform = "/perform"
    case cancel = "/cancel"
    case payments = "/payments"
}

extension PaymentEndpoint {
    // We can also declare a nested typ on extensions
    enum RequestType: String {
        case post
        case get
    }
    // On this extension we are adding a static func, which can
    // be called without an instance
    static func valueFor(endpoint: PaymentEndpoint) -> String {
        return endpoint.rawValue
    }

    // Here we add function that obtains the request type
    func getTypeOfRequest() -> RequestType {
        switch self {
        case .cancel: return .post
        case .perform: return .post
        case .payments: return .post
        }
    }
    
}

PaymentEndpoint.valueFor(endpoint: .cancel)



class BaseClass {
    var attribute: Int?
    var seconAttribute: Int?
}

extension BaseClass {
    func doSomethingMore() {
        print("Doing Something more")
    }
}

// The very true power of extensions are that we can
// extend evry type that we did not define.

extension Int {
    // Wait, Int is in reality a struct?😯
    mutating func squareValue() {
        self = self * self
    }
}

extension Double {
    func currencyFormat() -> String {
        return "$\(self)"
    }
}

var amount: Double = 20
print(amount.currencyFormat())

extension Date {
    func formatted() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        return dateFormatter.string(from: self)
    }
}

extension UIView {
    func applyStyle() {
        self.backgroundColor = .red
    }
}

//Testing the extensions

var aValue: Int = 2
aValue.squareValue()
var ammount: String = 200.00.currencyFormat()
var currentDate: String = Date().formatted()


// But also the true powers of extensions comes along with protocols....



// Hacer qu un valor Double nos regrese su valor pero en cadena.

extension Double {
    var stringValue: String {
        return "\(self)"
    }
}

var aDouble: Double = 1.0
print(aDouble.stringValue)

// Que UIColor tenga predefinido un set de colores

extension UIColor {
    
    static var cyan: UIColor {
        return UIColor(red: 0, green: 1, blue: 1, alpha: 1.0)
    }
    
    static var crimson: UIColor {
        return UIColor(red: 220/225, green: 20/255, blue: 60/255, alpha: 1)
    }
}

var cyan: UIColor = UIColor.cyan
var crimson: UIColor = UIColor.crimson

// Averiguar si una cadena es numérico o alfanumérico.

extension String {
    func isNumeric() -> Bool {
        guard let _: Int = Int(self) else { return false }
        return true
    }
    
    func numericValue() -> Int {
        return Int(self) ?? 0
    }
    
}

var myAge: String = "26"
var anotherString: String = "12a"
print(myAge.isNumeric())
print(myAge.numericValue())
print(anotherString.isNumeric())

"""
    Daphne - > Luis Jorge
    Luis -> Mario
    Saul -> Juan de Dios
    Itzel -> Gis
    Adry -> Jesus
    Ham -> John
    Marco -> Nery
"""
