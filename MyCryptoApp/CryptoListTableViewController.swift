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
   
    @IBOutlet weak var cryptoNameLabel: UILabel!
    let networkService = NetworkService()

    var items: [DisplayableCoinInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.fetchCrypto()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        cryptoNameLabel?.text = item.fullNameLabelText
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
      return indexPath
    }
 
}
  
extension CryptoListTableViewController {
    func fetchCrypto() {
        AF.request("https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=EUR")
            .validate()
            .responseDecodable(of: Info.self) { (response) in
                guard let info = response.value else { return }
                // show as many cells as there are crypto
                self.items = info.Data
                self.tableView.reloadData()
            }

    }
    
    
}

