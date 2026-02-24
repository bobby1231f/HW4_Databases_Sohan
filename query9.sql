
SELECT ar.Name,
       ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS TotalRevenue,
       RANK() OVER (ORDER BY SUM(ii.UnitPrice * ii.Quantity) DESC) AS RevenueRank
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
JOIN tracks t ON al.AlbumId = t.AlbumId
JOIN invoice_items ii ON t.TrackId = ii.TrackId
GROUP BY ar.Name
ORDER BY RevenueRank;

--This query builds a revenue leaderboard of all artists in the store. It traces the full path from an artist to their albums to the tracks on those albums to actual sales of those tracks, then calculates how much total revenue each artist has generated. It then uses a window function to rank every artist from highest to lowest earner.
