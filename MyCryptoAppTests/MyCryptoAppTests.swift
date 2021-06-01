//
//  MyCryptoAppTests.swift
//  MyCryptoAppTests
//
//  Created by Kahina Lounis on 17/05/2021.
//

import XCTest
import Alamofire
@testable import MyCryptoApp

class MyCryptoAppTests: XCTestCase {

    let networkService : NetworkServiceProtocole = NetworkService()
    
    func testGetCorpusList() throws {
        let cryptoExpectation = XCTestExpectation(description: "listCryptos")

        networkService.fetchCrypto() { (result: Result<[crypto], AFError>) in
            switch result {
            case .success(let cryptoList):
                XCTAssert(type(of: cryptoList) == Array<crypto>.self)//on verifie que le resultat est un tableau de crypto
            case .failure(_):
                XCTFail("No error thrown")
            }
            
            cryptoExpectation.fulfill()
        }
        
    }


}
