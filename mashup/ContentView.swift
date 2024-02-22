//
//  ContentView.swift
//  mashup
//
//  Created by Frans Englich on 2024-02-21.
//

import SwiftUI

// https://medium.com/@mdyamin/swiftui-mastering-webview-5790e686833e



struct ContentView: View {
    @State var searchText: String = ""

    func actionSearch() {
    }
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            ArtistName()
                //.navigationTitle("Searachable example")
                .searchable(text: $searchText, prompt: "Search for artist")
    
            //ArtistDescription()
            //let v = ArtistDescription()
            //v.webView

            // WKWebView
            //SearchButton()
            /*
            HStack {
               
                Button("Search", action: actionSearch)
            }
             */
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
