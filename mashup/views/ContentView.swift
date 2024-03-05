//
//  ContentView.swift
//  mashup
//
//  Created by Frans Englich on 2024-02-21.
//

import SwiftUI


struct ContentView: View {
    @State private var searchText: String = ""

    @Environment (ModelData.self) private var modelData


    /**
     Triggered by the search button.
     */ // TODO do with anon func
    func actionSearch() {
        loadFor(artistName: searchText)
    }

    /**

     */
    func loadAlbums(artist: MBID) {
        let str = "https://musicbrainz.org/ws/2/release?artist="
                + artist
                + "&status=official&type=album&limit=100&fmt=json"
        let url = URL(string: str)!
        print (url)
        let request = buildURLRequest(url)

        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                do {
                    let serviceReturn = try JSONDecoder().decode(MBAlbums.self, from: data)

                    print(serviceReturn)
                    modelData.albums = Album.extract(from: serviceReturn)
                }
                catch DecodingError.dataCorrupted {
                    print("JSON corrupt")
                }
                catch {
                    print("JSON album decoding error: \(error)")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
    }

    /**
            Loads the data for the given artist in argument.

                It does it in these steps:
     1. Figure out the MBID for the searched artist
     2. Retrieve the albums for the given MBID
     3. Get the album images and display them.

            Note, the argument is the name of artist, not MBID.
     */
    func loadFor(artistName: String) {
        // The Beatles: b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d

        let encoded = artistName.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""

        print(encoded)

        let url = URL(string:
                        "https://musicbrainz.org/ws/2/artist/?query=artist:\(encoded)&fmt=json")!

        let request = buildURLRequest(url);

        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                do {
                    let serviceReturn = try JSONDecoder().decode(MBArtists.self, from: data)

                    let artists: [Artist] = Artist.extract(from: serviceReturn)

                    let firstArtist = artists[0] // TODO error handling

                    // Second step: load the albums
                    loadAlbums(artist: firstArtist.id)

                }
                catch DecodingError.dataCorrupted {
                    print("JSON corrupt")
                }
                catch {
                    print("JSON decoding error: \(error)")
                }

            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
    }

    var body: some View {
        VStack {
            HStack {
                SearchField(binding: $searchText)
                Button("Search", action: actionSearch)
            }

            AlbumList()
        }
        .padding()
    }
}


#Preview {
    ContentView()
}

