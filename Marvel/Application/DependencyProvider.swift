//
//  DependencyProvider.swift
//  marvel
//
//  Created by MohammadBarek on 2023-09-18.
//

import Foundation

/*
 For dependency injection we're using protocol composition.
 There is DependencyProvider object that has all dependencies and is injected into all coordinators and view models.
 But each view model and coordinator specifies its own typealias for dependencies to have access only to specific dependencies.
 More on this approach here: http://merowing.info/2017/04/using-protocol-compositon-for-dependency-injection/
 */
class DependencyProvider: HasNetworkService {

    let networkService: NetworkService

    init() {
        self.networkService = MarvelService()
    }
}
