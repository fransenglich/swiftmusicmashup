//
//  Album.swift
//  mashup
//
//  Created by Frans Englich on 2024-03-01.
//

import Foundation
import AppKit

/**
 A simple container representing an album.
 */
struct Album: Codable, Hashable, Identifiable {
    /**
        Unique identifier given by Music Brainz.
     */
    let id: MBID

    /**
     The title of the music album.
     */
    let title: String

    /**
     The image data for the album front cover.
     */
  //  let frontCover: NSImage

    /**
        The URL to the album front cover image.
     */
    let imageURL: URL

    init(id: MBID, title: String) {
        self.id = id
        self.title = title
        self.imageURL = URL(string: "http://coverartarchive.org/release/" + id + "/front.jpg")!
    }

    func loadFrontCover() {
        /*
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
         */
    }
    
    /**
        From MBAlbums, the return from Music Brainz' query API, we extract a clean vector of Albums and return it.
     */
    static func extract(from: MBAlbums) -> [Album] {
       /* var retval: [Album] = [Album]()

        ForEach(from.releases) { album in
            let url: String = "http://coverartarchive.org/release/"
                            + album.id
                            + "/front.jpg"

           // let cover = NSImage(url: url)

            //retval.append(Album(id: album.id, album.title, cover))
        }
        */
        return from.releases.map({Album(id: $0.id, title: $0.title)})
    }
}
