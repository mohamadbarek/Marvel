//
//  MarvelListViewModel.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-18.
//

import Foundation

class MarvelListViewModel {

    typealias Dependencies = HasNetworkService

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}
