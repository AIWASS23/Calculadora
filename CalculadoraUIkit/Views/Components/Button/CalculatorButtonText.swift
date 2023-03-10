//
//  CalculatorButton.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 16/09/2022
//

import SwiftUI
import Neumorphic

struct CalculatorButtonText: View {
    
    let buttonType: ButtonType
//    @StateObject private var viewModel = CalculatorViewModel()
    @EnvironmentObject private var viewModel: CalculatorViewModel
    
    var body: some View {
        Button(action: {
            viewModel.performAction(for: buttonType)
        }) {
            Text(buttonType.description)
                .font(.system(size: UIScreen.getUnit(28), weight: .medium))
                .foregroundColor(getForegroundColor())
        }
        .buttonStyle(
            CalculatorButtonStyle(
                size: getButtonSize(),
                backgroundColor: getBackgroundColor(),
                foregroundColor: getForegroundColor())
        )
    }
    
    // MARK: - HELPERS
    
    private func getButtonSize() -> CGSize {
        let spacingCount: CGFloat = 5 // Button count + space
        let result = (UIScreen.screenWidth - (spacingCount * Constants.padding)) / 4 // 4 Button count
        let height: CGFloat = result / 1.5
        return .init(width: result, height: height)
    }
    
    private func getBackgroundColor() -> Color {
        return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.foregroundColor : buttonType.backgroundColor
    }
    
    private func getForegroundColor() -> Color {
        return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.backgroundColor : buttonType.foregroundColor
    }
}
