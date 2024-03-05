import Foundation

/**
A representation of a Music Brainz artist.
*/
struct Artist {

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

        if let area = from.area,
           let name = area.name {
            self.area = name
        } else {
            self.area = String()
        }
    }

    static func extract(from: MBArtists) -> [Artist] {
        return from.artists.map({Artist($0)})
    }
}
