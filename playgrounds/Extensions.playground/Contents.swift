import UIKit

// Reference
// https://docs.swift.org/swift-book/LanguageGuide/Extensions.html


// Extensions allow us to extend the capabilities of Enums, Structs and classes.

struct BankTransaction {
    var date: Date
    var amount: Double
    var reference: Int
    var destinyAccount: Int
}

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


