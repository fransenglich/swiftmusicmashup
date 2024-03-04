//
//  AlbumList.swift
//  mashup
//
//  Created by Frans Englich on 2024-03-01.
//

import SwiftUI

struct AlbumList: View {
    @Environment (ModelData.self) private var modelData

    var body: some View {
         List {
             ForEach (modelData.albums, id: \.self) { album in
                 Text(album.title)
             }
         }
    }
}

    /*
#Preview {
    AlbumList()
}
*/
