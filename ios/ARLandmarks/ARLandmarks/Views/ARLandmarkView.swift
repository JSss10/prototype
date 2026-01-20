//
//  ARLandmarkView.swift
//  ARLandmarks
//
//  Created by Jessica Schneiter on 17.01.2026.
//

import SwiftUI
import ARKit

struct ARLandmarkView: View {
    let landmarks: [Landmark]
    @StateObject private var modeManager = ARModeManager()
    @State private var selectedLandmark: Landmark?
    @State private var showingDetail = false
    @State private var landmarkPhotos: [LandmarkPhoto] = []
    @State private var isLoadingPhotos = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            ARViewContainer(
                landmarks: landmarks,
                selectedLandmark: $selectedLandmark,
                modeManager: modeManager
            )
            .ignoresSafeArea()
            
            VStack {
                topBar
                
                Spacer()
                
                if let landmark = selectedLandmark ?? modeManager.recognizedLandmark {
                    landmarkInfoCard(landmark)
                        .task(id: landmark.id) {
                            await loadPhotos(for: landmark)
                        }
                }
                
                modeSwitcher
            }
            .padding()
        }
        .onAppear {
            modeManager.startSession()
            modeManager.updateNearbyLandmarks(allLandmarks: landmarks)
        }
        .onDisappear {
            modeManager.stopSession()
        }
        .sheet(isPresented: $showingDetail) {
            if let landmark = selectedLandmark {
                LandmarkDetailSheet(
                    landmark: landmark,
                    weather: modeManager.weather
                )
            }
        }
    }
    
    // MARK: - Computed Properties
    
    private var displayedLandmarks: [Landmark] {
        switch modeManager.currentMode {
        case .visualRecognition:
            if let recognized = modeManager.recognizedLandmark {
                return [recognized]
            }
            return []
        case .geoBased:
            return modeManager.nearbyLandmarks
        }
    }
    
    // MARK: - View Components
    
    private var topBar: some View {
        HStack {
            HStack(spacing: 8) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                    .foregroundStyle(.white)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
                        
            Spacer()
                        
            HStack(spacing: 4) {
                Image(systemName: "mappin.and.ellipse")
                Text("\(landmarks.count) Landmarks")
            }
            .font(.subheadline)
            .fontWeight(.medium)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
                        
            if let weather = modeManager.weather {
                HStack(spacing: 4) {
                Text(weather.iconEmoji)
                Text(weather.temperatureFormatted)
                    .font(.subheadline)
                    .fontWeight(.medium)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
        }
    }
    
    private func landmarkInfoCard(_ landmark: Landmark) -> some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(landmark.name)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.primary)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showingDetail = true
                    }

                    HStack(spacing: 12) {
                        Button {
                            openDirections(to: landmark)
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                                    .font(.system(size: 24))
                                Text("Directions")
                                    .font(.system(size: 12, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        }

                        if landmark.phone != nil {
                            Button {
                                if let phone = landmark.phone {
                                    callPhone(phone)
                                }
                            } label: {
                                VStack(spacing: 4) {
                                    Image(systemName: "phone.circle.fill")
                                        .font(.system(size: 24))
                                    Text("Call")
                                        .font(.system(size: 12, weight: .medium))
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color(uiColor: .secondarySystemFill))
                                .foregroundColor(.blue)
                                .cornerRadius(12)
                            }
                        }

                        if landmark.websiteUrl != nil {
                            Button {
                                if let urlString = landmark.websiteUrl,
                                   let url = URL(string: urlString) {
                                    openWebsite(url)
                                }
                            } label: {
                                VStack(spacing: 4) {
                                    Image(systemName: "safari.fill")
                                        .font(.system(size: 24))
                                    Text("Website")
                                        .font(.system(size: 12, weight: .medium))
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color(uiColor: .secondarySystemFill))
                                .foregroundColor(.blue)
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 24)
   
                    if !landmarkPhotos.isEmpty {
                        photoCarousel()
                            .padding(.bottom, 16)
                            .onTapGesture {
                                showingDetail = true
                            }
                    }
                }
            }
            .padding(.horizontal, 8)
        }
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: -5)
    }

    private func photoCarousel() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(landmarkPhotos) { photo in
                    AsyncImage(url: URL(string: photo.photoUrl)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 280, height: 180)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 280, height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        case .failure:
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.15))
                                    .frame(width: 280, height: 180)
                                Image(systemName: "photo")
                                    .font(.system(size: 40))
                                    .foregroundColor(.secondary)
                            }
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }

    private func openDirections(to landmark: Landmark) {
        let coordinate = "\(landmark.latitude),\(landmark.longitude)"
        if let url = URL(string: "maps://?daddr=\(coordinate)&dirflg=w") {
            UIApplication.shared.open(url)
        }
    }

    private func callPhone(_ phone: String) {
        if let url = URL(string: "tel://\(phone.filter { $0.isNumber })") {
            UIApplication.shared.open(url)
        }
    }

    private func openWebsite(_ url: URL) {
        UIApplication.shared.open(url)
    }
    
    private var modeSwitcher: some View {
            HStack(spacing: 12) {
                ForEach(ARModeManager.ARMode.allCases, id: \.self) { mode in
                    Button {
                        withAnimation {
                            if mode == .visualRecognition {
                                modeManager.switchToVisualMode()
                            } else {
                                modeManager.switchToGeoMode()
                            }
                        }
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: mode.icon)
                            if modeManager.currentMode == mode {
                                Text(mode.rawValue)
                                    .font(.caption)
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 10)
                        .background(modeManager.currentMode == mode ? Color.blue : Color.clear)
                        .foregroundColor(modeManager.currentMode == mode ? .white : .primary)
                        .cornerRadius(20)
                    }
                }
            }
            .padding(4)
            .background(.ultraThinMaterial)
            .cornerRadius(24)
        }
    
    // MARK: - Helpers
    
    private func formatDistance(_ meters: Double) -> String {
        if meters < 1000 {
            return "\(Int(meters)) m"
        } else {
            return String(format: "%.1f km", meters / 1000)
        }
    }

    private func loadPhotos(for landmark: Landmark) async {
        guard !isLoadingPhotos else { return }
        isLoadingPhotos = true
        do {
            landmarkPhotos = try await SupabaseService.shared.fetchLandmarkPhotos(landmarkId: landmark.id)
        } catch {
            print("Failed to load photos: \(error)")
            landmarkPhotos = []
        }
        isLoadingPhotos = false
    }
}

