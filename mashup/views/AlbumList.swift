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
             ForEach (modelData.albums) { album in
                //let data = NSImage(contentsOf: album.imageURL)

                 HStack {
                     //AlbumFrontCover(imageData: data)
                     AsyncImage(url: album.imageURL,
                                content: { image in
                                    image.resizable()
                                         .aspectRatio(contentMode: .fit)
                                         .frame(maxWidth: 100, maxHeight: 100)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                                )


                     /*)
                         .frame(width: 200, height: 200)
                         .resizable()
                         .aspectRatio(contentMode: .fit)*/
                     //AlbumFrontCover(imageData: album.albumCoverImage)
                     Text(album.title)
                 }
             }
         }
    }
}

    /*
#Preview {
    AlbumList()
}
*/
