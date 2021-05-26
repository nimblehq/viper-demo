//
//  DetailViewController.swift
//  Tutorial3
//
//  Created by Su Van Ho on 21/05/2021.
//  
//

import UIKit
import SnapKit

protocol DetailViewInput: AnyObject {

    func configure()
    func configure(_ viewModel: DetailViewController.ViewModel)
}

protocol DetailViewOutput: AnyObject {

    func viewDidLoad()
}

final class DetailViewController: UIViewController {

    var output: DetailViewOutput?

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let imageView = UIImageView()
    private let descriptionLabel = UILabel()

    private var imageViewWidthConstraint: Constraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
}

// MARK: - DetailViewInput

extension DetailViewController: DetailViewInput {

    func configure() {
        setUpLayout()
        setUpViews()
    }

    func configure(_ viewModel: ViewModel) {
        navigationItem.title = viewModel.title
        imageView.kf.setImage(with: viewModel.imageURL) { [weak self] _ in
            self?.updateImageLayout()
        }
        descriptionLabel.text = viewModel.description
    }

    private func setUpLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(descriptionLabel)

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view.snp.width)
        }

        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(400.0)
            imageViewWidthConstraint = $0.width.equalTo(0.0).constraint
        }

        descriptionLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.top.equalTo(imageView.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }

    private func setUpViews() {
        view.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 17.0, weight: .light)
    }

    private func updateImageLayout() {
        guard let image = imageView.image else { return }
        let ratio = image.size.width / image.size.height
        let width = imageView.frame.height * ratio
        imageViewWidthConstraint?.update(offset: width)
        view.layoutIfNeeded()
    }
}

// MARK: Models

extension DetailViewController {

    struct ViewModel {

        let title: String
        let imageURL: URL?
        let description: String
    }
}
