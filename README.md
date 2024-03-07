
# Swift Music Mashup

This is a small macOS/iOS app that enables the user to search for a music artist, and returns a list of albums, with their titles and front cover album art.

Many of the technologies used in the implementation, such as Swift, Xcode and the services' APIs, were new to me.

In brief it it is implemented in Swift with SwiftUI on Sonoma/Xcode 15. It does two queries from MusicBrainz and typically multiple queries to Cover Art Archive, per artist search.

Pulling from Wikipedia was omitted due to also writing a smaller part of Java, and hence to not write two cases.

# The Case
The case was described as follows:

You are supposed to construct a mashup of MusicBrainz, Wikipedia and Cover Art Archive. MusicBrainz contains information about an artist, and what album he/she has released. Wikipedia has  description over the artist (which isn't in MusicBrainz') and Cover Art Archive contains images for the various albums (which MusicBrainz and Wikipedia neither contains). Build a service that present this information.

# How to Build & Run

In the IDE Xcode on Mac, open the project file swiftmusicmashup.xcodeproj. Install Xcode via the App Store, if needed. Then, in Xcode, choose build and then run. Tested on Sonoma 14.3.1.

# Challenges

This is my first development in Xcode, and hence Swift and SwiftUI -- it was fun. Swift is an elegant little language that solves many problematic areas. While it has plenty of OOP, it also has widespread use of -- welcomed -- functional elements. For instance closures (a kind of anonymous functions) and classics like map reduce.

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
* Accessibility
* Better search interface: Update as you type, and a drop-down that lists all matching artists for the typed query
* I perceive Cover Art Archive as slow, so optimizing that (caching either locally or on server), could be a larger project to do. One could mmap() a concatenated file
* Tweaks: SwiftUI's CachedImage seems to unload when out of view

## Security

A general security mindset, and this paragraph should be considered a bit cringe. Code-wise, it could be considered that a query injection is possible through the search interface, and perhaps possible DOS attacks. In short, a security review needs to be done.

## Legal/Business

In the case of this being a commercial application, a license/API key needs to be purchased from MusicBrainz, or enter some kind of agreement. In short, a legal review needs to be done.

## ESG
Might be relevant to look at energy consumption, depending on customer's requests.

## QA and QC

I have been on a test task force at W3C and am ISTQB certified, but without typing a book:

* Robustness for MusicBrainz' format. MB's MMD format needs to be studied
* Robustness for different HTTP return codes/and errors
* This app is simple, but a plethora of different user input/searches needs to be tested. For instance:
    - No input
    - Only spaces
    - Tabs
    - Non-ASCII characters, and see if they survive all encodings
    - Query that has no result
    - Different kinds of queries
* Relevant platforms

## Development

No particular attention have been paid to commit messages. I think this is all right, it's fast prototyping to get to a base where others can contribute. A message/history rewrite could be considered.

# My Own Valuation

I obviously think this is somewhat all right. Many aspects or features that needs to be addressed have been identified. The code is neat, follows conventions and established practices, and duplication is avoided.
