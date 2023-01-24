//
//  TextDictionary.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo 18/10/2022
//

import Foundation

public class TextDictionary: Codable {
    
    public static var subTitleInfo: String = "By https://calcapi.maytech.app/api/"
    public static func serviceDescription(iconName: String) -> String {
        return "Copyright \(iconName) " + "2023 Marcelo".uppercased()
    }
    public static var Description = "Detalhes"
    public static var OK = "OK"
    public static var SpaceDivider = " --- "
    public static var ExchangeRate = "Conversão da taxa de câmbio"
    public static var ListOfExchangeRates = "Lista de taxas de câmbio"
    public static var LastResult = "Resultados anteriores"
    public static var CalculatorErrorMessage = "Não consigo fazer este cálculo"
    
}
