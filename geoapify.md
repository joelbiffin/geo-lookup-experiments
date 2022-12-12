```sh
$ curl "http://localhost:3000/cities?q=Manch&client=geoapify"
```
```json
[
  {
    "country_code": "gb",
    "city": "Manchester",
    "state": "England"
  },
  {
    "country_code": "us",
    "city": "Manchester",
    "state": "New Hampshire"
  },
  {
    "country_code": "us",
    "city": "Manchester",
    "state": "Connecticut"
  },
  {
    "country_code": "us",
    "city": "West Manchester Township",
    "state": "Pennsylvania"
  },
  {
    "name": "Manchester Lakes",
    "country_code": "us",
    "city": "Hampshire",
    "state": "Illinois"
  }
]
```
```sh
$ curl "http://localhost:3000/cities?q=New%20Yo&client=geoapify"
```
```json
[
  {
    "country_code": "us",
    "city": "New York",
    "state": "New York"
  },
  {
    "name": "East New York",
    "country_code": "us",
    "city": "New York",
    "state": "New York"
  },
  {
    "country_code": "us",
    "city": "West New York",
    "state": "New Jersey"
  },
  {
    "name": "Little New York",
    "country_code": "us",
    "state": "Alabama"
  }
]
```
```sh
$ curl "http://localhost:3000/cities?q=South&client=geoapify"
```
```json
[
  {
    "name": "South",
    "country_code": "us",
    "city": "South",
    "state": "Kentucky"
  },
  {
    "name": "Science Village",
    "country_code": "us",
    "city": "Science Village",
    "state": "California"
  }
]
```
