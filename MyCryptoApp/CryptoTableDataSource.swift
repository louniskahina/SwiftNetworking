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
        cell.cryptoItem = dataSource[indexPath.row]
        return cell
    }
  
}

