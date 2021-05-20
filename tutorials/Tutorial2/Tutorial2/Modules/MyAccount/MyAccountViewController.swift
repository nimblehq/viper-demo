//
//  MyAccountViewController.swift
//  Tutorial2
//
//  Created by Su Van Ho on 16/05/2021.
//  
//

import UIKit

protocol MyAccountViewInput: AnyObject {

    func configure()
    func configureUserView(username: String, email: String)
}

protocol MyAccountViewOutput: AnyObject {

    func viewDidLoad()
    func logoutButtonDidTap()
}

final class MyAccountViewController: UIViewController {

    var output: MyAccountViewOutput?

    private let userView = UIView()
    private let userImageView = UIImageView()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()

    private let logoutButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
}

// MARK: - MyAccountViewInput

extension MyAccountViewController: MyAccountViewInput {

    func configure() {
        setUpLayout()
        setUpViews()
    }

    func configureUserView(username: String, email: String) {
        userImageView.image = UIImage(named: "avatar")
        usernameLabel.text = username
        emailLabel.text = email
    }
}

// MARK: - Private functions

extension MyAccountViewController {

    func setUpLayout() {
        view.addSubview(userView)
        view.addSubview(logoutButton)

        userView.addSubview(userImageView)
        userView.addSubview(usernameLabel)
        userView.addSubview(emailLabel)

        userView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            $0.leading.trailing.equalToSuperview()
        }

        userImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(20.0)
            $0.leading.equalToSuperview().inset(16.0)
            $0.size.equalTo(60.0)
        }

        usernameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(29.0)
            $0.leading.equalTo(userImageView.snp.trailing).offset(12.0)
        }

        emailLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(29.0)
            $0.leading.equalTo(userImageView.snp.trailing).offset(12.0)
        }

        logoutButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.top.equalTo(userView.snp.bottom).offset(16.0)
            $0.height.equalTo(45.0)
        }
    }

    func setUpViews() {
        view.backgroundColor = .systemGroupedBackground

        navigationItem.title = "My Account"
        navigationController?.navigationBar.prefersLargeTitles = true

        usernameLabel.font = .systemFont(ofSize: 17.0, weight: .bold)
        emailLabel.font = .systemFont(ofSize: 15.0, weight: .light)

        logoutButton.backgroundColor = .systemGray
        logoutButton.tintColor = .white
        logoutButton.setTitle("Log out", for: .normal)
        logoutButton.layer.cornerRadius = 3.0
        logoutButton.addTarget(self, action: #selector(logoutButtonDidTap), for: .touchUpInside)
    }
}

// MARK: - Actions

extension MyAccountViewController {

    @objc private func logoutButtonDidTap() {
        output?.logoutButtonDidTap()
    }
}
