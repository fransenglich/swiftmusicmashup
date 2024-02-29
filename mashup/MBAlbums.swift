//
//  MBReleases.swift
//  mashup
//
//  Created by Frans Englich on 2024-02-28.
//

import Foundation


/**
 Full representation of the JSON return from Music Brainz' API releases query.

 We don't need all data, hence we use this intermediate structure for discarding parts of it.
 */


struct MBAlbums: Decodable {
    let albums: [MBAlbum]

    private enum CodingKeys: String, CodingKey {
        case albums = ""
    }
}

struct MBAlbum: Decodable {
    let release_group: MBReleaseGroup
    let status_id: String?
    let quality: String?
    let title: String
    let barcode: String?
    let packaging: String?
    let country: String?
    let status: String?
    let disambiguation: String?
    let date: String?
    let asin: String?
    let packaging_id: String?
    let text_representation: MBTextRepresentation
    let release_events: MBReleaseEvents
    let id: String
    let cover_art_archive: MBCoverArtArchive?

    private enum CodingKeys: String, CodingKey {
        case release_group = "release-group"
        case status_id
        case quality
        case title
        case barcode
        case packaging
        case country
        case status
        case disambiguation
        case date
        case asin
        case packaging_id
        case text_representation = "text-representation"
        case release_events = "release-events"
        case id
        case cover_art_archive = "cover-art-archive"

    }
}

struct MBTextRepresentation: Decodable {
    let language: String?
    let script: String?
}

struct MBReleaseEvents: Decodable {
    let events: [MBReleaseEvent]

    private enum CodingKeys: String, CodingKey {
        case events = ""
    }
}

struct MBReleaseEvent: Decodable {
    let area: MBArea?
    let date: String?
}

struct MBCoverArtArchive: Decodable {
    let darkened: Bool
    let count: Int
    let artwork: Bool
    let back: Bool
    let front: Bool
}

struct MBArea: Decodable {
    let sort_name: String
    let type: String
    let disambiguation: String
    let type_id: String?
    let iso: [String]
    let id: String
    let name: String
}

struct MBReleaseGroup: Decodable {
    let secondary_types: [String]
    let title: String
    let first_release_date: String
    let disambiguation: String
    let primary_type: String
    let id: String
    let secondary_type_ids: [String]
    let primary_type_id: String

    private enum CodingKeys: String, CodingKey {
        case secondary_types = "secondary-types"
        case title
        case first_release_date = "first-release-date"
        case disambiguation
        case primary_type = "primary_type"
        case id
        case secondary_type_ids = "secondary-type-ids"
        case primary_type_id = "primary-type-id"
    }

}
