
//  networkManager .swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 20/05/2021.
//

import Foundation
import Alamofire

//https://app.quicktype.io/

class NetworkService {
    

    func fetchCrypto()  {
      //  https://www.cryptocompare.com/
        AF.request("https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=EUR")
            .validate()
            .responseDecodable(of: Info.self) { (response) in
                guard let info = response.value else { return }
                print(info.Data[1].CoinInfo.ImageUrl)
                
            }
    }
}
