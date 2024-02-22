//
//  SearchButton.swift
//  mashup
//
//  Created by Frans Englich on 2024-02-21.
//

import SwiftUI

struct SearchButton: View {
    @State private var searchText: String = ""

    var body: some View {

        NavigationStack {
            
            Text("")
                .navigationTitle("Searachable example")
                .searchable(text: $searchText, prompt: "Search for artist")
             
        }
        
        .padding()
    
    }
    
}

#Preview {
    SearchButton()
}
