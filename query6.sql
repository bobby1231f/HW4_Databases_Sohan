SELECT DISTINCT ar.Name
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
JOIN tracks t ON al.AlbumId = t.AlbumId
JOIN media_types mt ON t.MediaTypeId = mt.MediaTypeId
JOIN playlist_track pt ON t.TrackId = pt.TrackId
JOIN playlists p ON pt.PlaylistId = p.PlaylistId
WHERE mt.Name LIKE '%MPEG%'
AND p.Name IN ('Brazilian Music', 'Grunge');

--This query builds a revenue leaderboard of all artists in the store. It traces the full path from an artist to their albums to the tracks on those albums to the actual sales of those tracks, then calculates how much total revenue each artist has generated. It then uses a window function to rank every artist from highest to lowest earner.