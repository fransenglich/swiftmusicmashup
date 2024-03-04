//
//  Global.swift
//  mashup
//
//  Created by Frans Englich on 2024-03-01.
//

import Foundation

/**
 Music Brainz' internal ID, the MBID, for its various entitities.

 We use this type alias as natural documentation. It also has the advantage of making refacforing/extension easier.

See: https://musicbrainz.org/doc/MusicBrainz_Identifier
 */
typealias MBID = String

/**
    Helper function. Sets up and configures an URLRequest for the url.
 */
func buildURLRequest(_ url: URL) -> URLRequest {
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

    return request
}
