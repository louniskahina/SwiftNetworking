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
            cryptoSymbolLabel?.text = cryptoItem?.DISPLAY.EUR.FROMSYMBOL
           //https://www.cryptocompare.com/ + imageUrl
            let imageUrl = cryptoItem?.CoinInfo.ImageUrl
            let urlo = URL(string: "https://www.cryptocompare.com/" + imageUrl! )
            cryptoLogoImage?.load(url: urlo!)

            
        }
    }
}
