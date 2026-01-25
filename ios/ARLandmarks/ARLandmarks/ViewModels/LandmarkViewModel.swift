//
//  LandmarkViewModel.swift
//  ARLandmarks
//
//  Created by Jessica Schneiter on 17.01.2026.
//

import Foundation
import Combine

@MainActor
class LandmarkViewModel: ObservableObject {
    @Published var landmarks: [Landmark] = []
    @Published var categories: [Category] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = SupabaseService.shared
    private var loadTask: Task<Void, Never>?

    func loadData() async {
        // Cancel any existing load task
        loadTask?.cancel()

        // Only show loading indicator if we have no data yet
        let isInitialLoad = landmarks.isEmpty
        if isInitialLoad {
            isLoading = true
        }
        errorMessage = nil

        // Fetch landmarks and categories independently to avoid one failure affecting the other
        let landmarksResult = await fetchLandmarksSafely()
        let categoriesResult = await fetchCategoriesSafely()

        // Update landmarks if fetch succeeded
        if let fetchedLandmarks = landmarksResult {
            landmarks = fetchedLandmarks
        }

        // Update categories if fetch succeeded
        if let fetchedCategories = categoriesResult {
            categories = fetchedCategories
        }

        // Only show error if both failed and we have no data
        if landmarksResult == nil && landmarks.isEmpty {
            errorMessage = "Failed to load landmarks"
        }

        isLoading = false
    }

    private func fetchLandmarksSafely() async -> [Landmark]? {
        do {
            return try await service.fetchLandmarks()
        } catch is CancellationError {
            print("Landmarks fetch cancelled")
            return nil
        } catch {
            print("Landmarks fetch error: \(error.localizedDescription)")
            return nil
        }
    }

    private func fetchCategoriesSafely() async -> [Category]? {
        do {
            return try await service.fetchCategories()
        } catch is CancellationError {
            print("Categories fetch cancelled")
            return nil
        } catch {
            print("Categories fetch error: \(error.localizedDescription)")
            return nil
        }
    }
}
