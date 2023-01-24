//
//  InfoItem.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 31/10/2022
//

import SwiftUI
import Neumorphic

struct InfoItem: View {
    @Binding var urlString: String
    var title: String
    var destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                AsyncImageView(urlString: .constant(urlString), resizingMode: .aspectFit)
                    .clipShape(Circle())
                    .frame(width: 56, height: 56)
                
                Text(title)
                    .font(.regular(size: 18))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "chevron.up")
                        .foregroundColor(.black)
                        .rotationEffect(Angle(degrees: 90))
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
        }
        
    }
}
