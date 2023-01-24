//
//  Infomation.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 31/10/2022
//

import SwiftUI
import Neumorphic

struct Infomation: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(spacing: 20) {
                self.header
                
                VStack(spacing: 20) {
                    InfoItem(urlString: .constant("https://github.githubassets.com/favicons/favicon-dark.png"),
                             title: "Marcelo De Araújo",
                             destination: AnyView(Introduction()))
                    
                    Divider()
                    
                    InfoItem(urlString: .constant("https://github.githubassets.com/favicons/favicon-dark.png"),
                             title: "GitHub",
                             destination: AnyView(WebViewDisplay()))
                }
                
                Spacer()
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            self.footer, alignment: .bottom
        )
        .background(Color.defaultMainColor.ignoresSafeArea())
        .ignoresSafeArea()
    }
    
    private var header: some View {
        VStack {
            
            Spacer()
            
            Image("logo-icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(20)
                .padding(.top, 50)
            
            Spacer()
            
            VStack(spacing: 0) {
                Text("\(AppDelegate.displayName)")
                    .font(.custom("AltoneTrial-BoldOblique", size: 26))
                    .foregroundColor(.white)
                
                Text("Powered by Maytech & The Code-Love Team")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.bottom, 10)
        }
        .frame(width: UIScreen.screenWidth, height: 300, alignment: .center)
        .background {
            Color.LinearGradientBackgroundInfo
        }
    }
    
    private var footer: some View {
        HStack(alignment: .center, spacing: 5) {
            Group {
                Text("Copyright")
                
                Image(systemName: "c.circle")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14, height: 14)
                
                Text("2023 ")
                
                Text("Maytech")
                    .fontWeight(.bold)
                    .foregroundColor(Color.OviLight)
            }
            .foregroundColor(.black)
        }
        .padding(.bottom, 10 + (UIScreen.edges?.bottom ?? 0))
    }
}
