
import Foundation

/**
 Representation of the JSON return from Music Brainz' API releases query.

 We don't need all data, hence we use this intermediate structure for discarding parts of it.
 */
struct MBAlbums: Decodable {
    let releases: [MBAlbum]
}

struct MBAlbum: Decodable {
    let title: String
    let id: String
}
