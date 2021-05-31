//
//  CustomNetworkLogger.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 31/05/2021.
//

import Foundation
import Alamofire
/// Class used as a monitor for network events
class CustomNetworkLogger: EventMonitor {
    // A custom DispatchQueue which dispatches all events
    let queue = DispatchQueue(label: "cryptoApp.networklogger")

    /// Call when the request is finished
    /// Print the description when the request is finished
    /// - Parameter request: The request
    func requestDidFinish(_ request: Request) {
        print(request.description)
    }

    /// Called when the response is received
    /// Render the response as JSON and print it to the console
    /// - Parameter request: The request
    /// - Parameter response: The response
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        guard let data = response.data else {
            return
        }

        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
            print(json)
        }
    }
}
