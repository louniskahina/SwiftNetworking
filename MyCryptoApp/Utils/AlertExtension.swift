//
//  AlertExtension.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 31/05/2021.
//


import Foundation
import UIKit
import Alamofire

extension UIViewController {
    func showAlertError(title: String, body: String, callback: (() -> Void)? = nil) {
        // Alert creation
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            print("Alert")
        }))

        // Show alert
        present(alert, animated: true, completion: callback)
    }
}
