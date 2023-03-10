//
//  BaseAdaptor.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 05/10/2022
//

import SwiftUI
import UIKit

public enum RequestApiError: Error {
    case missingUrl
    case statusCodeError
    case failedToRequestApi
    case failedToGetRequestApi
    case failedToGetData
    case failedToGetHTTPURLResponse
}

enum BaseAdaptorType: Int8, Codable {
    case Create = 0
    case Update = 1
    case Delete = 2
    case GetList = 3
    case GetObject = 4
}

public class BaseAdaptor {
    
    public init(onSucceed: @escaping (AnyObject, Int, AnyObject) -> Void) {
        BaseAdaptor.onSucceed = onSucceed
    }
    
    public init(onSucceed: @escaping (AnyObject, Int, AnyObject) -> Void, dataDidFailed: @escaping (RequestApiError, String?) -> Void) {
        BaseAdaptor.onSucceed = onSucceed
        BaseAdaptor.dataDidFailed = dataDidFailed
    }
    
    static var onSucceed: ((_ data: AnyObject,_ statusCode: Int ,_ type: AnyObject) -> Void)?
    
    static var dataDidFailed: ((_ requestError: RequestApiError, _ message: String?) -> Void)?
        
    public func requestAPI(urlString: String, method: EHttpMethod, type: AnyObject, dataRequest: Data? = nil)
    {
        do {
            var urlRequest = try Config.getRequestAPI(urlString: urlString, method: method)
            
            if (dataRequest != nil) {
                urlRequest.httpBody = dataRequest
            }
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    print("Service result: \(error.localizedDescription)")
                    BaseAdaptor.dataDidFailed?(.failedToRequestApi, error.localizedDescription)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    print("Service result: Failed to get HTTPURLResponse")
                    BaseAdaptor.dataDidFailed?(.failedToGetHTTPURLResponse, "Failed to get HTTPURLResponse")
                    return
                }
                
                if !(200...299).contains(response.statusCode) {
                    print("Service result: \(response.statusCode.description)")
                    BaseAdaptor.dataDidFailed?(.statusCodeError, "Status code: \(response.statusCode.description)")
                    return
                }
                
                guard let data = data else {
                    print("Service result: Failed to get data response")
                    BaseAdaptor.dataDidFailed?(.failedToGetData, "Failed to get data response")
                    return
                }
                
                DispatchQueue.main.async {
                    BaseAdaptor.onSucceed?(data as AnyObject, response.statusCode, type)
                }
            }
            dataTask.resume()
            
        } catch let err {
            print("Service result: \(err.localizedDescription)")
            BaseAdaptor.dataDidFailed?(.failedToGetRequestApi, "\(err.localizedDescription)")
            return
        }
    }
}
