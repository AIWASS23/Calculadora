//
//  Introductuion.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 31/10/2022
//

import SwiftUI

struct Introduction: View {
        
    var body: some View {
        WebView(urlString: .constant("https://figma.com/@marcelodearaujo"))
            .ignoresSafeArea()
    }
}
