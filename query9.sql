
SELECT ar.Name,
       ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS TotalRevenue,
       RANK() OVER (ORDER BY SUM(ii.UnitPrice * ii.Quantity) DESC) AS RevenueRank
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
JOIN tracks t ON al.AlbumId = t.AlbumId
JOIN invoice_items ii ON t.TrackId = ii.TrackId
GROUP BY ar.Name
ORDER BY RevenueRank;