//
//  FuncMoreButtonStyle.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo 25/10/2022
//

import SwiftUI
import Neumorphic

struct FuncMoreButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) private var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: UIScreen.getUnit(8)) {
            configuration.label
                .font(.custom("AltoneTrial-BoldOblique", size: UIScreen.getUnit(16)))
                .foregroundColor(.primary)
                .fixedSize(horizontal: true, vertical: false)
                .lineLimit(1)
            
            Image("icon-drop_down")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.primary)
                .frame(width: UIScreen.getUnit(8), height: UIScreen.getUnit(8))
        }
        .padding(.horizontal, UIScreen.getUnit(10))
        .padding(.vertical, UIScreen.getUnit(8))
        .background(
            RoundedRectangle(cornerRadius: UIScreen.getUnit(8))
                .fill(Color.Neumorphic.main)
                .softOuterShadow()
        )
    }
}
