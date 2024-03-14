
import Foundation

/**
 Representation of the JSON return from Music Brainz' API artist query.

 We don't need all data, hence we use this intermediate structure for discarding parts of it.

 See also MBAlbums.
 */
struct MBArtists: Decodable {

    let artists: [MBArtist]

    struct MBArtist: Decodable {
        let id: String
        let name: String

        //let country: String? // Could be useful in the app
        let area: MBArea?

        struct MBArea: Decodable {
            let id: String?
            let name: String?
        }
    }
}
