
import SwiftUI

@main
struct mashupApp: App {
   @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
               .environment(modelData)
        }
    }
}
