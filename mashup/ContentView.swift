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
    let name: String
    let area: String

    init(name: String, area: String) {
        self.name = name
        self.area = area
    }

    init(fromMB: MBService.MBArtist) {
        if let name = fromMB.name,
           let n = fromMB.name {
            self.name = n
        } else {
            name = ""
        }

        if let a = fromMB.area,
           let n = a.name {
            self.area = n
        } else {
            area = ""
        }
    }
}


/**
 Full representation of the JSON return from Music Brainz' API.

 We don't need all data, hence we use this intermediate structure for discarding parts of it.
 */
struct MBService: Decodable {
    let created: String
    let count: Int
    let offset: Int
    let artists: [MBArtist]

    struct MBArtist: Decodable {
        let id: String
        let type: String?
        let type_id: String?
        let score: Int?
        let name: String?
        let sort_name: String?
        let country: String?
        let area: MBArea?
        let begin_area: MBBeginArea?
        let disambiguation: String?
        let isnis: [String]?

           let life_span: MBLifeSpan?
        let aliases: [MBAlias]?
          let tags: [MBTag]?


        private enum CodingKeys: String, CodingKey {
            case id
            case type
            case type_id = "type-id"
            case score
            case name
            case sort_name = "sort-name"
            case country
            case area
            case begin_area = "begin-area"
            case disambiguation
            case isnis
                   case life_span = "life-span"
                 case aliases
            case tags

        }

        struct MBArea: Decodable {
            let id: String?
            let type: String?
            let type_id: String?
            let name: String?
            let sort_name: String?
            let life_span: MBEnded?

            private enum CodingKeys: String, CodingKey {
                case id
                case type
                case type_id = "string"
                case name
                case sort_name = "sort-name"
                case life_span = "life-span"
            }
        }

        struct MBEnded: Decodable {
            let ended: String?
        }

        struct MBBeginArea: Decodable {
            let id: String?
            let type: String?
            let type_id: String?
            let name: String?
            let sort_name: String?
            let life_span: MBEnded?

            private enum CodingKeys: String, CodingKey {
                case id
                case type
                case name
                case type_id = "type-id"
                case sort_name = "sort-name"
                case life_span = "life-span"
            }
        }

        struct MBLifeSpan: Decodable {
            let begin: String?
            let end: String?
            let ended: Bool?
        }

        struct MBAlias: Decodable {
            let sort_name: String?
            let type_id: String?
            let name: String?
            let locale: String?
            let type: String?
            let primary: Bool?
            let begin_date: String?
            let end_date: String?

            private enum CodingKeys: String, CodingKey {
                case name
                case locale
                case type
                case primary
                case sort_name = "sort-name"
                case type_id = "type-id"
                case begin_date = "begin-date"
                case end_date = "end-date"
            }
        }

        struct MBTag: Decodable {
            let count: Int?
            let name: String?
        }
    }
}

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var loadedData: String = ""

    func actionSearch() {
    }

    func loadData() {
        let url = URL(string: "https://musicbrainz.org/ws/2/artist/?query=artist:the%20beatles&fmt=json")!

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
                var serviceReturn: MBService

                do {
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

                    //let debugData = Data(debugString.utf8)
                    serviceReturn = try JSONDecoder().decode(MBService.self, from: data)
                    print (serviceReturn)
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
