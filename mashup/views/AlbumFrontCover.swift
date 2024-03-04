//
//  AlbumFrontCover.swift
//  mashup
//
//  Created by Frans Englich on 2024-03-04.
//

import SwiftUI




struct AlbumFrontCover: View {
    let imageData: NSImage?

    /*
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
           /* DispatchQueue.main.async() { [weak self] in
              //  self?.imageView.image = UIImage(data: data)
            }
            */
        }
    }
     */

    var body: some View {
        if imageData == nil {
            Image("foo")
        }
        else {
            Image(nsImage: imageData!)
        }
    }
}

/*
#Preview {
    AlbumFrontCover()
}
*/
