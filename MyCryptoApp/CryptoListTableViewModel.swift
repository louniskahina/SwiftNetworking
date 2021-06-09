//
//  CryptoListTableViewModel.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 27/05/2021.
//

import Foundation
import Alamofire
import UIKit

class CryptoListTableViewModel {
    
    // Values observed
     var requestError: (Error, Any?)?
     var dataSource: [crypto]?
    
    private var networkService: NetworkService = NetworkService()
    
    init () {
    }
 
    init(dataSource: [crypto]?) {
        self.dataSource = dataSource
    }
    
    func fetchCrypto(completion: @escaping (Result<[crypto], Error>) -> Void) {
        self.networkService.fetchCrypto { [weak self] (result: Result<[crypto], AFError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let cryptoList):
                    if cryptoList.isEmpty {
                        // TODO
                    } else {
                        self?.dataSource = cryptoList //the datasource of tableview will get the fetchCrypto result
                    }
                    completion(.success(cryptoList))
                case .failure(let error):
                    self?.setError(error: error, className: crypto.self)
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func setError(error: Error, className: Any? = nil) {
        requestError = (error, className)
    }
}