// MARK: - Landmark Detail Sheet

struct LandmarkDetailSheet: View {
    let landmark: Landmark
    let weather: Weather?
    @State private var photos: [LandmarkPhoto] = []
    @State private var isLoadingPhotos = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    if !photos.isEmpty {
                        photoGallery
                            .padding(.bottom, 24)
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(landmark.name)
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.primary)

                            HStack(spacing: 8) {
                                if let category = landmark.category {
                                    HStack(spacing: 4) {
                                        Text(category.icon ?? "📍")
                                            .font(.system(size: 14))
                                        Text(category.name)
                                            .font(.system(size: 16))
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 28)

                        if hasContactInfo {
                            actionButtonsSection
                                .padding(.bottom, 32)
                        }

                        if let description = landmark.description {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("About")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(.primary)

                                Text(description)
                                    .font(.system(size: 16))
                                    .foregroundColor(.primary)
                                    .lineSpacing(5)
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 32)
                        }

                        if let hours = landmark.openingHours {
                            openingHoursSection(hours: hours)
                                .padding(.bottom, 32)
                        }

                        locationDetailsSection
                            .padding(.bottom, 32)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .presentationDragIndicator(.visible)
        .task {
            await loadPhotos()
        }
    }

    private var actionButtonsSection: some View {
        VStack(spacing: 12) {
            if let phone = landmark.phone {
                Button {
                    if let url = URL(string: "tel:\(phone)") {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    HStack {
                        Image(systemName: "phone.fill")
                            .font(.system(size: 18))
                        Text("Call")
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                        Text(phone)
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                    }
                    .foregroundColor(.blue)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .background(Color(uiColor: .secondarySystemFill))
                    .cornerRadius(12)
                }
            }

            if let email = landmark.email {
                Button {
                    if let url = URL(string: "mailto:\(email)") {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .font(.system(size: 18))
                        Text("Email")
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                        Text(email)
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                    .foregroundColor(.blue)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .background(Color(uiColor: .secondarySystemFill))
                    .cornerRadius(12)
                }
            }

            if let website = landmark.websiteUrl {
                Button {
                    if let url = URL(string: website) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    HStack {
                        Image(systemName: "safari.fill")
                            .font(.system(size: 18))
                        Text("Website")
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                        Image(systemName: "arrow.up.forward")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                    }
                    .foregroundColor(.blue)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .background(Color(uiColor: .secondarySystemFill))
                    .cornerRadius(12)
                }
            }
        }
        .padding(.horizontal, 20)
    }

    private var locationDetailsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Location Details")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.primary)
                .padding(.horizontal, 20)

            VStack(spacing: 0) {
                detailRow(
                    icon: "location.fill",
                    title: "Coordinates",
                    value: String(format: "%.4f°N, %.4f°E", landmark.latitude, landmark.longitude)
                )

                if landmark.altitude > 0 {
                    Divider()
                        .padding(.leading, 52)

                    detailRow(
                        icon: "arrow.up",
                        title: "Altitude",
                        value: "\(Int(landmark.altitude)) m"
                    )
                }

                if let address = landmark.streetAddress, !address.isEmpty {
                    Divider()
                        .padding(.leading, 52)

                    detailRow(
                        icon: "mappin.circle.fill",
                        title: "Address",
                        value: address
                    )
                }
            }
            .background(Color(uiColor: .secondarySystemFill))
            .cornerRadius(12)
            .padding(.horizontal, 20)
        }
    }

