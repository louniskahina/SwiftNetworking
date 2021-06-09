//
//  CustomNetworkLogger.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 31/05/2021.
//
/*
import Foundation
import Alamofire

/// Class used as a monitor for network events
class CustomNetworkLogger: EventMonitor {
    // A custom DispatchQueue which dispatches all events
    let queue = DispatchQueue(label: "cryptoApp.networklogger")


    func requestDidFinish(_ request: Request) {
        print(request.description)
    }

    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        guard let data = response.data else {
            return
        }

        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
            print(json)
        }
    }
}
*/
