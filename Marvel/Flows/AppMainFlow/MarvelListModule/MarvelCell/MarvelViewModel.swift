//
//  MarvelViewModel.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-19.
//

import Foundation

final class MarvelViewModel {

    let marvel: CharacterDetails

    init(marvel: CharacterDetails) {
        self.marvel = marvel
    }

    var displayName: String {
        return marvel.name ?? ""
    }

    var detailsText: String {
        return marvel.description ?? ""
    }

    var imageUrl: URL? {
        guard let path = marvel.thumbnail?.path,
              let extensionString = marvel.thumbnail?.extensionString else {
            return nil
        }
        let securePath = path.replacingOccurrences(of: "http:", with: "https:")
        guard let url = URL(string: "\(securePath).\(extensionString)") else {
            return nil
        }
        return url
    }
}
