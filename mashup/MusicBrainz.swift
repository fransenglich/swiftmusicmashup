//
//  MusicBrainz.swift
//  mashup
//
//  Created by Frans Englich on 2024-02-22.
//

import Foundation


let jsonQueryResult = """
{
  "created": "2017-03-12T16:54:57.165Z",
  "count": 11,
  "offset": 0,
  "artists": [
    {
      "id": "e56fd97e-c18f-4e5e-9b4d-f9fc21b4973f",
      "type": "Group",
      "score": "100",
      "name": "Fred",
      "sort-name": "Fred",
      "country": "US",
      "area": {
        "id": "489ce91b-6658-3307-9877-795b68554c98",
        "name": "United States",
        "sort-name": "United States"
      },
      "begin-area": {
        "id": "489ce91b-6658-3307-9877-795b68554c98",
        "name": "United States",
        "sort-name": "United States"
      },
      "disambiguation": "US progressive rock band",
      "life-span": {
        "begin": "1969",
        "end": "1974",
        "ended": true
      }
    },
    {
      "id": "4a024fd4-305e-4fea-9d3f-4ec858766e6e",
      "type": "Group",
      "score": "100",
      "name": "Fred",
      "sort-name": "Fred",
      "country": "US",
      "area": {
        "id": "489ce91b-6658-3307-9877-795b68554c98",
        "name": "United States",
        "sort-name": "United States"
      },
      "disambiguation": "US comic barbershop quartet",
      "life-span": {
        "ended": null
      }
    },
    {
      "id": "1065e6e0-b6b3-4224-9121-4502e52b9f9e",
      "type": "Group",
      "score": "61",
      "name": "A Halo Called Fred",
      "sort-name": "A Halo Called Fred",
      "country": "US",
      "area": {
        "id": "489ce91b-6658-3307-9877-795b68554c98",
        "name": "United States",
        "sort-name": "United States"
      },
      "life-span": {
        "ended": null
      }
    },
    {
      "id": "6c843bf3-a854-47ea-b1cf-ba40675710b7",
      "type": "Group",
      "score": "61",
      "name": "Fred Sherry String Quartet",
      "sort-name": "Fred Sherry String Quartet",
      "country": "US",
      "area": {
        "id": "489ce91b-6658-3307-9877-795b68554c98",
        "name": "United States",
        "sort-name": "United States"
      },
      "life-span": {
        "ended": null
      }
    },
    {
      "id": "be136e58-ccf5-47f0-a000-6e8d7eb3bae0",
      "type": "Group",
      "score": "61",
      "name": "The Color Fred",
      "sort-name": "Color Fred, The",
      "country": "US",
      "area": {
        "id": "489ce91b-6658-3307-9877-795b68554c98",
        "name": "United States",
        "sort-name": "United States"
      },
      "life-span": {
        "begin": "2003",
        "ended": null
      }
    },
    {
      "id": "2cea1456-daef-4bb1-b63c-4b6df03ebbd5",
      "type": "Group",
      "score": "61",
      "name": "The Fred Hersch Group",
      "sort-name": "Hersch, Fred, The, Group",
      "country": "US",
      "area": {
        "id": "489ce91b-6658-3307-9877-795b68554c98",
        "name": "United States",
        "sort-name": "United States"
      },
      "life-span": {
        "ended": null
      }
    },
    {
      "id": "28b020fa-d9b8-4d92-805c-54cd1b0197b7",
      "type": "Group",
      "score": "61",
      "name": "Jacob Fred Jazz Odyssey",
      "sort-name": "Jacob Fred Jazz Odyssey",
      "country": "US",
      "area": {
        "id": "489ce91b-6658-3307-9877-795b68554c98",
        "name": "United States",
        "sort-name": "United States"
      },
      "life-span": {
        "begin": "1994",
        "ended": null
      },
      "aliases": [
        {
          "sort-name": "JFJO",
          "name": "JFJO",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        }
      ],
      "tags": [
        {
          "count": 1,
          "name": "jazz"
        },
        {
          "count": 1,
          "name": "jazz fusion"
        },
        {
          "count": 1,
          "name": "free jazz"
        },
        {
          "count": 1,
          "name": "oklahoma"
        },
        {
          "count": 1,
          "name": "us"
        },
        {
          "count": 1,
          "name": "tulsa"
        }
      ]
    },
    {
      "id": "4a903390-4381-4c32-90d0-803bd4f9ce34",
      "type": "Group",
      "score": "56",
      "name": "Fred Waring & His Pennsylvanians",
      "sort-name": "Waring, Fred & His Pennsylvanians",
      "country": "US",
      "area": {
        "id": "489ce91b-6658-3307-9877-795b68554c98",
        "name": "United States",
        "sort-name": "United States"
      },
      "life-span": {
        "ended": null
      },
      "aliases": [
        {
          "sort-name": "Fred Waring and the Pennsylvanians",
          "name": "Fred Waring and the Pennsylvanians",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "Fred Waring & Pennsylvanians",
          "name": "Fred Waring & Pennsylvanians",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "Fred Waring's Pennsylvanians",
          "name": "Fred Waring's Pennsylvanians",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "Fred Waring's Pennyslvanians",
          "name": "Fred Waring's Pennyslvanians",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "Fred Waring & the Pennsylvanians",
          "name": "Fred Waring & the Pennsylvanians",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "Waring, Fred & Pennsylvanians, The",
          "name": "Fred Waring & The Pennsylvanians",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "Fred Warring & His Pennsylvanians",
          "name": "Fred Warring & His Pennsylvanians",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "Waring's Pensylvanians",
          "name": "Waring's Pensylvanians",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        }
      ]
    },
    {
      "id": "0980008b-f9cd-412e-b062-84212b756f4a",
      "type": "Group",
      "score": "51",
      "name": "Fred Williams & The Jewels Band",
      "sort-name": "Williams, Fred & Jewels Band, The",
      "country": "US",
      "area": {
        "id": "489ce91b-6658-3307-9877-795b68554c98",
        "name": "United States",
        "sort-name": "United States"
      },
      "life-span": {
        "ended": null
      }
    },
    {
      "id": "985bdbe7-ebf2-42b1-8ad6-5bb619385e67",
      "type": "Group",
      "score": "51",
      "name": "Fred Wesley and The J.B.’s",
      "sort-name": "Wesley, Fred and J.B.’s, the",
      "country": "US",
      "area": {
        "id": "489ce91b-6658-3307-9877-795b68554c98",
        "name": "United States",
        "sort-name": "United States"
      },
      "life-span": {
        "ended": null
      },
      "aliases": [
        {
          "sort-name": "Fred and the New J.B.'s",
          "name": "Fred and the New J.B.'s",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "Fred Wesley & The J.B.'s",
          "name": "Fred Wesley & The J.B.'s",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "Fred Wesley & The JB's",
          "name": "Fred Wesley & The JB's",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "Fred Wesley & The New J.B.'s",
          "name": "Fred Wesley & The New J.B.'s",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "Fred Wesley & The New JB's",
          "name": "Fred Wesley & The New JB's",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        }
      ]
    },
    {
      "id": "05cfb5c7-0152-41f4-a9c9-622e8f710dfa",
      "type": "Group",
      "score": "51",
      "name": "John Fred & His Playboy Band",
      "sort-name": "Fred, John & His Playboy Band",
      "country": "US",
      "area": {
        "id": "489ce91b-6658-3307-9877-795b68554c98",
        "name": "United States",
        "sort-name": "United States"
      },
      "begin-area": {
        "id": "34f02dc4-3173-4c68-86d1-c82504759342",
        "name": "Baton Rouge",
        "sort-name": "Baton Rouge"
      },
      "life-span": {
        "begin": "1956",
        "end": "1969",
        "ended": true
      },
      "aliases": [
        {
          "sort-name": "John Fred",
          "name": "John Fred",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred and His Playboyband",
          "name": "John Fred and His Playboyband",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred and His Play Boy Band",
          "name": "John Fred and His Play Boy Band",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred And His Playboy Band",
          "name": "John Fred And His Playboy Band",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred and His Playboys",
          "name": "John Fred and His Playboys",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred and the Play Boy Band",
          "name": "John Fred and the Play Boy Band",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred and the Playboys",
          "name": "John Fred and the Playboys",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred & His Playboyband",
          "name": "John Fred & His Playboyband",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred & His Playboys",
          "name": "John Fred & His Playboys",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred & Hiss Playboy Band",
          "name": "John Fred & Hiss Playboy Band",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred & Playboyband",
          "name": "John Fred & Playboyband",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred & Playboy Band",
          "name": "John Fred & Playboy Band",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred & the Play Boy Band",
          "name": "John Fred & the Play Boy Band",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred & The Playboyband",
          "name": "John Fred & The Playboyband",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred & The Playboy Band",
          "name": "John Fred & The Playboy Band",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        },
        {
          "sort-name": "John Fred & The Playboys",
          "name": "John Fred & The Playboys",
          "locale": null,
          "type": null,
          "primary": null,
          "begin-date": null,
          "end-date": null
        }
      ]
    }
  ]
}
"""

struct mbArtist : Codable {
    let name: String
    let area: String
}

let jsonData = jsonQueryResult.data(using: .utf8)!
let artist: mbArtist = try! JSONDecoder().decode(mbArtist.self, from: jsonData)

let mbHTTPQuery = URL(string: "https://musicbrainz.org/ws/2/artist/?fmt=json?query=artist:the%20beatles")

