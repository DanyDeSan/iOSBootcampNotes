import UIKit

//Single-responsibility Principle (SRP) states:

class Handler {

    let apiHandler: APIHandler
    let parseHandler: ParseHandler
    let dbHandler: DBHandler

    init(apiHandler: APIHandler, parseHandler: ParseHandler, dbHandler: DBHandler) {
        self.apiHandler = apiHandler
        self.parseHandler = parseHandler
        self.dbHandler = dbHandler
    }

    func handle() {
        let data = apiHandler.requestDataToAPI()
        let array = parseHandler.parse(data: data)
        dbHandler.saveToDB(array: array)
    }
}



//A class should have one and only one reason to change, meaning that a class should have only one job.


class APIHandler {

    func requestDataToAPI() -> Data {
        // send API request and wait the response
    }
}

class ParseHandler {

    func parse(data: Data) -> [String] {
        // parse the data and create the array
    }
}

class DBHandler {

    func saveToDB(array: [String]) {
        // save the array in a database (CoreData/Realm/...)
    }
}
