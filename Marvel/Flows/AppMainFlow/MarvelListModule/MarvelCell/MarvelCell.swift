//
//  MarvelCell.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-19.
//

import UIKit
import Kingfisher

final class MarvelCell: UICollectionViewCell, CellIdentifiable {

    @IBOutlet private weak var marvelImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    var viewModel: MarvelViewModel!

    func configure(viewModel: MarvelViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.displayName
        descriptionLabel.text = viewModel.detailsText
        if let url = viewModel.imageUrl {
            marvelImageView.kf.setImage(with: url)
        }
    }
}
