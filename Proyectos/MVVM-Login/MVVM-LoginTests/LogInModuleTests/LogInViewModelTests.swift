//
//  LogInViewModelTests.swift
//  MVVM-LoginTests
//
//  Created by L Daniel De San Pedro on 17/03/22.
//

import XCTest
@testable import MVVM_Login

class LogInViewModelTests: XCTestCase {

    // System under test
    var sut: LoginViewModelProtocol?
    // Spy objects
    var apiDataManagerSpy: LoginModuleAPIDataManagerSpy?
    var localDataManagerSpy: LoginModuleLocalDataManagerSpy?
    var viewControllerSpy: LoginViewControllerSpy?
    
    // Esta funcion siempre se llama antes de cada test
    override func setUpWithError() throws {
        // Creamos los spys
        apiDataManagerSpy = LoginModuleAPIDataManagerSpy()
        localDataManagerSpy = LoginModuleLocalDataManagerSpy()
        viewControllerSpy = LoginViewControllerSpy()
        // Creamos el sut
        sut = LoginViewModel()
        // Inyección de dependencias al sut
        sut?.loginAPIDataManager = apiDataManagerSpy
        sut?.loginLocalDataManager = localDataManagerSpy
        sut?.loginViewController = viewControllerSpy
    }

    // Esta funcion siempre se llama después de cada test
    override func tearDownWithError() throws {
        apiDataManagerSpy = nil
        localDataManagerSpy = nil
        viewControllerSpy = nil
        sut = nil
    }
    
    func testOnButtonLogin_shouldSuccess() throws {
        // Given
        // Aqui establecemos los parametros del escenario incial
        let userMail: String = "aslkd"
        let counterSign: String = "asdlñkf"
        // When
        // Aqui accionamos lo que vamos a probar
        sut?.tapOnLoginButtonWithInputs(countersign: counterSign, userEmail: userMail)
        // Then
        let apiDataManagerSpy = try XCTUnwrap(apiDataManagerSpy)
        XCTAssert(apiDataManagerSpy.didPerformLogin)
    }
    
    func testOnButtonLogin_wihtoutUserMail_shouldFail() throws {
        // Given
        // Aqui establecemos los parametros del escenario incial
        let userMail: String? = nil
        let counterSign: String = ""
        // When
        // Aqui accionamos lo que vamos a probar
        sut?.tapOnLoginButtonWithInputs(countersign: counterSign, userEmail: userMail)
        // Then
        let apiDataManagerSpy = try XCTUnwrap(apiDataManagerSpy)
        XCTAssertFalse(apiDataManagerSpy.didPerformLogin)
        
    }
    
    func testOnButtonLogin_wihtoutCountersign_shouldFail() throws {
        // Given
        // Aqui establecemos los parametros del escenario incial
        let userMail: String? = ""
        let counterSign: String? = nil
        // When
        // Aqui accionamos lo que vamos a probar
        sut?.tapOnLoginButtonWithInputs(countersign: counterSign, userEmail: userMail)
        // Then
        let apiDataManagerSpy = try XCTUnwrap(apiDataManagerSpy)
        XCTAssertFalse(apiDataManagerSpy.didPerformLogin)
        
    }
    
    func testOnButtonSignIn_shouldSucceed() throws {
        //Given
        
        //When
        sut?.tapOnSignInButton()
        //Then
        let viewController = try XCTUnwrap(viewControllerSpy)
        XCTAssert(viewController.didCalledContinueToSignInView)
    }
    
    func testSetViewControllerConnection() throws {
        // Given
        // En este caso hcemos que el view controller sea null para que la prueba
        // tenga sentido
        sut?.loginViewController = nil
        let viewController: LoginViewControllerSpy = LoginViewControllerSpy()
        // When
        sut?.setViewControllerConnection(viewController: viewController)
        // Then
        XCTAssertNotNil(sut?.loginViewController)
    }

}
