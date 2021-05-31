//
//  CryptoListTableViewController.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 18/05/2021.
//

import Foundation
import UIKit
import Alamofire
import Combine


class CryptoListTableViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    var dataSource: CryptosTableDataSource!
    var viewModel: CryptoListTableViewModel!
    private var subscriptions: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setListeners()
        // Fetch crypto via the ViewModel
        viewModel.fetchCrypto { [weak self] (result: Result<[crypto], Error>) in
            DispatchQueue.main.async {
                do {
                    try self?.onFetchingCryptoAction(result: result)
                } catch ErrorEnum.requestError(let error, let className) {
                    self?.handleError(error: .requestError(error, className), callback: { self?.viewModel.hasFetched = true })
                } catch {
                    self?.handleError(error: ErrorEnum.map(error), callback: { self?.viewModel.hasFetched = true })
                }
            }
        }
        
        tableView.reloadData()
        tableView.dataSource = dataSource
        
        tableView.rowHeight = UITableView.automaticDimension
        
     
    }
    
    /// Set listeners to observe value from the ViewModel
    private func setListeners() {
        // Check if we have an error due to a request and print it
        viewModel.$requestError.sink { [weak self] requestError in
                self?.viewModel.requestError = nil
        }.store(in: &subscriptions)

        // Update datasource and reload table with data
        viewModel.$dataSource.sink { [weak self] dataSource in
            if let dataSource = dataSource {
                self?.dataSource.dataSource = dataSource
                self?.tableView.reloadData()
                // Accessibility
                UIAccessibility.post(notification: UIAccessibility.Notification.layoutChanged, argument: "refreshingCryptoTable")
            }
        }.store(in: &subscriptions)

        // End refreshing values and hide activity indicator
        viewModel.$hasFetched.sink { [weak self] hasFetched in
            if hasFetched {
                self?.viewModel.requestError = nil
                self?.refreshControl.endRefreshing()
            }
        }.store(in: &subscriptions)

        // If we have no results, show error alert
        viewModel.$hasNoCryptos.sink { [weak self] hasNoFolder in
            if hasNoFolder {
                self?.viewModel.hasNoCryptos = false
 
                UIAccessibility.post(notification: UIAccessibility.Notification.layoutChanged, argument: "hasNoCryptos")
            }
        }.store(in: &subscriptions)
    }
    

    /// After fetching folders request
    private func onFetchingCryptoAction(result: Result<[crypto], Error>) throws {
        switch result {
        case .success:
            print("Fetching cryptos successfully.")
        case .failure(let error):
            // updates the dataSource, empty it
            self.viewModel.dataSource = []
            switch error {
            case is ErrorEnum:
                throw error
            case is AFError:
                throw ErrorEnum.requestError(error as! AFError, crypto.self)
            default:
                throw ErrorEnum.other(error)
            }
        }
    }
  

}

extension CryptoListTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailsViewController {
            let indexPath = tableView.indexPathsForSelectedRows?.first
            let selectedRow = indexPath!.row
          //  destination.cryptoNameText = cryptos[selectedRow].CoinInfo.FullName
          //  destination.cryptoValueText = cryptos[selectedRow].DISPLAY.EUR.PRICE

         //   destination.cryptoSymboleText = cryptos[selectedRow].DISPLAY.EUR.FROMSYMBOL
         //   destination.CryptovolumeText = cryptos[selectedRow].DISPLAY.EUR.VOLUME24HOURTO
         //   destination.cryptoLogoImageUrl = cryptos[selectedRow].CoinInfo.ImageUrl
        //    destination.valueLabelTextDouble = cryptos[selectedRow].RAW.EUR.PRICE
            
         
        }
    }
}
