//
//  ContentView.swift
//  ARLandmarks
//
//  Created by Jessica Schneiter on 17.01.2026.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var showLaunchScreen = true

    var body: some View {
        ZStack {
            Group {
                if hasCompletedOnboarding {
                    OverviewView()
                } else {
                    OnboardingView()
                }
            }
            .opacity(showLaunchScreen ? 0 : 1)

            if showLaunchScreen {
                LaunchScreenView()
                    .transition(.opacity)
                    .zIndex(1)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation(.easeOut(duration: 0.5)) {
                    showLaunchScreen = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}