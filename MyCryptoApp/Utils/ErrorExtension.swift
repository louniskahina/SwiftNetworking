//
//  ErrorExtension.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 31/05/2021.
//

import Foundation
import UIKit
import Alamofire

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
                    title = "R.string.localizable.errorUnknownRequestTitle()"
                    body = "R.string.localizable.errorUnknownRequestBody(errorCode, errorMessage)"
                }

                showAlertError(title: title!, body: body!, callback: callback)
            } else if (error.isSessionTaskError) {
                showAlertError(
                    title: "R.string.localizable.errorNetworkTitle()",
                    body: "R.string.localizable.errorNetworkBody()",
                    callback: callback
                )
            } else {
                showAlertError(
                    title: "R.string.localizable.unknownErrorTitle()",
                    body: "R.string.localizable.unknownErrorBody()",
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
                title: "R.string.localizable.unknownErrorTitle()",
                body: "R.string.localizable.unknownErrorBody()"
            )
        }
    }
}
