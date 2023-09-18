//
//  MarvelService.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-18.
//

import Foundation
import Alamofire

enum ServiceError: Error {
    case cannotParse
}

/// A service that knows how to perform requests for GitHub data.
class MarvelService: NetworkService {
    
    private enum ApisConstant {
        static let baseUrl = ""
        static let marvelEndpoint = ""
    }
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}
