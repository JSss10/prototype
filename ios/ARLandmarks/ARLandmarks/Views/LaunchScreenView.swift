//
//  LaunchScreenView.swift
//  ARLandmarks
//
//  Created by Jessica Schneiter on 13.02.2026.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var contentOpacity: Double = 0
    @State private var contentScale: Double = 0.7
    @State private var subtitleOpacity: Double = 0

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue, .cyan],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 32) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.white.opacity(0.15), Color.white.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 200, height: 200)

                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.white.opacity(0.25), Color.white.opacity(0.15)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 160, height: 160)

                    Image(systemName: "building.columns.fill")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 32)
            .opacity(contentOpacity)
            .scaleEffect(contentScale)
        }
        .onAppear {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.6).delay(0.2)) {
                contentOpacity = 1.0
                contentScale = 1.0
            }

            withAnimation(.easeOut(duration: 0.5).delay(0.8)) {
                subtitleOpacity = 1.0
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}