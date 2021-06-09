//
//  ErrorExtension.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 31/05/2021.
//

import Foundation
import UIKit
import Alamofire
/*
extension UIViewController {
    func handleError(error: ErrorEnum, callback: (() -> Void)? = nil) {
        switch error {
        case .requestError(let error, _):
            if let responseCode = error.responseCode {
                var title, body: String?

                _ = "Message: \(error.errorDescription ?? "unknown")"
                _ = "Code: \(error.responseCode ?? -1)"

                switch responseCode {
                case 403:
                    print("403 error")
                default:
                    title = "request error"
                    body = "error in your request"
                }
                showAlertError(title: title!, body: body!, callback: callback)
            } else if (error.isSessionTaskError) {
                showAlertError(
                    title: "probleme de connexion",
                    body: "verifiez que vous êtes bien connectés à internet",
                    callback: callback
                )
            } else {
                showAlertError(
                    title: "unknown Error Title",
                    body: "inknown Error",
                    callback: callback
                )
            }
        
        case .other(let error):
            showAlertError(
                title: "R.string.localizable.unknownErrorTitle()",
                body: error.localizedDescription
            )
        default:
            showAlertError(
                title: "erreur",
                body: "erreur"
            )
        }
    }
}
*/
