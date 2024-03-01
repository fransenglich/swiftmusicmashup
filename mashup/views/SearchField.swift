//
//  SearchField.swift
//  mashup
//
//  Created by Frans Englich on 2024-02-28.
//

import SwiftUI

struct SearchField: View {
    @Binding var binding: String

    var body: some View {
        TextField("Enter text", text: $binding)
    }
}

/*
#Preview {
    SearchField()
}
*/
