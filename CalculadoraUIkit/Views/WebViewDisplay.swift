//
//  WebViewDisplay.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 31/10/2022
//

import SwiftUI

struct WebViewDisplay: View {
    var body: some View {
        WebView(urlString: .constant("https://github.com/AIWASS23"))
            .ignoresSafeArea()
    }
}
