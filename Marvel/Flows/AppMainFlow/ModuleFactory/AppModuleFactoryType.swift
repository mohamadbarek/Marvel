//
//  AppModuleFactoryType.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-18.
//

import Foundation

protocol AppModuleFactoryType: AnyObject {
    func makeMarvelListModule(dependencies: MarvelListViewModel.Dependencies) -> MarvelListViewController
    func makeMarvelDetailstModule(dependencies: MarvelDetailsViewModel.Dependencies, marvelCharacter: CharacterDetails) -> MarvelDetailsViewController
}
