//
//  CryptoListTableViewController.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 18/05/2021.
//

import Foundation
import UIKit
import Alamofire


class CryptoListTableViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    var cryptos : [Displayable] = []
    
    
    let networkService = NetworkService()
    let cryptoViewModel = CryptoViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        
        fetchCrypto()
    }

}

extension CryptoListTableViewController {
func fetchCrypto()  {
  //  https://www.cryptocompare.com/
    AF.request("https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=EUR")
        .validate()
        .responseDecodable(of: Info.self) { (response) in
            guard let info = response.value else { return }
            self.cryptos = info.Data
            self.tableView.reloadData()
          
            
        }
}

}
