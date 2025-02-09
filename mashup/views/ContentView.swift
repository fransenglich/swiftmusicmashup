
import SwiftUI

/**
 Our main view.
 */
struct ContentView: View {
    @State private var searchText: String = ""

    @Environment (ModelData.self) private var modelData
    
    /**
            A helper function that runs the closure execute for the data as returned and converted for the URL.

            It's used for loadArtist() and loadAlbums(), that both does HTTP fetches. It's a prevention
                of code duplication. The closure passed in does computation specific to each caller.

     - Parameter url: The URL to be loaded. Must be valid
     - Parameter execute: the closure to execute for the data
     */
    func loadData(url: String, execute: @escaping (Data?) throws -> Void) {
        var request = URLRequest(url: URL(string: url)!)

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )

        request.setValue(
            "Custom mashup (fenglich@fastmail.fm)",
            forHTTPHeaderField: "User-Agent"
        )

        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                do {
                    try execute(data)
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
        Loads the albums for an artist. Writes directly to modelData.

     The modelData is updated with the retrieved data.

     - Parameter artist: The MBID for the artist
     */
    func loadAlbums(artist: MBID) {
        let str = "https://musicbrainz.org/ws/2/release?artist="
                + artist
                + "&status=official&type=album&limit=20&fmt=json"

        loadData(url: str, execute: { (data: Data?) in
                    let serviceReturn = try JSONDecoder().decode(MBAlbums.self, from: data!)

                    modelData.albums = Album.extract(from: serviceReturn)
                })
    }

    /**
            Loads the data for the given artist in argument. Writes directly to modelData.

                It does it in these steps:
     1. Figure out the MBID for the searched artist
     2. Retrieve the albums for the given MBID
     3. Get the album images and display them.

            Note, the argument is the name of artist, not MBID.
     */
    func loadArtist(artistName: String) {
        // The Beatles: b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d

        let encoded = artistName.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""

        let str = "https://musicbrainz.org/ws/2/artist/?query=artist:"
                + encoded
                + "&fmt=json"

        loadData(url: str, execute: { (data: Data?) in
            let serviceReturn = try JSONDecoder().decode(MBArtists.self, from: data!)

            let artists: [Artist] = Artist.extract(from: serviceReturn)

            if artists.isEmpty {
                modelData.artist = nil
            }
            else {
                // Second step: load the albums
                modelData.artist = artists[0]
                loadAlbums(artist: modelData.artist!.id)
            }
        })
    }

    var body: some View {
        VStack {
            HStack {
                SearchField(binding: $searchText)
                Button("Search", action: {
                    modelData.firstSearch = false
                    loadArtist(artistName: searchText)
                })
            }

            if modelData.artist == nil {
                if !modelData.firstSearch {
                    Text("No such artist found")
                }
            }
            else {
                Text(modelData.artist!.name)
                    .font(.system(size: 20))
                AlbumList()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

