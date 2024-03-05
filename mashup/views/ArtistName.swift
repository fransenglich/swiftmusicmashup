
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
