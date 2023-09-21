//
//  MarvelDetailsCell.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-21.
//

import UIKit

final class MarvelDetailsCell: UITableViewCell, CellIdentifiable {

    @IBOutlet weak private var nameLabel: UILabel!

    func configure(with text: String) {
        nameLabel.text = text
    }
}
