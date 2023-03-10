//
//  HeaderWorkingWindows.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 14/01/2023
//

import SwiftUI
import Neumorphic

struct HeaderWorkingWindows: View {
    @EnvironmentObject private var viewModel: CalculatorViewModel
//    @StateObject private var viewModel = CalculatorViewModel()
    
    var workingShow: some View {
        Button(action: {
            UIScreen.showAlert(title: TextDictionary.Description, msg: self.viewModel.alertSpellOut, button: TextDictionary.OK)
        }) {
            Text("\(viewModel.displayText)")
                .font(.custom("digital-7mono", size: 80))
                .foregroundColor(Color.black)
                .lineLimit(1)
                .minimumScaleFactor(0.3)
                .truncationMode(.head)
        }
    }
    
    @ViewBuilder var displayStateOn: some View {
        if viewModel.stateOn == .gt {
            Text("GT".uppercased())
                .font(.custom("AltoneTrial-BoldOblique", size: 16))
                .foregroundColor(.black)
        }
    }
    
    var body: some View {
        let width: CGFloat = UIScreen.screenWidth
        let height: CGFloat = UIScreen.getPer(0.25)
        let radius: CGFloat = UIScreen.getUnit(8)
        
        Image("background_calculator")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: width, maxHeight: height)
            .clipShape(RoundedRectangle(cornerRadius: radius))
            .background(
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color.Neumorphic.main)
                    .frame(maxWidth: width, maxHeight: height)
                    .softOuterShadow()
            )
            .overlay(
                self.workingShow
                    .padding(.horizontal, UIScreen.getUnit(10))
                    .padding(.vertical, UIScreen.getUnit(5))
                    .padding(.top, UIScreen.getUnit(10)), alignment: .bottomTrailing
            )
            .overlay(
                self.displayStateOn
                    .padding(UIScreen.getUnit(8)), alignment: .topLeading
            )
            .padding(.horizontal, UIScreen.getUnit(10))
    }
}
