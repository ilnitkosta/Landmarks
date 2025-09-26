import SwiftUI

class ThemeManager: ObservableObject {
    @Published var currTheme: Theme = .automatic {
        didSet {
            updateAppStorage()
        }
    }

    @AppStorage("isDarkMode") private var isDarkMode = false

    enum Theme: String, CaseIterable, Identifiable {
        case light = "Light"
        case dark = "Dark"
        case automatic = "Automatic"

        var id: String { rawValue }
    }

    private func updateAppStorage() {
        switch currTheme {
        case .dark:
            isDarkMode = true
        case .light:
            isDarkMode = false
        case .automatic:
            isDarkMode = UITraitCollection.current.userInterfaceStyle == .light
        }
    }
}

