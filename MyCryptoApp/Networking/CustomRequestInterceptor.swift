//
//  CustomRequestInterceptor.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 31/05/2021.
//

import Foundation
import Alamofire

/// Class used to intercept every request
/// adapt() -> add parameters
/// retry() -> retry the request if we have an error
class CustomRequestInterceptor : RequestInterceptor {
    // Number of trials
    let retryLimit = AppConsts.customRetryLimit
    // TimeInterval for a trial
    let retryDelay: TimeInterval = TimeInterval(AppConsts.customRetryDelay)

    /// Called before every request
    /// Used to add options/parameters to the request
    /// - Parameter urlRequest: The request url
    /// - Parameter session: The custom session
    /// - Parameter completion: A callback with a Result object containing either the urlRequest or the error
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        completion(.success(urlRequest))
    }

    /// Called when a request fails
    /// Used to retry the failed request
    /// - Parameter request: The request
    /// - Parameter session: The custom session
    /// - Parameter error: The reason why the request failed
    /// - Parameter completion: A callback with a Result object containing the RetryResult. It's an object used to know if we have to retry again or not.
    open func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        // let response = request.task?.response as? HTTPURLResponse

        // Retry request
        if request.retryCount < retryLimit {
            print("Retry with delay \(retryDelay)")
            completion(.retryWithDelay(retryDelay))
        } else {
            print("Don't retry")
            completion(.doNotRetry)
        }
    }
}
