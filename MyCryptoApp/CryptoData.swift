//
//  CryptoData.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 19/05/2021.
//

import Foundation
import Alamofire

///turn JSON into the data model.
struct Info: Codable {
    let Data: [crypto]
}

struct crypto: Codable {
    let CoinInfo: coinInfo
    let RAW: raw
    let DISPLAY: display
}

struct coinInfo: Codable {
    let FullName: String
    let Name: String
    let ImageUrl: String //url
}

struct raw: Codable {
    let EUR: euroR
    }
struct euroR: Codable {
    let PRICE: Double
    }

struct display: Codable {
    let EUR: euro
}
struct euro: Codable {
    let FROMSYMBOL: String
    let PRICE: String
    let VOLUME24HOURTO: String
}



