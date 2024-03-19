//
//  HomeView.swift
//  RestartApp
//
//  Created by Vinicius Wessner on 15/03/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") private var OnboardingViewActive = false
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack {
            // MARK:  Header
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image(.character2)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        .easeInOut(duration: 4)
                        .repeatForever(),
                        value: isAnimating)
            }
            
            // MARK:  Center
            
            Text("The time that leads to mastry is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK:  Footer
            Spacer()
            Button(action: {
                withAnimation{
                    OnboardingViewActive = true
                    playSound(sound: "success", type: "m4a")
                }
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            })
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.extraLarge)
        } //: vstack
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                isAnimating = true
                
            })
        })
    }
}


#Preview {
        HomeView()
}
