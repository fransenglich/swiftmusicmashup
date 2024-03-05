

import SwiftUI

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
