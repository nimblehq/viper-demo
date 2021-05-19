//
//  LoginViewController.swift
//  Tutorial1
//
//  Created by Su Van Ho on 07/05/2021.
//  
//

import UIKit

protocol LoginViewInput: AnyObject {

    func configure()
    func showAlert(message: String)
}

protocol LoginViewOutput: AnyObject {

    func viewDidLoad()
    func loginButtonDidTap(email: String, pass: String)
}

final class LoginViewController: UIViewController {

    var output: LoginViewOutput?

    private let emailField = UITextField()
    private let passField = UITextField()
    private let loginButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
}

// MARK: - LoginViewInput

extension LoginViewController: LoginViewInput {

    func configure() {
        setUpLayout()
        setUpViews()
    }

    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Tutorial 1", message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - Private Functions

extension LoginViewController {

    private func setUpLayout() {
        view.addSubview(emailField)
        view.addSubview(passField)
        view.addSubview(loginButton)

        emailField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(30.0)
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.height.equalTo(44.0)
        }

        passField.snp.makeConstraints {
            $0.top.equalTo(emailField.snp.bottom).offset(16.0)
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.height.equalTo(44.0)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passField.snp.bottom).offset(16.0)
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.height.equalTo(44.0)
        }
    }

    private func setUpViews() {
        view.backgroundColor = .white
        navigationItem.title = "Login"

        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress

        passField.placeholder = "Password"
        passField.borderStyle = .roundedRect
        passField.isSecureTextEntry = true

        loginButton.backgroundColor = .systemBlue
        loginButton.tintColor = .white
        loginButton.setTitle("Log In", for: .normal)
        loginButton.layer.cornerRadius = 3.0
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
}

// MARK: - Actions

extension LoginViewController {

    @objc private func loginButtonDidTap() {
        let email = emailField.text ?? ""
        let pass = passField.text ?? ""
        output?.loginButtonDidTap(email: email, pass: pass)
    }
}
