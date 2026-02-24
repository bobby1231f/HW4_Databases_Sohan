SELECT DISTINCT ar.Name
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
WHERE al.Title LIKE '%symphony%';