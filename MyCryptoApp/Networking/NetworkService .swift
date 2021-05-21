
//  networkManager .swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 20/05/2021.
//

import Foundation
import Alamofire


class NetworkService {
    func fetchCrypto() {
        AF.request("https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=EUR")
            .validate()
            .responseDecodable(of: Info.self) { (response) in
                guard let info = response.value else { return }
                print(info.Data[0].CoinInfo.Name)
                print(info.Data[0].CoinInfo.FullName)
                print(info.Data[1].CoinInfo.Name)
                print(info.Data[1].CoinInfo.FullName)
                print(info.Data[0].DISPLAY.EUR.PRICE)
                print(info.Data[1].CoinInfo.FullName)
                print(info.Data[1].CoinInfo.ImageUrl)

    
  }

}
}
