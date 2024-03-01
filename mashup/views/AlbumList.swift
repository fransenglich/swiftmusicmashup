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
             ForEach (modelData.albums, id: \.self)
             { album in
         //  Label(text: album.title)
                 Text(album.title)
         /*
          NavigationLink {
          LandmarkDetail(landmark: landmark)
          } label: {
          LandmarkRow(landmark: landmark)
          }
          */
         }
         }

         }

    }

    /*
#Preview {
    AlbumList()
}
*/
