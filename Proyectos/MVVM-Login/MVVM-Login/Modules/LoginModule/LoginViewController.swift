//
//  ViewController.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginViewModel: LoginViewModelProtocol?
    
    private var logInButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(onLoginButtonTap), for: .touchUpInside)
        return button
    }()
    
    private var signInButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(onSignInButtonTap), for: .touchUpInside)
        return button
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.placeholder = "Password"
        return textField
    }()
    
    private var userTextField: UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.placeholder = "Email"
        return textField
    }()
    
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        view.backgroundColor = .systemBackground
        let stackViewElements: [UIView] = [userTextField, passwordTextField, logInButton, signInButton]
        
        view.addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contentStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
        stackViewElements.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 30).isActive = true
            contentStackView.addArrangedSubview(view)
        }
    }
    
    @objc func onSignInButtonTap() {
        loginViewModel?.tapOnSignInButton()
    }
    
    @objc func onLoginButtonTap() {
        let user: String? = userTextField.text
        let countersign: String? = passwordTextField.text
        loginViewModel?.tapOnLoginButtonWithInputs(countersign: countersign, userEmail: user)
    }
    
}

extension LoginViewController: LoginViewControllerProtocol {
    
    func setViewModelConnection(viewModel: LoginViewModelProtocol) {
        loginViewModel = viewModel
    }
    
    func continueToUserDetailView() {
        let userDetailViewModel: UserDetailViewModelProtocol = UserDetailViewModel()
        let userDetailViewController: UserDetailViewControllerProtocol = UserDetailViewController()
        userDetailViewController.setViewModelConnection(userDetailViewModel)
        userDetailViewController.modalPresentationStyle = .overFullScreen
        userDetailViewModel.setViewControllerConnection(userDetailViewController)
        present(userDetailViewController, animated: true, completion: nil)
    }

    func continueToSignInView() {
        let viewModel: SignInViewModelProtocol = SignInViewModel()
        let viewController: SignInViewControllerProtocol = SignInViewController()
        viewController.setConnection(with: viewModel)
        viewModel.setConnection(with: viewController)
        self.present(viewController, animated: true, completion: nil)
    }
}
