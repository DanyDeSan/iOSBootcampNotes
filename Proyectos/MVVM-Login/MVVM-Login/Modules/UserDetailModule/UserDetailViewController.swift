//
//  UserDetailViewController.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation
import UIKit


class UserDetailViewController: UIViewController, UserDetailViewControllerProtocol {    
    var viewModel: UserDetailViewModelProtocol?
    
    private lazy var emailLabel: UILabel = {
        return UILabel()
    }()
    
    private lazy var nameLabel: UILabel = {
        return UILabel()
    }()
    
    private lazy var idLabel: UILabel = {
        return UILabel()
    }()
    
    private lazy var logOut: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onLogOutTap), for: .touchUpInside)
        button.setTitle("Log Out", for: .normal)
        button.backgroundColor = .systemBlue
        return button
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
        viewModel?.fetchUserData()
    }
    
    func initUI() {
        view.backgroundColor = .systemBackground
        let stackViewContent: [UIView] = [idLabel,nameLabel,emailLabel,logOut]
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
    
    @objc func onLogOutTap() {
        viewModel?.onLogOutTap()
    }
    
    func setViewModelConnection(_ viewModel: UserDetailViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func updateUIWithInfo(user: String, email: String, id: String) {
        emailLabel.text = email
        idLabel.text = id
        nameLabel.text = user
    }
    
    func dismissToLogin() {
        self.dismiss(animated: true, completion: nil)
    }
}
