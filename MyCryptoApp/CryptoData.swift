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
    let VOLUME24HOURTO: String
}

protocol Displayable {
    
    var fullNameLabelText: String { get }
    var logoImageURL: String { get }
    var symbolLabelText: String { get }
    var valueLabelText: String { get }
    var volume24hourText: String { get }
}

//make coinInfo displayable
extension crypto: Displayable {
    var volume24hourText: String {
        DISPLAY.EUR.VOLUME24HOURTO
    }
    
    var symbolLabelText: String {
        DISPLAY.EUR.FROMSYMBOL
    }
    
    var valueLabelText: String {
        DISPLAY.EUR.PRICE
    }
    
    var logoImageURL: String {
        CoinInfo.ImageUrl
    }
   
    var fullNameLabelText: String {
        CoinInfo.FullName
    }
}
