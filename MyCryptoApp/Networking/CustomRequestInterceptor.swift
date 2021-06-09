//
//  CustomRequestInterceptor.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 31/05/2021.
//
/*
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
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        completion(.success(urlRequest))
    }

    /// Called when a request fails
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
*/
