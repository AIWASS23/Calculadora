//
//  ContentView.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo on 16/01/2023
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    @StateObject private var currentRate = CurrentRateViewModel()
    
    var body: some View {
        NavigationView {
            CalculatorView()
                .statusBar(hidden: true)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .onAppear() {
                    UIScreen.setRotationDevice(to: .portrait)
                    self.currentRate.loadData()
                }
                .environmentObject(viewModel)
                .environmentObject(currentRate)
        }
    }
}
