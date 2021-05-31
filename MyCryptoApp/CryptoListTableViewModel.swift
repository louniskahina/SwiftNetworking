//
//  CryptoListTableViewModel.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 27/05/2021.
//

import Foundation
import Alamofire
import Combine
import UIKit

class  CryptoListTableViewModel {
    
    // Values observed
    @Published var requestError: (Error, Any?)?
    @Published var dataSource: [crypto]?
    @Published var hasFetched = false
    @Published var hasNoCryptos = false
    
    // List of subscriptions
    private var subscriptions: Set<AnyCancellable> = []
    //Contains requests
    private var networkService: NetworkService = NetworkService()
    
    // Data source of the table
    init(dataSource: [crypto]?) {
        self.dataSource = dataSource
    }
    
    func fetchCrypto(completion: @escaping (Result<[crypto], Error>) -> Void) {
        self.networkService.fetchCrypto { [weak self] (result: Result<[crypto], AFError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let cryptoList):
                    if cryptoList.isEmpty {
                        self?.hasNoCryptos = true
                        self?.hasFetched = true
                    } else {
                        self?.dataSource = cryptoList
                        self?.hasFetched = true
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

