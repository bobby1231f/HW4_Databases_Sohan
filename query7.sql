SELECT ar.Name, COUNT(t.TrackId) AS MPEGTracks
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
JOIN tracks t ON al.AlbumId = t.AlbumId
JOIN media_types mt ON t.MediaTypeId = mt.MediaTypeId
WHERE mt.Name LIKE '%MPEG%'
GROUP BY ar.Name
HAVING COUNT(t.TrackId) >= 10;