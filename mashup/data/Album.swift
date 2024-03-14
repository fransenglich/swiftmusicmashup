import Foundation
import AppKit

/**
 A container representing an album.
 */
struct Album: Identifiable {
    /**
    Unique identifier given by Music Brainz.
     */
    let id: MBID

    /**
     The title of the music album.
     */
    let title: String

    /**
    The URL to the album front cover image.
     */
    var imageURL: URL {
       URL(string: "https://coverartarchive.org/release/"
            + id
            + "/front.jpg")!
    }

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
