//
//  MBQueryResult.swift
//  mashup
//
//  Created by Frans Englich on 2024-02-28.
//

import Foundation

/**
 Full representation of the JSON return from Music Brainz' API artist query.

 We don't need all data, hence we use this intermediate structure for discarding parts of it.

 See also MBAlbums.
 */
struct MBArtists: Decodable {
    let created: String
    let count: Int
    let offset: Int
    let artists: [MBArtist]

    struct MBArtist: Decodable {
        let id: String
        let type: String?
        let type_id: String?
        let score: Int?
        let name: String
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
                case type_id = "type-id"
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
