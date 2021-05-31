//
//  ErrorEnum.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 31/05/2021.
//

import Foundation
import Alamofire

/// List of all possible errors
enum ErrorEnum: Error {
    
    case noCryptos

    /// When there is an error with the request itself
    /// - Parameter AFError : The Alamofire with an errorCode and an errorMessahe
    /// - Parameter Any : The type of the object, used to create precise errors
    case requestError(AFError, Any?)

    /// Error due to the network like no internet connection
    case networkError

    /// Other errors
    /// - Parameter Error : The Error object
    case other(Error)

    /// Map the error into an ErrorEnum if it is possible
    /// - Parameter :  The error to map
    // TODO : Change to replace switch rqError.0 : ErrorEnum, AFError, default
    static func map(_ error: Error) -> ErrorEnum {
        return (error as? ErrorEnum) ?? .other(error)
    }
}
