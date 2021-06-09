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
    @IBOutlet weak var cryptoSymboleLabel: UILabel!
    let cryptoViewModel = CryptoViewModel()
    
    var cryptoNameText : String?
    var cryptoValueText : String?
    var cryptoSymboleText : String?
    var CryptovolumeText: String?
    var cryptoLogoImageUrl: String?
    var valueLabelTextDouble: Double?
    
    
    @IBAction func convertButton(_ sender: UIButton) {
     
        if let argent = Double(userInputTextField.text!) {
            let result = cryptoViewModel.conversionEuroToCrypto(euro: argent, cryptoValue: valueLabelTextDouble!)
            cryptoMoneyLabel.text = String(result)
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        cryptoNameLabel.text = cryptoNameText
        cryptoValueLabel.text = cryptoValueText
        cryptoSymbolLabel.text = "(\(cryptoSymboleText!))"
        cryptoVolume24hLabel.text = CryptovolumeText
        cryptoSymboleLabel.text = cryptoSymboleText
            //à refair
        let urlo = URL(string: "https://www.cryptocompare.com/" + cryptoLogoImageUrl!)
        cryptoLogoImage?.load(url: urlo!)
              
    }
    
}
