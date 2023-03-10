//
//  Config.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 05/10/2022
//

import Foundation

public class Config {
    static let apiUrl = "https://calcapi.maytech.app/api/"
    
    static let noImage = "https://media.thietthach.maytech.vn/images/no-img.jpg"
    
    static var getApiUrl: String {
        get {
            return self.apiUrl
        }
    }
    
    static func getRequestAPI(urlString: String, method: EHttpMethod) throws -> URLRequest {
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.rawValue
            urlRequest.setValue("IOS", forHTTPHeaderField: "Device")
            urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            return urlRequest
        } else {
            throw RequestApiError.failedToGetRequestApi
        }
    }
}
