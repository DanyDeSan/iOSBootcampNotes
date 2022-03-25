//
//  LoginViewModelSpy.swift
//  MVVM-LoginTests
//
//  Created by L Daniel De San Pedro on 22/03/22.
//

import Foundation
@testable import MVVM_Login

class LoginViewModelSpy: LoginViewModelProtocol {
    // Function call flags
    var didCallSetViewControllerConnection: Bool = false
    var didCallTapOnLoginButtonWithInputs: Bool = false
    var didCallTapOnSignInButton: Bool = false
    
    var didCallNumberOfRows: Bool = false
    
    var didCallNumberOfSections: Bool = false
    
    
    // Dummy dependencies
    var loginViewController: LoginViewControllerProtocol?
    var loginAPIDataManager: LoginAPIDataManagerProtocol?
    var loginLocalDataManager: LoginLocalDataManagerProtocol?
    
    func setViewControllerConnection(viewController: LoginViewControllerProtocol) {
        didCallSetViewControllerConnection = true
    }
    
    func tapOnLoginButtonWithInputs(countersign: String?, userEmail: String?) {
        didCallTapOnLoginButtonWithInputs = true
        loginViewController?.continueToUserDetailView()
    }
    
    func tapOnSignInButton() {
        didCallTapOnSignInButton = true
        loginViewController?.continueToSignInView()
    }
    
    // Example if the view model manages a TableView
    
    // Helper function for setting the number of rows or sections
    
    var numberOfRows: Int = 0
    var numberOfSections: Int = 0
    
    func setNumberOfRows(_ numberOfRows: Int) {
        self.numberOfRows = numberOfRows
    }
    
    func setNumberOfSections(_ numberOfSections: Int) {
        self.numberOfSections = numberOfSections
    }
    
    func numberOfRows(at section: Int) -> Int {
        didCallNumberOfRows = true
        return numberOfRows
    }
    
    func numberOfSections(at index: Int) -> Int {
        didCallNumberOfSections = true
        return numberOfSections
    }
}
