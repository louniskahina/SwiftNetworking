//
//  CryptoTableDataSource.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 26/05/2021.
//

import Foundation

import UIKit


extension CryptoListTableViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath ) as! CryptoItemTableViewCell
         let crypto = cryptos[indexPath.row]
         cell.cryptoNameLabel?.text = crypto.fullNameLabelText
         cell.cryptoValueLabel?.text = crypto.valueLabelText
         cell.cryptoSymbolLabel?.text = crypto.symbolLabelText
       //https://www.cryptocompare.com/ + imageUrl
        let imageUrl = crypto.logoImageURL
         let urlo = URL(string: "https://www.cryptocompare.com/" + imageUrl )
        cell.cryptoLogoImage?.load(url: urlo!)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailsViewController {
            let indexPath = tableView.indexPathsForSelectedRows?.first
            let selectedRow = indexPath!.row
            destination.cryptoNameText = cryptos[selectedRow].fullNameLabelText
            destination.cryptoValueText = cryptos[selectedRow].valueLabelText
            destination.cryptoSymboleText = cryptos[selectedRow].symbolLabelText
            destination.CryptovolumeText = cryptos[selectedRow].volume24hourText
            destination.cryptoLogoImageUrl = cryptos[selectedRow].logoImageURL
            destination.valueLabelTextDouble = cryptos[selectedRow].valueLabelTextDouble
            
         
        }
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
