//
//  ListViewSelectionRate.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 17/10/2022
//

import SwiftUI
import Neumorphic

struct ListViewSelectionRate: View {
    
    let data: [Currency]
    
    @Binding var itemSelected: Currency
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.Neumorphic.main.ignoresSafeArea()
            
            VStack(spacing: UIScreen.getUnit(10)) {
                Text(TextDictionary.ListOfExchangeRates)
                    .font(.bold(size: 16))
                    .foregroundColor(.primary)
                    .padding(UIScreen.getUnit(20))
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: UIScreen.getUnit(10)) {
                        ForEach(self.data) { item in
                            VStack(spacing: UIScreen.getUnit(5)) {
                                ItemSelectionRate(item: item, itemSelected: $itemSelected, isPresented: $isPresented)
                                
                                Divider()
                            }
                        }
                    }
                    .padding(.vertical, UIScreen.getUnit(20))
                }
            }
        }
        .overlay(
            Button(action: {
                self.isPresented.toggle()
            }) {
                Image("cancel")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.GrayLight)
                    .frame(width: UIScreen.getUnit(14), height: UIScreen.getUnit(14))
            }
                .padding(UIScreen.getUnit(15))
            , alignment: .topTrailing
        )
    }
    
}
