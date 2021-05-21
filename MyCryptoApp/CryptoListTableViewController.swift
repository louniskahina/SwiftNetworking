//
//  CryptoListTableViewController.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 18/05/2021.
//

import Foundation
import UIKit
import Alamofire


class CryptoListTableViewController: UITableViewController {
   
    let networkService = NetworkService()
    var crypto = [Info]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.fetchCrypto()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return items.count
          return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
      return indexPath
    }
 
}
  


