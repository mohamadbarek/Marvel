//
//  AppModuleFactory.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-18.
//

import Foundation

final class AppModuleFactory: AppModuleFactoryType {

    func makeMarvelListModule(dependencies: MarvelListViewModel.Dependencies) -> MarvelListViewController {
        let marvelListViewController = MarvelListViewController.loadFromStoryboard()
        marvelListViewController.viewModel = MarvelListViewModel(dependencies: dependencies)
        return marvelListViewController
    }

    func makeMarvelDetailstModule(dependencies: MarvelDetailsViewModel.Dependencies, marvelCharacter: CharacterDetails) -> MarvelDetailsViewController {
        let marvelDetailsViewController = MarvelDetailsViewController.loadFromStoryboard()
        marvelDetailsViewController.viewModel = MarvelDetailsViewModel(character: marvelCharacter, dependencies: dependencies)
        return marvelDetailsViewController
    }
}
