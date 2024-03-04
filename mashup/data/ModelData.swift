//
//  ModelData.swift
//  mashup
//
//  Created by Frans Englich on 2024-03-01.
//

import Foundation


/**
 The persistent storage of the data that is viewed.

 */
@Observable
class ModelData {
    var albums: [Album] = [Album]()
    var artist: Artist = Artist()
}
