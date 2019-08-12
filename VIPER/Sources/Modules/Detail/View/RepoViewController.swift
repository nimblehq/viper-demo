//
//  RepoViewController.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import UIKit

final class RepoViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    /// Presenter
    var output: RepoViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
}

// MARK: - VIPER
extension RepoViewController: View {}

// MARK: - RepoViewInput
extension RepoViewController: RepoViewInput {
    func showViewItem(_ item: RepoItem) {
        navigationItem.title = item.repoFullName
        repoNameLabel.text = item.repoName
        descriptionLabel.text = item.description
        authorNameLabel.text = item.authorName
    }
    
    func showAvatar(_ data: Data) {
        avatarImageView.image = UIImage(data: data)
    }
}

// MARK: - UI
extension RepoViewController {
    private func setupUI() {
        setupAvatar()
    }
    
    private func setupAvatar() {
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
        avatarImageView.layer.masksToBounds = true
    }
}

// MARK: - Actions
extension RepoViewController {
    private func loadData() {
        output?.fetch()
    }
    
    @IBAction func didTapOwner(_ sender: Any) {
        output?.openWebPage()
    }
}
