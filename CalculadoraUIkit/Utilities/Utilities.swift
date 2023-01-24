//
//  Utilities.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 05/10/2022
//

import Foundation

public class Utilities {
    public static func getJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.defaultFormat())
        return decoder
    }
    
    public static func getJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(DateFormatter.defaultFormat())
        encoder.outputFormatting = .withoutEscapingSlashes
        return encoder
    }
    
    public static func openUrl(_ link: String) -> URL {
        let openUrl = link.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return URL(string: openUrl!)!
    }
}
