
//  networkManager .swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 20/05/2021.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocole {
    func fetchCrypto(completion: @escaping (Result<[crypto], AFError>) -> Void)
}

class NetworkService : NetworkServiceProtocole {
    
let baseUrl = "https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=EUR"
    
    var networkManager: NetworkManager = NetworkManagerImpl()
    
        //Parameter completion: the completion to execute once the data is fetched
        func fetchCrypto(completion: @escaping (Result<[crypto], AFError>) -> Void) {
            networkManager.performApi(
                URL: URL(string: baseUrl),
                method: .get,
                parameters: nil,
                encoding: URLEncoding.default,
                customHeader: nil
            ) { (result: Result<Info, AFError>) in
                switch result {
                case .success(let info):
                    completion(.success(info.Data))
                case .failure(let error):
                    completion(.failure(error))
                }
               
            }
        }
    
    
}





