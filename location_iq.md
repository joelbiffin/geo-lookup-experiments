```sh
$ curl "http://localhost:3000/cities?q=Manch&client=location_iq"
```
```json
[
  {
    "display_name":"Manchester, Greater Manchester, England, M60 2UP, United Kingdom",
    "display_place":"Manchester"
  },
  {
    "display_name":"Manchester, Manchester, Hillsborough County, New Hampshire, 03104, USA",
    "display_place":"Manchester"
  },
  {
    "display_name":"Manchester, Manchester, Freeborn County, Minnesota, 56007, USA",
    "display_place":"Manchester"
  },
  {
    "display_name":"Manchester, Manchester, Dickinson County, Kansas, 67410, USA",
    "display_place":"Manchester"
  },
  {
    "display_name":"Manchester, Manchester, Saint Louis County, Missouri, 63021, USA",
    "display_place":"Manchester"
  },
  {
    "display_name":"Salford, Greater Manchester, England, M6 5RQ, United Kingdom",
    "display_place":"Salford"
  }
]
```
```sh
$ curl "http://localhost:3000/cities?q=New%20Yo&client=location_iq"
```
```json
[
  {
    "display_name":"New York, New York, New York, 10007, USA",
    "display_place":"New York"
  },
  {
    "display_name":"New Rochelle, New Rochelle, Westchester County, New York, 10801, USA",
    "display_place":"New Rochelle"
  },
  {
    "display_name":"Kingston, Kingston, Ulster, New York, 12401, USA",
    "display_place":"Kingston"
  },
  {
    "display_name":"Buffalo, Buffalo, Erie County, New York, 14202, USA",
    "display_place":"Buffalo"
  },
  {
    "display_name":"Albany, Albany, Albany County, New York, 12207, USA",
    "display_place":"Albany"
  },
  {
    "display_name":"Rochester, Rochester, Monroe County, New York, 14614, USA",
    "display_place":"Rochester"
  },
  {
    "display_name":"Syracuse, Syracuse, Onondaga County, New York, 13202, USA",
    "display_place":"Syracuse"
  },
  {
    "display_name":"Middletown, Middletown, Orange County, New York, 10940, USA",
    "display_place":"Middletown"
  },
  {
    "display_name":"Watertown, Watertown, Jefferson County, New York, 13601, USA",
    "display_place":"Watertown"
  },
  {
  "display_name":"Peekskill, Peekskill, Westchester County, New York, 10566, USA",
  "display_place":"Peekskill"
  }
```
```sh
$ curl "http://localhost:3000/cities?q=South&client=location_iq"
```
```json
[
  {
    "display_name":"South Bend, South Bend, Saint Joseph County, Indiana, 46601, USA",
    "display_place":"South Bend"
  },
  {
    "display_name":"South Gate, South Gate, Los Angeles County, California, 90280, USA",
    "display_place":"South Gate"
  },
  {
    "display_name":"South Portland, South Portland, Cumberland County, Maine, 04106, USA",
    "display_place":"South Portland"
  },
  {
    "display_name":"South Haven, South Haven, Wright County, Minnesota, 55382, USA",
    "display_place":"South Haven"
  },
  {
    "display_name":"South St. Paul, South St. Paul, Minnesota, 55075, USA",
    "display_place":"South St. Paul"
  },
  {
    "display_name":"South Tucson, South Tucson, Pima County, Arizona, 85713, USA",
    "display_place":"South Tucson"
  },
  {
    "display_name":"South San Francisco, South San Francisco, San Mateo County, California, 94080, USA",
    "display_place":"South San Francisco"
  },
  {
    "display_name":"South Houston, South Houston, Harris County, Texas, 77587, USA",
    "display_place":"South Houston"
  },
  {
    "display_name":"South Park View, Minor Lane Heights, South Park View, Jefferson County, Kentucky, 40219, USA",
    "display_place":"South Park View"
  },
  {
    "display_name":"South English, South English, Keokuk County, Iowa, 52335, USA",
    "display_place":"South English"
  }
]
```
