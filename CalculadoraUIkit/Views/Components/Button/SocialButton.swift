//
//  SocialButton.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 13/11/2022
//

import SwiftUI

struct SocialButton: View {
    let imageUrlString: String
    let openLink: String
    
    var body: some View {
        Button(action: {
            UIApplication.shared.open(Utilities.openUrl(openLink))
        }) {
            AsyncImageView(urlString: .constant(imageUrlString), resizingMode: .aspectFit)
                .frame(width: 32, height: 32)
                .cornerRadius(6)
        }
    }
}
