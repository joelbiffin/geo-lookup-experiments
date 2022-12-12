# SPK 43: Delivery Address and City Lookup / Autocompletion

## Context

When influencers apply to the platform, it would benefit the CS team greatly if we could capture the influencer's City information. This would allow them to prioritise accepting influencers that live near Cities with upcoming campaigns running.

This information would also be useful to store alongside approved influencers when on the platform, for the same purpose (but at the Bid Review stage).

In November 2022, for example, the managed brand Billion Dollar Boy were running a Campaign for the Candy Crush Saga's 10th anniversary. They were looking for influencers to attend the in-person event in New York. The challenge was that the list of influencers we had did not include their locality information, so we had to wait for influencers to be accepted and their delivery details uploaded before knowing if they lived in New York city.


## Delivery Address vs. City Lookup

Currently, we are using the `city` field from an influencer's `delivery_address` as the source of data for the bid review and influencer application review screens. This does intuitively make sense, since Brands expect the city in the delivery address to align with the influencer's stated city. In practice though, this creates two problems.

### Problem 1: Influencers who live outside of the city they claim to operate in

Imagine someone who spends most of their time in London, initially stating their local city is London. When this person later wants to enter their delivery address which resides in Dagenham (london not appearing in the address besides Greater London county), we would then be updating their City/Town as `Dagenham` despite it previously being given as London.

If we were to use the delivery address as the source of the `city` data, we would need to inform the Influencer what affect this has on their bids.

A counterpoint to this is that an influencer could live far away from their stated city, and hence be misrepresenting themselves. To me, this feels like a different issue to what we're trying to solve here. Also, there are tools that we can use to help the CS team in addressing these misrepresentations. One suggestion would be to calculate the distance between the stated `city` and the new `delivery_address` and inform the influencer / CS team member of the discrepancy.

### Problem 2: Lookup/Autocompletion of Address given a previously provided City

One could argue, that we could use the already provided `city` as a prefilled field in the `delivery_address` form. This could provide a better user experience initially in the usual case (where `city == delivery_address.city`). In the case where these two don't align though, it's unclear what we should do here.

We could simply take the user's delivery address information as gospel here and override the pre-filled `city`. This then presents us again with `problem 1`.

Another approach would be to not make the `city` field easily editable in the `delivery_address` form. We could intervene, showing the user a notice that changing their city would update their profile's `city` information. This isn't necessarily an issue for them placing the bid, however, if they were using a temporary address outside of the campaign's desired city, this might affect their bid's chances of being accepted.

### Problem 3: Multiple / Temporary Delivery Addresses

It is not uncommon for eCommerce sites to allow a user to choose one address from a list of previously provided ones. In this instance, how would we decide which address to use as the source of truth for the `city`?

One solution would be to allow the influencer to mark an address as Primary. However, it seems that this would not solve `problem 1`. Rather, it might just minimise `problem 1`.


## City Lookup / Autocomplete

There are a number of 3rd party solutions to the problem we're trying to solve. Technically speaking, what we are looking for is the ability to [Forward Geocode](https://en.wikipedia.org/wiki/Address_geocoding) a given City name. Also, it's important that we can filter the search result items by a type parameter (i.e. return only cities).

As part of this spike 3 third party solutions were considered, ArcGIS (ESRI), Geoapify and LocationIQ. Out of the many Geocoding APIs out there these three provided a good balance of cost, documentation, country & language support and usability. Other integrations that were considered include:

- Google Places / Maps API: this was not chosen due to the high usage cost (per search), despite having arguably the best support worldwide.

- Amazon Location Service: high usage cost, developer documentation looks quite lightweight since it's a fairly new amazon product.

- Mapbox: insuffient support outside of the US & Canada

The following third parties have been spiked in a Rails API application exposing a `/cities` endpoint. All 3 provide the Country coverage and language support that will enable us to epand into new territories.

### ESRI (ArcGIS)

#### Costs

- 20,000 free searches per month
- $0.50 / 1,000 searches after that

#### Spike outcome

See `esri.md` for details of the API response for 3 search terms.

#### Impressions

The quality of the data returned seems very accurate, although the data that's returned is just a long string containing the address information (e.g. "Manchester, Greater Manchester, England, GBR"). This might not be an issue, since technically it is a precise description of the city. We could use some frontend logic to truncate the string.

### Geoapify

#### Costs

- 3,000 free searches per day (limited commercial use)
- $49 / month would give 10,000 searches per day

#### Spiked Solution

See `geoapify.md` for details of the API response for 3 search terms.

#### Impressions

The data is returned in a richer structure than ESRI, breaking down each suggestion into its components like `city`, `state`, `country`, etc.

One difficulty that I noticed was that in some responses the suggestion did not contain all of the given fields. In the `New Yo` search result list, some results return the `name` without the `city` attribute, whilst others return the converse. This might lead us to make assumptions about the domain logic used here which could lead to bugs for users in certain locations.

### LocationIQ

#### Costs

- 5,000 free searches per day (limited commercial use) @ rate limit of 60/min
- $49 / month would give 10,000 searches per day with no rate limit

#### Spiked Solution

See `location_iq.md` for details of the API response for 3 search terms.

#### Impressions

The data is returned in a richer structure than ESRI, but not as rich as Geoapify. However, the `display_name`, `display_place` pairing feels very useful. It would mean that we could save the pair in our database for displaying a more detailed view in certain UIs. For example, when a user types "New Yo", we could display a list of the `display_names` to them, allowing them to be sure they have selected the correct one. Once they make their selection, we could then populate the field with `display_place` for a more concise view.

## Suggestions

From spiking a basic implementation of City search, my recommendation is to use LocationIQ for the city lookup. The structure of data returned from the search is helpful, containing both detailed text to display to the user (e.g. Manchester, Greater Manchester, England, UK) and "place text" that can be used to refer to the city in the form (e.g. Manchester).

Additionally, it looks like LocationIQ would be the best fit for us when looking at a delivery address lookup tool too.

The main challenge with LocationIQ is that the "limited commercial use" flag on the free plan, tells us that we must display a prominent reference to LocationIQ:

> You can use our free plan in commercial projects if you spread the love by adding a prominent link back to us on your website or app in this format: <a>Search by LocationIQ</a>.

If this were to be too much of a hinderance to the UX, then I would recommend using ESRI due to its competitive pricing.
