import SwiftUI

@main
struct ThreeOneOSFiveApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Retained only so the original, unused SettingsView source continues to compile.
final class AppState: ObservableObject {
    @Published var isSupported: Bool = true
}
