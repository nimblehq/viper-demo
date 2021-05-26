//
//  BeerItemCell.swift
//  Tutorial3
//
//  Created by Su Van Ho on 19/05/2021.
//

import UIKit
import Kingfisher

final class BeerItemCell: UITableViewCell {

    private let beerImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayouts()
        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(viewModel: BeerItemCell.ViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        beerImageView.kf.setImage(with: viewModel.imageURL)
    }

    private func setUpLayouts() {
        contentView.addSubview(beerImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)

        beerImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16.0)
            $0.width.equalTo(60)
            $0.height.equalTo(240.0)
            $0.bottom.lessThanOrEqualToSuperview().inset(16.0)
        }

        titleLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(16.0)
            $0.leading.equalTo(beerImageView.snp.trailing).offset(16.0)
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.leading.equalTo(titleLabel)
            $0.bottom.lessThanOrEqualToSuperview().inset(16.0)
        }
    }

    private func setUpViews() {
        selectionStyle = .none

        beerImageView.contentMode = .scaleAspectFit

        titleLabel.numberOfLines = 1
        titleLabel.font = .systemFont(ofSize: 17.0, weight: .medium)

        descriptionLabel.font = .systemFont(ofSize: 15.0, weight: .light)
        descriptionLabel.numberOfLines = 0
    }
}

// MARK: - ViewModel

extension BeerItemCell {

    struct ViewModel {

        let title: String
        let description: String
        let imageURL: URL?
    }
}
