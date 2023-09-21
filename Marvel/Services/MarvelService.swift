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
        static let baseUrl = "https://gateway.marvel.com:443/v1/public/characters?"
        static let tsEndpoint = "ts="
        static let apiKeyEndpoint = "apikey="
        static let hashEndpoint = "hash="
        static let offset = "offset="
        static let limit = "limit="
    }
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    
    func getMarvelCharacters(offset: Int = 0, limit: Int = 20, completion: @escaping (Result<MarvelAPIResponse, ServiceError>) -> Void) {
        let hashValue = (Constants.currentTimeStamp + Constants.privateApiKey + Constants.publicApiKey).MD5()
        let urlString = ApisConstant.baseUrl +
        ApisConstant.tsEndpoint + Constants.currentTimeStamp + "&" +
        ApisConstant.apiKeyEndpoint + Constants.publicApiKey + "&" +
        ApisConstant.hashEndpoint + hashValue + "&" +
        ApisConstant.offset + "\(offset)" + "&" +
        ApisConstant.limit + "\(limit)"
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let marvel):
                do {
                    let model = try JSONDecoder().decode(MarvelAPIResponse.self, from: marvel)
                    completion(.success(model))
                } catch {
                    completion(.failure(.cannotParse))
                }
            case .failure:
                completion(.failure(.cannotParse))
            }
        }
    }
}
