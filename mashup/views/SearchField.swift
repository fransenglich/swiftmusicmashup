

import SwiftUI

/**
 The search view at the top.
 */
struct SearchField: View {
    @Binding var binding: String

    var body: some View {
        TextField("Enter artist", text: $binding)
    }
}

/*
#Preview {
    SearchField()
}
*/
