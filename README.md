# SPK 43: Delivery Address and City Lookup / Autocompletion

## Context

When influencers apply to the platform, it would benefit the CS team greatly if we could capture the influencer's City information. This would allow them to prioritise accepting influencers that live near Cities with upcoming campaigns running.

This information would also be useful to store alongside approved influencers when on the platform, for the same purpose (but at the Bid Review stage).

In November 2022, for example, the managed brand Billion Dollar Boy were running a Campaign for the Candy Crush Saga's 10th anniversary. They were looking for influencers to attend the in-person event in New York. The challenge was that the list of influencers we had did not include their locality information, so we had to wait for influencers to be accepted and their delivery details uploaded before knowing if they lived in New York city.


## Delivery Address vs. City Lookup

Currently, we are using the `city` field from an influencer's `delivery_address` as the source of data for the bid review and influencer application review screens. This does intuitively make sense, since Brands expect the city in the delivery address to align with the influencer's stated city. In practice though, this creates two problems.

### Problem 1: Influencers who live outside of the city they claim to operate in

Imagine someone who spends most of my time in London, initially stating their local city is London. When this person later wants to enter their delivery address which resides in Dagenham (london not appearing in the address besides Greater London county), we would then be updating their City/Town as `Dagenham` despite it previously being given as London.

If we were to use the delivery address as the source of the `city` data, we would need to inform the Influencer what affect this has on their bids.

A counterpoint to this is that an influencer could live far away from their stated city, and hence be misrepresenting themselves. To me, this feels like a different issue to what we're trying to solve here. Also, there are tools that we can use to help the CS team in addressing these misrepresentations. One suggestion would be to calculate the distance between the stated `city` and the new `delivery_address` and inform the influencer / CS team member of the discrepancy.

### Problem 2: Lookup/Autocompletion of Address given a previously provided City

One could argue, that we could use the already provided `city` as a prefilled field in the `delivery_address` form. This could provide a better user experience initially in the usual case (where `city == delivery_address.city`). In the case where these two don't align though, it's unclear what we should do here.

We could simply take the user's delivery address information as gospel here and override the pre-filled `city`. This then presents us again with `problem 1`.

Another approach would be to not make the `city` field easily editable in the `deliver_address` form. We could intervene, showing the user a notice that changing their city would update their profile's `city` information. This isn't necessarily an issue for them placing the bid, however, if they were using a temporary address outside of the campaign's desired city, this might affect their bid's chances of being accepted.

### Problem 3: Multiple / Temporary Delivery Addresses

It is not uncommon for eCommerce sites to offer the
