//
//  SignInViewController.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {

    var viewModel: SignInViewModelProtocol?
    
    private var signInButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(onSignInButtonTap), for: .touchUpInside)
        return button
    }()
    
    private var cancelButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(onCancelButtonTap), for: .touchUpInside)
        return button
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.placeholder = "Password"
        return textField
    }()
    
    private var passwordConfirmTextField: UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.placeholder = "Confirm Password"
        return textField
    }()
    
    private var userTextField: UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.placeholder = "User"
        return textField
    }()
    
    private var emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.placeholder = "Email"
        return textField
    }()
    
    private var birthDateField: UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.placeholder = "Birthday"
        return textField
    }
    
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        return stackView
    }()
    
    override func viewDidLoad() {
        initUI()
    }
    
    func initUI() {
        view.backgroundColor = .systemBackground
        let stackViewContent: [UIView] = [ userTextField, emailTextField, passwordTextField, passwordConfirmTextField, signInButton, cancelButton ]
        view.addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        stackViewContent.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 30).isActive = true
            contentStackView.addArrangedSubview(view)
        }
    }
    
    @objc func onSignInButtonTap() {
        guard let user = userTextField.text,
              let email = emailTextField.text,
              let countersign = passwordTextField.text,
              let confirmCountersign = passwordConfirmTextField.text else {
                  return
              }
        viewModel?.onSignInButtonTap(user: user, email: email, countersign: countersign, confirmCountersign: confirmCountersign)
    }
    
    @objc func onCancelButtonTap() {
        viewModel?.onCancelButtonTap()
    }
    
}

extension SignInViewController: SignInViewControllerProtocol {
    
    func setConnection(with viewModel: SignInViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func continueToUserDetailView() {
        let userDetailViewModel: UserDetailViewModelProtocol = UserDetailViewModel()
        let userDetailViewController: UserDetailViewControllerProtocol = UserDetailViewController()
        userDetailViewController.setViewModelConnection(userDetailViewModel)
        userDetailViewController.modalPresentationStyle = .overFullScreen
        userDetailViewModel.setViewControllerConnection(userDetailViewController)
        present(userDetailViewController, animated: true, completion: nil)
    }
    
    func dismissToLogin() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension 
