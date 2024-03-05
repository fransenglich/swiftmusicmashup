
# Swift Music Mashup

This is a small macOS/iOS app that enables the user to search for a music artist, and returns a list of albums, with their titles and front cover album art. Many of the technologies used, were new to me.

In brief it it is implemented in Swift with SwiftUI on Sonoma/Xcode 15. It does two queries from Music Brainz and typically multiple queries to Cover Art Archive, per artist search.

Pulling from Wikipedia was omitted due to also writing a smaller part of Java, and hence not write two cases.

# Challenges

This is my first development in Xcode, and hence Swift and SwiftUI -- it was fun. Swift is a elegant little language that solves many problematic areas. While it has plenty of OOP, it also has widespread use of -- welcomed -- functional elements. For instance closures (a kind of anonymous functions) and classics like map reduce.

Specific to this case was challenges related to the need of asynchronous tasks (the network loading) and updating the UI. Not surprisingly, Swift has measures for balancing this.

The asynchronous network loading was done by passing a closure to URLSession. SwiftUI's way of doing dynamic interfaces is very high level. While they've found inspiration from Qt and model/view architectures, much magic and behind-the-scenes work is used for making it very simple. One expresses relationships between views (widgets/controls) and the data, and SwiftUI does the wiring, an element of reactive programming. In the implementation the data is stored in ModelData, and the views in needed bring it in with @Environment. @States and @Bindings are also used for passing data.

A good article on reactive programming is: <https://redwerk.com/blog/reactive-programming-in-swift/>

# Aids Used

No questions were asked, such as on forums or to friends, for this case. Resources used were Xcode, expected documentation and articles.
 
# Possible Improvements

Considering this is only a case, much can be done.

## UI

* Conformance to relevant HIG (Human Interface Guidelines). In this case Apple's, and perhaps a company specific one
* Localization, also called l10n
* Accessiblity
* Better search interface: Update as you type, and a drop-down that lists all matching artists for the typed query

## Security

A general security mindset, and this paragraph should be considered a bit cringe. Code-wise, it could be considered that a query injection is possible through the search interface, and perhaps possible DOS attacks. In short, a security review needs to be done.

## Legal/Business

In the case of this being a commercial application, a license/API key needs to be purchased from MusicBrainz, or enter somekind of agreement. In short, a legal review needs to be done.

## QA and QC
* Robustness for Music Brainz' API. MB's MMD format needs to be studied
* Error handling/robustness of responses from the APIs
* Generally error handling, many errors currently leads to segfaults
