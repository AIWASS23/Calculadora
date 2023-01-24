//
//  ExchangeRate.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 05/10/2022
//

import Foundation

public class ExchangeRateAdaptor : BaseAdaptor {
    
    public func getCurrencies() {
        let urlString = Config.apiUrl + "Currencies"
        self.requestAPI(urlString: urlString, method: .GET, type: BaseAdaptorType.GetList as AnyObject)
    }
    
}
