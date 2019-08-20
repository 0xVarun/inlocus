SELECT locations.id, 
FROM locations, geofences
WHERE ST_Within( locations.geometry, geofences.geometry )
ORDER BY locations."createdAt"