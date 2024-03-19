//
//  ContentView.swift
//  RestartApp
//
//  Created by Vinicius Wessner on 13/03/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") private var OnboardingViewActive = true

    var body: some View {
        if OnboardingViewActive {
            OnBoardingView()
        } else {
            HomeView()
        }
    }
}

#Preview {
    ContentView()
}
