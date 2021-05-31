//
//  AppConsts.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 31/05/2021.
//

import Foundation

import Foundation

struct AppConsts {
    
    // URL
    static let defaultUrl = "https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=EUR"
    // Request timeout
    static let customTimeoutIntervalForRequest = 20
    static let customTimeoutIntervalForResource = 20
    // Request retry
    static let customRetryLimit = 3
    static let customRetryDelay = 2
}
