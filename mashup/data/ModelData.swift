
import Foundation


/**
 The persistent storage of the data that is viewed.
 */
@Observable
class ModelData {
    /**
     The list of albums for the currently viewed artist
     */
    var albums: [Album] = [Album]()
    
    /**
     The artist that was chosen from the query.
     */
    var artist: Artist?

    var firstSearch: Bool = true
}
