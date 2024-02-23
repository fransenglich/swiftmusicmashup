//
//  ContentView.swift
//  mashup
//
//  Created by Frans Englich on 2024-02-21.
//

import SwiftUI

// https://medium.com/@mdyamin/swiftui-mastering-webview-5790e686833e

struct HTTPDataView: View {
    @Binding var data: String

    var body: some View {
        Text(data)
    }
}

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var loadedData: String = ""

    func actionSearch() {
    }

    func loadData() {
        let url = URL(string: "https://musicbrainz.org/ws/2/artist/?query=artist:the%20beatles&fmt=json")

// FAILS: "https://musicbrainz.org/ws/2/artist/?fmt=json?query=artist:the%20beatles"
// WORKS: "https://musicbrainz.org/ws/2/artist/?query=artist:the%20beatles&fmt=json"

        //   https://musicbrainz.org/ws/2/artist/&fmt=json?query=artist:the%20beatles

        var request = URLRequest(url: url)

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Accept"
        )

        var retval = String()

        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                retval = String(decoding: data, as: UTF8.self)
                loadedData = retval
                print(data)
                /*
                if let books = try? JSONDecoder().decode([Book].self, from: data) {
                    print(books)
                } else {
                    print("Invalid Response")
                }
                 */
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
        loadedData = retval
        //return retval
        //return String()
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            ArtistName()
                //.navigationTitle("Searchable example")
                .searchable(text: $searchText, prompt: "Search for artist")

            //ArtistDescription()
            //let v = ArtistDescription()
            //v.webView

            // WKWebView
            //SearchButton()

            HStack {
                HTTPDataView(data: $loadedData)
                Button("Search", action: actionSearch)
                Button("Load", action: loadData)
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
