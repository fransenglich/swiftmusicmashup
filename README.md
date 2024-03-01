
Den här uppgiften är en så kallad "mashup" dvs. man tar funktionalitet från
några olika tjänster på nätet och "mashar ihop" dem till en tjänst. I det här
fallet är det tjänsterna MusicBrainz, Wikipedia och Cover Art Archive.
MusicBrainz innehåller information om en artist, och vilka album artisten
släppt. Wikipedia innehåller en beskrivning över artisten (som alltså INTE
finns i MusicBrainz) och Cover Art Archive innehåller bilder för de olika
albumen (som inte heller finns på MusicBrainz eller Wikipedia för den delen).

Du ska alltså integrera dessa tre tjänster och erbjuda en ny egen tjänst.

Input: artistnamn

Output/Interface:
        Search på toppen
    Namn, stylized
    Ingress från Wikipedia
    Lista av album, med namn och coverbild

Possible improvements
There are no limits to the amounts of features and polishing that is possible, but here are some more obvious and crucial ones:

* Better search interface. Update as you type, or trigger on enter key
* Security concerns
* Robustness for Music Brainz' API. MB's MMD format needs to be taken into account
* Error handling/robustness of responses from the APIs
* Currently hardcoded on English Wikipedia. Extend for different languages
* Generally error handling, many errors currently leads to segfaults
* Populate the search results incrementally

Challenges/steps that took time were:
* First time with Xcode, Swift, SwiftUI and so forth
* Understanding the services' APIs
