//
//  Webview.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 31/10/2022
//

import SwiftUI
import WebKit

struct WebView: View {
    @Binding var urlString: String
    
    @State private var showLoading: Bool = false
    
    var body: some View {
        WebViewRepresentable(urlString: $urlString, showLoading: $showLoading)
            .overlay(
                showLoading ? AnyView(
                    ProgressView(label: {
                        Text("Loading..")
                            .foregroundColor(.black)
                    }).tint(.black)) : AnyView(EmptyView())
            )
    }
}
