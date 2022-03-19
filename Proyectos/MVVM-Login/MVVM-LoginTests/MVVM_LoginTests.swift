//
//  MVVM_LoginTests.swift
//  MVVM-LoginTests
//
//  Created by L Daniel De San Pedro on 17/03/22.
//

import XCTest

class MVVM_LoginTests: XCTestCase {

    override func setUpWithError() throws {
        // Esta funcion siempre se va a llamar antes de cada test case que se va a evaluar
        print("setting up")
        
        // Preparar el cacho de modulo que vamos probar
        // Inicializamos dependencias y las inyectamos al SUT
    }
        
    override func tearDownWithError() throws {
        // Esta funcion siempre se va a llamar despues de cada test case que se evalue
        print("tear down")
        
        // Destruir las dependencias previamente creadas
    }
    
    /*
     Orden de invocacion
     
     -> setUpWithError()
     -> testExample()
     -> tearDownWithError()
     -> setUptWithError()
     -> testPerformanceExample()
     -> teardownWithError()
     
     */

    func testExample() throws {
        print("test example")
        let a: Int = 1
        let c: Int = 1
        let b: Int = 4
        
        XCTAssert(c == a, "C is not equal to A")
        // Evaluamos si una varialble es nil
        var optional: Int?
        XCTAssertNil(optional)
        // Evaluamos una expression booleana o una variable bool
        var booleanValue: Bool = true
        XCTAssertTrue(booleanValue)
        booleanValue = false
        XCTAssertFalse(booleanValue)
        // Dos objetos sean iguales
        XCTAssertEqual(a, c)
        // Comprobamos si una variable es mas pequena que otra
        XCTAssertLessThan(a, b)
        // Comprobamos que una opcional no sea nil
        optional = 1
        XCTAssertNotNil(optional)
    }
    
    func testWithGivenWhenThen() {
        // Given
        // Aqui establecemos el escenario inicial
        
        // When
        // Aqui ejectucamos lo que queremos probar
        
        // Then
        // Aqui comprobamos los resultados
    }

    func testPerformanceExample() throws {
        print("test performance example")
    }

}
