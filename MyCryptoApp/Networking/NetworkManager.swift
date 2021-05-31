//
//  NetworkManager.swift
//  MyCryptoApp
//
//  Created by Kahina Lounis on 31/05/2021.
//

import Foundation
import Alamofire

protocol NetworkManager {
    
    var session: Session { get }
    func performApi<T: Decodable>(
        URL: URL?,
        method: HTTPMethod,
        parameters: Parameters?,
        encoding: ParameterEncoding,
        customHeader: HTTPHeaders?,
        completion: @escaping (Result<T, AFError>) -> Void
    )

}


/// Netwok manager that can perform network requests with a session
class NetworkManagerImpl: NetworkManager {
    var session: Session

    // Init session used by all NetworkManager requests
    init(session: Session? = nil) {
        if let session = session {
            self.session = session
        } else {
            // Config for the network session
            let urlconfig = URLSessionConfiguration.af.default
            urlconfig.timeoutIntervalForRequest = TimeInterval(AppConsts.customTimeoutIntervalForRequest)
            urlconfig.timeoutIntervalForResource = TimeInterval(AppConsts.customTimeoutIntervalForResource)

            // Only for testing
            // urlconfig.urlCache?.removeAllCachedResponses()

            // Logger for debugging
            let myNetworkLogger = CustomNetworkLogger()
            // Request interceptor to add parameters and retry
            let myInterceptor = CustomRequestInterceptor()

            // Shared session with all requests
            let session = Session(configuration: urlconfig, interceptor: myInterceptor, eventMonitors: [myNetworkLogger])
            self.session = session
        }
    }

    /// perform a network request to the API with a given url and executes a completion with the data
    /// - Parameters:
    ///   - url: the url of the request
    ///   - completion: the completion to execute once the data is retrieved
    func performApi<T: Decodable>(
        URL: URL?,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.httpBody,
        customHeader: HTTPHeaders? = nil,
        completion: @escaping (Result<T, AFError>) -> Void
    ) {
        guard let URL = URL else {
            completion(.failure(.invalidURL(url: "https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=EUR")))
            return
        }

        // Create a default header
        var headers: HTTPHeaders = [:]


        // Perfom request
        // Check status code
        // Decode reponse to a specific object
        session.request(URL, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let success):
                    completion(.success(success))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
}
