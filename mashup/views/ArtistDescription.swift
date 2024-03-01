//
//  ArtistDescription.swift
//  mashup
//
//  Created by Frans Englich on 2024-02-22.
//

import SwiftUI
import WebKit

class ArtistDescription: NSViewController, WKUIDelegate {

    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

#Preview {
    ArtistDescription()
}
