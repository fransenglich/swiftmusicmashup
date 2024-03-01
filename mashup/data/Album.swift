//
//  Album.swift
//  mashup
//
//  Created by Frans Englich on 2024-03-01.
//

import Foundation

/**
 A simple container representing an album.
 */
struct Album: Codable, Hashable {
    /**
        Unique identifier given by Music Brainz.
     */
    let id: MBID

    /**
     The title of the music album.
     */
    let title: String

    init(id: MBID, title: String) {
        self.id = id
        self.title = title
    }

    /**
        From MBAlbums, the return from Music Brainz' query API, we extract a clean vector of Albums and return it.
     */
    static func extract(from: MBAlbums) -> [Album] {
        return from.releases.map({Album(id: $0.id, title: $0.title)})
    }
}
