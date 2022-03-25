//
//  LogInViewControllerTest.swift
//  MVVM-LoginTests
//
//  Created by L Daniel De San Pedro on 17/03/22.
//

import XCTest
@testable import MVVM_Login

class LogInViewControllerTest: XCTestCase {
    
    // SUT
    var sut: LoginViewController?
    
    // Dependency Spies
    var viewModelSpy: LoginViewModelSpy?
    

    override func setUpWithError() throws {
        // Creamos la dependencia del view controller
        self.viewModelSpy = LoginViewModelSpy()
        // Creamos el view controller (SUT)
        self.sut = LoginViewController()
        // Injectamos el ViewModel Spy al view Controller
        sut?.loginViewModel = viewModelSpy
        // Inyectamos el view controller al viewmodel spy para que nos haga los llamados de regreso
        viewModelSpy?.loginViewController = sut
    }

    override func tearDownWithError() throws {
        viewModelSpy = nil
        sut = nil
    }
    
    func testOnLoginButtonTap() throws {
        // Given
        
        // When
        sut?.onLoginButtonTap()
        // Then
        let viewModelSpy = try XCTUnwrap(self.viewModelSpy)
        XCTAssert(viewModelSpy.didCallTapOnLoginButtonWithInputs)
    }
    
    func testOnSignInButtonTap() throws {
        // Given
        
        // When
        sut?.onSignInButtonTap()
        // Then
        let viewModelSpy = try XCTUnwrap(self.viewModelSpy)
        XCTAssert(viewModelSpy.didCallTapOnSignInButton)
    }


}
