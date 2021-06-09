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
    let tableDataSource = CryptosTableDataSource()
    var viewModel: CryptoListTableViewModel!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CryptoListTableViewModel()
        onFetchingCryptoAction()
      
        _ = Timer.scheduledTimer(timeInterval: 5.0,
                                     target: self,
                                     selector: #selector(onFetchingCryptoAction),
                                     userInfo: nil,
                                     repeats: true)
     
        tableView.rowHeight = UITableView.automaticDimension
    }

    @objc private func onFetchingCryptoAction() {
        viewModel.fetchCrypto { (result: Result<[crypto], Error>) in
        switch result {
        case .success(let listCryptos):
            self.tableDataSource.dataSource = listCryptos
            self.tableView.dataSource = self.tableDataSource
            self.tableView.reloadData()
        case .failure(_):
            print("erreur")
        }
    }
}
}
    
extension CryptoListTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let indexPath = tableView.indexPathsForSelectedRows?.first
            let selectedRow = indexPath!.row
            destination.cryptoNameText = tableDataSource.dataSource[selectedRow].CoinInfo.FullName
            destination.cryptoValueText = tableDataSource.dataSource[selectedRow].DISPLAY.EUR.PRICE
            destination.cryptoSymboleText = tableDataSource.dataSource[selectedRow].DISPLAY.EUR.FROMSYMBOL
            destination.CryptovolumeText = tableDataSource.dataSource[selectedRow].DISPLAY.EUR.VOLUME24HOURTO
            destination.cryptoLogoImageUrl = tableDataSource.dataSource[selectedRow].CoinInfo.ImageUrl
            destination.valueLabelTextDouble = tableDataSource.dataSource[selectedRow].RAW.EUR.PRICE
        }
    }
}
