//
//  NetworkService.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-18.
//

import Foundation

protocol NetworkService: AnyObject {
    
    // MARK: Get Marvel Characters
    func getMarvelCharacters(offset: Int, limit: Int, completion: @escaping (Result<MarvelAPIResponse, ServiceError>) -> Void)
}
