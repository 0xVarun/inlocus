
# CAMPAIGN

	1. Campaign Name, Date (Start, End)
	
	2. Locations
		- Search
		- Tags
		- Map
		- Dwell Time
		- Short List of Locations & Add to List (saved List)
			- Based on filters above our location list. should show short-listed location
			in real time

	3. Users / Audience - Target People based on
		- Location History 					   	\
												 |-> Linkage to User ids
		- Combinations of location history		/
		- Clicks
		- Tags
		- Clicked Location
		- Dwell Time at a location
		- Inside or Outside a Location

# CAMPAIGN FILTERS 
	
	1. Location
		- Fence, Polygon, Address, Tags, Filtes Tags
	
	2. Phone State
	
	3. COntext Triggers

	4. Dwell Time / Avg Foot Falls
		- (Feasability) If avg dwell time of a location is  > 10 mins => add to location list ?
		- User is at location for > 5 mins

	5. Location SETS or Location Collection
		- Select say 50 locations from list and add to a new tag or
		new location collection [Add] [edit] [delete option]

	6. Tags


# USER DATA / AUDIENCE DATA / USER PROFILE

	1. Userid [gaid] [idfa] [third part id] [inlocus id] [imei/device]
		- Apps
		- Browser

	2. Device Brand

	3. OS version

	4. Location History
		- Location tags
		- Click Location
		- Location Categorties

	5. Dwell time
		- At each location

	6. Phone State [walking, running, driving, direction, in use, not in use, unlock]

	7. Clicked Messaged / Unclicked Messages

	8. One View of a location history on map


# LOCATION DATA & LINKAGES FOR EACH LOCATION
	A. GEOFENCE
		- Polygon - p1, p2, p3, p4,... pN
		- Latitude, Longitude
		- Wifi 
			- Inside (BSSID/RSSI)
			- Outside (BSSID/RSSI)
		- Beacon
			- Major
			- Minor
			- UUID
		- Addon
		- Google places id or URL

	B. TAGS
		- Type Of location (GYM)
		- Area (Powai, Worli, Andheri)
		- Pincode (400076)
		- Other Tags

	C. 
		- Avg Footfalls
		- Avg Dwell Time


## Linkage
	1. Campagin Location
		- All Powai
		- Pincode



```JSON
{
	"campaignId": <ID>,
	"campaignType": "TEXT/IMAGE",
	"notificationId": <ID>,
	"campagin": {
		"title": "<CAMPAIGN NOTIFICATION TITLE>",
		"content": {
			"text": "<CAMPAGIN BODY TEXT>",
			"uri": "<CAMPAGIN ACTION URI>",
			// Only if campagin type is IMAGE
			"imgUrl": "<CAMPAGIN IMAGE URL" 
		},
		"filters": "<CAMPAGIN FILTERS>",
		"count": "<COUNT>", // Reservered for future implementation
		"inlousID": "<inLocus ID>" // Reserved for future implementation
	}
}
```