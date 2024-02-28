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

/**
A representation of a Music Brainz artist.
*/
struct Artist : Codable {
    /**
        Music Brainz' internal ID for artists.
     */
    let id: String

    /**
        The name, for instance "The Beatles", without quotes.
     */
    let name: String

    /**
        Geographical location of the artist, for instance "England".
     */
    let area: String

    init(id: String, name: String, area: String) {
        self.id = id
        self.name = name
        self.area = area
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

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var loadedData: String = ""

    func actionSearch() {
        loadData(artist: searchText)
    }

    func loadData(artist: String) {
        /*
        let url = URL(string: "https://musicbrainz.org/ws/2/artist/?query=artist:the%20beatles&fmt=json")!
         */
        let encoded = artist.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""

        print(encoded)

        let url = URL(string:
                        "https://musicbrainz.org/ws/2/artist/?query=artist:\(encoded)&fmt=json")!

        /*

    "https://musicbrainz.org/ws/2/release/?artist=b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d&fmt=json"

         */

// Timer: https://stackoverflow.com/questions/58363563/swiftui-get-notified-when-binding-value-changes
        
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

        request.setValue(
            "Custom mashup (fenglich@fastmail.fm)",
            forHTTPHeaderField: "User-Agent"
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
                var serviceReturn: MBArtists

                do {
                    /*
                    let debugString = """
                    {"created":"2024-02-23T14:52:48.123Z",
                    "count":110478,
                    "offset":0,
                        "artists":
                        [{"id":"b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d",
                            "type":"Group",
                            "type-id":"e431f5f6-b5d2-343d-8b36-72607fffb74b",
                            "score":100,
                            "name":"The Beatles",
                            "sort-name":"Beatles The",

                    "area":
                    {"id":"9d5dd675-3cf4-4296-9e39-67865ebee758"
                     , "type":"Subdivision"
                      , "type-id":"fd3d44c5-80a1-3842-9745-2c4972d35afa"
                        ,"name":"England"
                        ,"sort-name":"England"
                        ,"life-span":{"ended":null}
                    }
                    ]
                    }
                    """
*/
                    //let debugData = Data(debugString.utf8)
                    serviceReturn = try JSONDecoder().decode(MBArtists.self, from: data)

                    let artists: [Artist] = extractArtists(from: serviceReturn)

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
           // bindingSearchText = searchText


            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)

               /* .searchable(text: $searchText,
                            prompt: "Search for artist")

                */
            //ArtistDescription()
            //let v = ArtistDescription()
            //v.webView

            // WKWebView
            //SearchButton()

            HStack {
                SearchField(binding: $searchText)
              //  ArtistName(bindingSee)
                HTTPDataView(data: $loadedData)
                Button("Search", action: actionSearch)
              //  Button("Load", action: loadData)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
