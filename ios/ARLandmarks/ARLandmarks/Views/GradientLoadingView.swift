//
//  GradientLoadingView.swift
//  ARLandmarks
//
//  Created on 13.02.2026.
//

import SwiftUI

// MARK: - Gradient Spinner

struct GradientSpinner: View {
    @State private var rotation: Double = 0
    var size: CGFloat = 40
    var lineWidth: CGFloat = 4

    var body: some View {
        Circle()
            .trim(from: 0.05, to: 0.85)
            .stroke(
                AngularGradient(
                    gradient: Gradient(colors: [
                        .cyan.opacity(0.1),
                        .cyan,
                        .blue
                    ]),
                    center: .center,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360)
                ),
                style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
            )
            .frame(width: size, height: size)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(
                    .linear(duration: 1.0)
                    .repeatForever(autoreverses: false)
                ) {
                    rotation = 360
                }
            }
    }
}

// MARK: - Full-Screen Loading View

struct GradientLoadingView: View {
    @State private var pulseScale: CGFloat = 0.95
    @State private var pulseOpacity: Double = 0.6

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [.blue.opacity(0.3), .cyan.opacity(0.15)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 2
                )
                .frame(width: 80, height: 80)
                .scaleEffect(pulseScale)
                .opacity(pulseOpacity)

            Circle()
                .fill(
                    LinearGradient(
                        colors: [.blue.opacity(0.08), .cyan.opacity(0.04)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 64, height: 64)

            GradientSpinner(size: 48, lineWidth: 4)
        }
        .onAppear {
            withAnimation(
                .easeInOut(duration: 1.5)
                .repeatForever(autoreverses: true)
            ) {
                pulseScale = 1.1
                pulseOpacity = 0.2
            }
        }
    }
}

// MARK: - Inline Image Loading Placeholder

struct GradientImagePlaceholder: View {
    let height: CGFloat
    let width: CGFloat?
    let cornerRadius: CGFloat
    @State private var shimmerOffset: CGFloat = -1

    init(height: CGFloat, width: CGFloat? = nil, cornerRadius: CGFloat = 0) {
        self.height = height
        self.width = width
        self.cornerRadius = cornerRadius
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.blue.opacity(0.06),
                            Color.cyan.opacity(0.04)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(
                    LinearGradient(
                        colors: [
                            .clear,
                            Color.white.opacity(0.15),
                            .clear
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .offset(x: shimmerOffset * 200)

            GradientSpinner(size: 28, lineWidth: 3)
        }
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .onAppear {
            withAnimation(
                .easeInOut(duration: 1.8)
                .repeatForever(autoreverses: false)
            ) {
                shimmerOffset = 1
            }
        }
    }
}

#Preview("Spinner") {
    GradientSpinner()
}

#Preview("Full Loading") {
    GradientLoadingView()
}

#Preview("Image Placeholder") {
    GradientImagePlaceholder(height: 200, cornerRadius: 16)
        .padding()
}