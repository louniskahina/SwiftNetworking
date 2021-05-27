//
//  DetailsViewController.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 26/05/2021.
//
import  UIKit
import Foundation

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var cryptoNameLabel: UILabel!
    
    @IBOutlet weak var cryptoValueLabel: UILabel!
    
    @IBOutlet weak var cryptoSymbolLabel: UILabel!

    @IBOutlet weak var cryptoLogoImage: UIImageView!
    
    @IBOutlet weak var cryptoVolume24hLabel: UILabel!
    
    @IBOutlet weak var userInputTextField: UITextField!
    
    @IBOutlet weak var cryptoMoneyLabel: UILabel!
    
    var cryptoNameText : String?
    var cryptoValueText : String?
    var cryptoSymboleText : String?
    var CryptovolumeText: String?
    var cryptoLogoImageUrl: String?
    
    
    @IBAction func convertButton(_ sender: UIButton) {
        
        let argent =  Double(userInputTextField.text!)
        let price = Double(cryptoValueText!)
        let cryptomoney = argent!/price!
        cryptoMoneyLabel.text = String(cryptomoney)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cryptoNameLabel.text = cryptoNameText
        cryptoValueLabel.text = cryptoValueText
        cryptoSymbolLabel.text = cryptoSymboleText
        cryptoVolume24hLabel.text = CryptovolumeText
        
        let urlo = URL(string: "https://www.cryptocompare.com/" + cryptoLogoImageUrl!)
        cryptoLogoImage?.load(url: urlo!)
              
    }
    
}
