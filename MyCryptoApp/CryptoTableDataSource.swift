//
//  CryptoTableDataSource.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 26/05/2021.
//

import Foundation
import UIKit

class CryptosTableDataSource : NSObject {
    var dataSource = [crypto]()
}


extension CryptosTableDataSource : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath ) as! CryptoItemTableViewCell
       /*  let crypto = cryptos[indexPath.row]
        cell.cryptoNameLabel?.text = crypto.CoinInfo.FullName
        cell.cryptoValueLabel?.text = crypto.DISPLAY.EUR.PRICE
        cell.cryptoSymbolLabel?.text = crypto.DISPLAY.EUR.FROMSYMBOL
       //https://www.cryptocompare.com/ + imageUrl
        let imageUrl = crypto.CoinInfo.ImageUrl
         let urlo = URL(string: "https://www.cryptocompare.com/" + imageUrl )
        cell.cryptoLogoImage?.load(url: urlo!)*/
        cell.cryptoItem = dataSource[indexPath.row]
        return cell
    }
 
 
  
 
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
