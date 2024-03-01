//
//  mashupApp.swift
//  mashup
//
//  Created by Frans Englich on 2024-02-21.
//

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
