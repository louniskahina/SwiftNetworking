//
//  CryptoData.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 19/05/2021.
//

import Foundation

///turn JSON into the data model.
struct Info: Codable {
    let Data: [crypto]
}

struct crypto: Codable {
    let CoinInfo: coinInfo
    //let RAW: raw
    let DISPLAY: display
}

struct coinInfo: Codable {
    let FullName: String
    let Name: String
    let ImageUrl: String //url
}

struct raw: Codable {
    let EUR: euro
    }

struct display: Codable {
    let EUR: euro
}
struct euro: Codable {
    let FROMSYMBOL: String
    let PRICE: String
}

protocol DisplayableCoinInfo {
    var fullNameLabelText: String { get }
    var logoImageURL: String { get }
}

protocol DisplayableEuro {
    var symbolLabelText: String { get }
    var valueLabelText: String { get }
}

//make coinInfo displayable
extension coinInfo: DisplayableCoinInfo {
    var logoImageURL: String {
        ImageUrl
    }
   
    var fullNameLabelText: String {
        FullName
    }
}

extension euro: DisplayableEuro {
    var symbolLabelText: String {
        FROMSYMBOL
    }
    
    var valueLabelText: String {
        PRICE
    }
    
    
}