    private var photoGallery: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(photos) { photo in
                    AsyncImage(url: URL(string: photo.photoUrl)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 320, height: 240)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 320, height: 240)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        case .failure:
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.15))
                                    .frame(width: 320, height: 240)
                                Image(systemName: "photo")
                                    .font(.system(size: 48))
                                    .foregroundColor(.secondary)
                            }
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }

    private var hasContactInfo: Bool {
        landmark.phone != nil || landmark.email != nil || landmark.websiteUrl != nil
    }

    private func openingHoursSection(hours: String) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Hours")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.primary)
                .padding(.horizontal, 20)

            VStack(spacing: 0) {
                HStack(alignment: .top, spacing: 16) {
                    Image(systemName: "clock.fill")
                        .font(.system(size: 18))
                        .foregroundColor(.blue)
                        .frame(width: 24)

                    Text(formatOpeningHours(hours))
                        .font(.system(size: 16))
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)

                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            }
            .background(Color(uiColor: .secondarySystemFill))
            .cornerRadius(12)
            .padding(.horizontal, 20)
        }
    }

    private func loadPhotos() async {
        isLoadingPhotos = true
        do {
            photos = try await SupabaseService.shared.fetchLandmarkPhotos(landmarkId: landmark.id)
        } catch {
            print("Failed to load photos: \(error)")
        }
        isLoadingPhotos = false
    }

    private func formatOpeningHours(_ hours: String) -> String {
        hours.replacingOccurrences(of: ";", with: "\n")
            .replacingOccurrences(of: "|", with: "\n")
    }

    private func detailRow(icon: String, title: String, value: String) -> some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(.blue)
                .frame(width: 24)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)

                Text(value)
                    .font(.system(size: 16))
                    .foregroundColor(.primary)
            }

            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
}

#Preview {
    ARLandmarkView(landmarks: [])
}
