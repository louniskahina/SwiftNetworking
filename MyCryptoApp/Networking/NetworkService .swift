
//  networkManager .swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 20/05/2021.
//

import Foundation
import Alamofire

//https://app.quicktype.io/

protocol NetworkServiceProtocole {
    func fetchCrypto(completion: @escaping (Result<[crypto], AFError>) -> Void)
}

class NetworkService : NetworkServiceProtocole {
    
    var networkManager: NetworkManager = NetworkManagerImpl()
    
    func fetchCrypto(completion: @escaping (Result<[crypto], AFError>) -> Void) {
        /// fetch corpusfrom the API
        /// - Parameter completion: the completion to execute once the data is fetched
        func fetchCorpus(completion: @escaping (Result<[crypto], AFError>) -> Void) {
            networkManager.performApi(
                URL: URL(string: AppConsts.defaultUrl),
                method: .get,
                parameters: nil,
                encoding: URLEncoding.default,
                customHeader: nil
            ) { (result: Result<[crypto], AFError>) in
                switch result {
                case .success(let corpusList):
                    completion(.success(corpusList))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
}





