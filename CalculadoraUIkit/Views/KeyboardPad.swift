//
//  KeyboardPad.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 14/01/2023
//

import SwiftUI
import Neumorphic

struct KeyboardPad: View {
    @EnvironmentObject private var viewModel: CalculatorViewModel
//    @StateObject private var viewModel = CalculatorViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack(spacing: Constants.padding) {
            HStack {
                self.totalAllButton
                
                Spacer()
                
                self.roleBackButton
            }
            
            ForEach(viewModel.buttonTypes, id: \.self) { row in
                HStack(spacing: Constants.padding) {
                    ForEach(row, id: \.self) { buttonType in
                        switch buttonType {
                        case .clear, .allClear, .percent, .equals, .negative, .operation(.addition), .operation(.subtraction), .operation(.multiplication), .operation(.division):
                            CalculatorButtonImage(buttonType: buttonType)
                        default:
                            CalculatorButtonText(buttonType: buttonType)
                        }
                    }
                }
            }
        }
    }
    
    var totalAllButton: some View {
        Button(action: {
            self.viewModel.gtAction()
        }) {
            Circle()
                .fill(Color.Neumorphic.main)
                .frame(width: UIScreen.getUnit(30), height: UIScreen.getUnit(30))
                .softOuterShadow()
                .overlay(
                    Text("GT")
                        .font(.bold(size: 16))
                        .foregroundColor(.primary)
                )
        }
        .padding(.horizontal, UIScreen.getUnit(20))
        .opacity(self.viewModel.getAllResult.isEmpty ? 0 : 1)
        .animation(.spring().speed(2), value: self.viewModel.getAllResult.isEmpty)
    }
    
    var roleBackButton: some View {
        Button(action: {
            self.viewModel.backRemove()
        }) {
            Image("icon-delete")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.OgranLight)
                .frame(width: UIScreen.getUnit(30), height: UIScreen.getUnit(30))
                .softOuterShadow()
            
        }
        .padding(.horizontal, UIScreen.getUnit(20))
    }
}
