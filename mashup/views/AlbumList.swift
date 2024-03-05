
import SwiftUI

struct AlbumList: View {
    @Environment (ModelData.self) private var modelData

    var body: some View {
         List {
             ForEach (modelData.albums) { album in
                  HStack {

                     AsyncImage(url: album.imageURL,
                                content: { image in
                                    image.resizable()
                                         .aspectRatio(contentMode: .fit)
                                         .frame(maxWidth: 100, maxHeight: 100)
                                },
                                placeholder: {
                                    ProgressView()
                                })

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
