//
//  NetworkManager.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 31/05/2021.
//

import Foundation
import Alamofire

protocol NetworkManager {
    
    func performApi<T: Decodable>(
        URL: URL?,
        method: HTTPMethod,
        parameters: Parameters?,
        encoding: ParameterEncoding,
        customHeader: HTTPHeaders?,
        completion: @escaping (Result<T, AFError>) -> Void
    )
}

class NetworkManagerImpl: NetworkManager {

    func performApi<T: Decodable>(
        URL: URL?,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.httpBody,
        customHeader: HTTPHeaders? = nil,
        completion: @escaping (Result<T, AFError>) -> Void
    ) {
        guard let URL = URL else {
            completion(.failure(.invalidURL(url: "")))
            return
        }
        let headers: HTTPHeaders = [:]
        AF.request(URL, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let success):
                    completion(.success(success))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
}
