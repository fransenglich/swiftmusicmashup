//
//  ContentView.swift
//  mashup
//
//  Created by Frans Englich on 2024-02-21.
//

import SwiftUI

// https://medium.com/@mdyamin/swiftui-mastering-webview-5790e686833e

/**
 Music Brainz' internal ID, the MBID, for its various entitities.

 We use this type alias as natural documentation. It also has the advantage of making refacforing/extension easier.

See: https://musicbrainz.org/doc/MusicBrainz_Identifier
 */
typealias MBID = String

struct HTTPDataView: View {
    @Binding var data: String

    var body: some View {
        Text(data)
    }
}

/**
A representation of a Music Brainz artist.
*/
struct Artist : Codable {

    let id: MBID

    /**
        The name, for instance "The Beatles", without quotes.
     */
    let name: String

    /**
        Geographical location of the artist, for instance "England".
     */
    let area: String

    init(id: MBID, name: String, area: String) {
        self.id = id
        self.name = name
        self.area = area
    }

    init() {
        self.id = ""
        self.name = ""
        self.area = ""
    }

    init(_ from: MBArtists.MBArtist) {
        id = from.id
        name = from.name

        /*
        if let name = from.name {
            self.name = name
        } else {
            self.name = ""
        }
         */

        if let area = from.area,
           let name = area.name {
            self.area = name
        } else {
            self.area = String()
        }

    }
}

func extractArtists(from: MBArtists) -> [Artist] {
    var retval: [Artist]

    retval = from.artists.map({Artist($0)})
    return retval
}

// Good on binding/state: https://blog.devgenius.io/swiftui-state-vs-binding-727262600884

/**
 TODO docs
 */
/*
func replaceWS(_ input: String) -> String {
    // TODO: do it the Swift way
    var retval = String()

    for i in input.indices {
        if(input[i] == " ") {
            retval.append("%20")
        }
        else {
            retval.append(input[i])
        }
    }

    return retval
}
*/


struct Album: Codable, Hashable {
    let id: MBID
    let title: String

    init(id: MBID, title: String) {
        self.id = id
        self.title = title
    }
}

func extractAlbums(from: MBAlbums) -> [Album] {
    var retval: [Album] = [Album]()

    print("Release count \(from.releases.count)")
    retval = from.releases.map({Album(id: $0.id, title: $0.title)})
    print("Albums in extractAlbums() \(retval)")
    return retval
}

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var loadedData: String = ""

    @Environment (ModelData.self) private var modelData


    func actionSearch() {
        loadData(artist: searchText)
    }

    func displayAlbums(_ albums: [Album]) {

    }
    /**

     */
    func fetchAlbums(artist: MBID) -> [Album] {
        let str = "https://musicbrainz.org/ws/2/release?artist=\(artist)&status=official&type=album&limit=10&fmt=json"
        let url = URL(string: str)!
        print (url)
        let request = buildURLRequest(url)

        var albums: [Album] = [Album]()

        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                do {
                    let retval = String(decoding: data, as: UTF8.self)
                    loadedData = retval
                    let jsonDecoder = JSONDecoder()
                    //jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let serviceReturn = try jsonDecoder.decode(MBAlbums.self, from: data)

                    print(serviceReturn)
                    modelData.albums = extractAlbums(from: serviceReturn)
                    displayAlbums(albums)
                 //   print (serviceReturn)
                 //   print ("Artists: \(artists)")
                }
                catch DecodingError.dataCorrupted {
                    print("JSON corrupt")
                }
                catch {
                    print("JSON album decoding error: \(error)")
                }


                /*
                if let artists = try? JSONDecoder().decode([Artist].self, from: data) {
                    print(artists)
                } else {
                    print("Invalid response")
                }
                 */
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
        print("FOO: \(albums)")
        return albums
    }

    func buildURLRequest(_ url: URL) -> URLRequest {
        var request = URLRequest(url: url)

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Accept"
        )

        request.setValue(
            "Custom mashup (fenglich@fastmail.fm)",
            forHTTPHeaderField: "User-Agent"
        )

        return request
    }

    func loadData(artist: String) {
        // The Beatles: b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d

//    https://musicbrainz.org/ws/2/artist/?query=artist:the%20beatles&fmt=json
        /*
        let url = URL(string: "https://musicbrainz.org/ws/2/artist/?query=artist:the%20beatles&fmt=json")!
         */
        let encoded = artist.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""

        print(encoded)

        let url = URL(string:
                        "https://musicbrainz.org/ws/2/artist/?query=artist:\(encoded)&fmt=json")!

        /*
     Works:
    "https://musicbrainz.org/ws/2/release/?artist=b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d&fmt=json"

         https://musicbrainz.org/ws/2/release?artist=b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d&status=official&type=album&limit=10&fmt=json


   https://musicbrainz.org/ws/2/release?artist=b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d&inc=release-groups&status=official&type=album&limit=10&fmt=json


         https://musicbrainz.org/ws/2/release?artist=b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d&status=official&type=album&limit=10&fmt=json

         */

// Timer: https://stackoverflow.com/questions/58363563/swiftui-get-notified-when-binding-value-changes
        
// FAILS: "https://musicbrainz.org/ws/2/artist/?fmt=json?query=artist:the%20beatles"
// WORKS: "https://musicbrainz.org/ws/2/artist/?query=artist:the%20beatles&fmt=json"

        //   https://musicbrainz.org/ws/2/artist/&fmt=json?query=artist:the%20beatles


        let request = buildURLRequest(url);

        var retval = String()

        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                retval = String(decoding: data, as: UTF8.self)
                loadedData = retval
                print(data)

                do {
                    let serviceReturn = try JSONDecoder().decode(MBArtists.self, from: data)

                    let artists: [Artist] = extractArtists(from: serviceReturn)

                    let firstArtist = artists[0] // TODO error handling

                    let albums = fetchAlbums(artist: firstArtist.id)

                    print("BAR: \(albums)")
                 //   print (serviceReturn)
                 //   print ("Artists: \(artists)")
                }
                catch DecodingError.dataCorrupted {
                    print("JSON corrupt")
                }
                catch {
                    print("JSON decoding error: \(error)")
                }


                /*
                if let artists = try? JSONDecoder().decode([Artist].self, from: data) {
                    print(artists)
                } else {
                    print("Invalid response")
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
            HStack {
                SearchField(binding: $searchText)
              //
               // HTTPDataView(data: $loadedData)
                Button("Search", action: actionSearch)
              //  Button("Load", action: loadData)
            }

         //   ArtistName(bindingSee)
            AlbumList()
/*
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)

 */
               /* .searchable(text: $searchText,
                            prompt: "Search for artist")

                */
            //ArtistDescription()
            //let v = ArtistDescription()
            //v.webView

            // WKWebView
            //SearchButton()


        }
        .padding()
    }
}

/*
#Preview {
    ContentView()
}
*/
