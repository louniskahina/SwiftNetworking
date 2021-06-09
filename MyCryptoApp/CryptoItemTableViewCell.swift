//
//  CryptoTableViewCell.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 26/05/2021.
//

import Foundation
import UIKit

class CryptoItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cryptoNameLabel: UILabel!
    @IBOutlet weak var cryptoValueLabel: UILabel!
    @IBOutlet weak var cryptoSymbolLabel: UILabel!
    @IBOutlet weak var cryptoLogoImage: UIImageView!
    
    var cryptoItem: crypto? {
        didSet {
            cryptoNameLabel?.text = cryptoItem?.CoinInfo.FullName
            cryptoValueLabel?.text = cryptoItem?.DISPLAY.EUR.PRICE
            if let symbole = cryptoItem?.DISPLAY.EUR.FROMSYMBOL {
                cryptoSymbolLabel?.text = "(\(symbole))"}
            let baseUrl = "https://www.cryptocompare.com/"
            //gerer le crash
            let imageUrl = URL(string: baseUrl + (cryptoItem?.CoinInfo.ImageUrl)!)
            cryptoLogoImage?.load(url: imageUrl!)
        }
    }
}
