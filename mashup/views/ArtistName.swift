//
//  ArtistName.swift
//  mashup
//
//  Created by Frans Englich on 2024-02-22.
//

import SwiftUI

struct ArtistName: View {
    @Environment (ModelData.self) private var modelData

    var body: some View {
        Text("Search for an artist")
            .bold()
    }
}

/*
 #Preview {
 ArtistName()
 }
 */
