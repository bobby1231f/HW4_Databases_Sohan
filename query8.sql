SELECT p.PlaylistId, p.Name, ROUND(SUM(t.Milliseconds) / 3600000.0, 2) AS Hours
FROM playlists p
JOIN playlist_track pt ON p.PlaylistId = pt.PlaylistId
JOIN tracks t ON pt.TrackId = t.TrackId
GROUP BY p.PlaylistId, p.Name
HAVING SUM(t.Milliseconds) / 3600000.0 > 2;