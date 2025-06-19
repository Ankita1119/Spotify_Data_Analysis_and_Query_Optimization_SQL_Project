



select count(*) from spotify;

-- rename the column
EXEC sp_rename 'spotify.view', 'views_by', 'COLUMN';

SELECT * FROM spotify
where Duration_min = 0; 

select Distinct Track from spotify;

-- Easy Level Questions
-- 1. Retrieve the names of all tracks that have more than 1 billion streams.

SELECT Track 
FROM spotify
WHERE Stream > 1000000000;

-- 2. List all albums along with their respective artists.

SELECT 
DISTINCT Album, Artist
FROM spotify;

-- 3. Get the total number of comments for tracks where `licensed = TRUE`.

SELECT 
SUM(Comments) AS total_comments
FROM spotify
WHERE licensed = 'TRUE' ;

--4. Find all tracks that belong to the album type `single`.

SELECT Track
FROM spotify
WHERE Album_type = 'single';

-- 5. Count the total number of tracks by each artist.

SELECt COUNt(Track) as Total_number, Artist
FROM spotify
GROUP BY Artist
ORDER BY Total_number;

-- Intermediate Level Questions

-- 6. Calculate the average danceability of tracks in each album.

SELECT 
	Album,
	AVG(Danceability) as Avg_danceability
FROM spotify
GROUP BY Album
ORDER BY Avg_danceability DESC;

--7. Find the top 5 tracks with the highest energy values.

SELECT TOP 5
	Track, 
	ROUND(MAX(Energy),2) as Energy_values
FROM spotify
GROUP BY TRack
ORDER BY Energy_values DESC;

-- 8. List all tracks along with their views and likes where `official_video = TRUE`.

SELECT top 5
	Track,
	SUM(Views) as total_views,
	SUM(Likes) as total_likes 
FROM spotify
WHERE official_video = 'TRUE'
GROUP BY Track
ORDER BY total_views DESC;

-- 9. For each album, calculate the total views of all associated tracks.

SELECT 
	Album,
	Track,
	SUM(views) as total_views
FROM spotify
GROUP BY Album, Track
ORDER BY total_views DESC;

-- 10. Retrieve the track names that have been streamed on Spotify more than YouTube.

SELECT * FROM
(SELECT 
	Track,
	SUM(CASE WHEN most_playedon = 'Spotify' THEN Stream ELSE 0 END) as stream_on_spotify,
	SUM(CASE WHEN most_playedon = 'Youtube' THEN Stream ELSE 0 END) as stream_on_youtube
FROM spotify
GROUP BY track
) as T1
WHERE 
	stream_on_spotify > stream_on_youtube
	And stream_on_youtube <> 0;


-- Q11 Find the percentage of official music videos vs. non-official uploads.

SELECT 
  CAST((COUNT(CASE WHEN official_video = 'TRUE' THEN 1 END) * 100.0) / COUNT(*) AS DECIMAL(10,2)) AS official_percentage,
  CAST((COUNT(CASE WHEN official_video = 'FALSE' THEN 1 END) * 100.0) / COUNT(*) AS DECIMAL(10,2)) AS unofficial_percentage
FROM spotify;

-- Q12 Find the fastest-growing song (based on streams per like).

SELECT 
	TOP 1
	track, artist, 
	stream / NULLIF(liveness, 0) AS growth_ratio
FROM spotify
ORDER BY growth_ratio DESC;


-- Advance level Questions

-- Q13. Find the top 3 most-viewed tracks for each artist using window functions.

select * from spotify;

WITH ranking_artist AS
( SELECT
	Artist,
	Track,
	sum(views_by) as total_views,
	DENSE_RANK() OVER (PARTITION BY Artist ORDER BY sum(views_by) DESC) as ranks
FROM spotify
GROUP BY Artist,Track
)
SELECT *
FROM ranking_artist
WHERE ranks <=3;

-- 14. Write a query to find tracks where the liveness score is above the average.

SELECT 
	Track,
	Artist, 
	Liveness
FROM spotify
WHERE Liveness > (SELECT AVG(Liveness) as Avg_liveness 
				  FROM Spotify)
;
					
-- 15. **Use a `WITH` clause to calculate the difference between the highest and lowest energy values for tracks in each album.**

WITH CTE AS
(
SELECT
	Album,
	MAX(energy) as max_energy,
	MIN(energy) as min_energy
FROM spotify
GROUP BY Album
)
SELECT Album,
max_energy - min_energy as energy_diffrence
FROM CTE
ORDER BY energy_diffrence DESC;

-- Q16. Find tracks where the energy-to-liveness ratio is greater than 1.2.

SELECT
	Track, 
	Energy,
	Liveness,
	ROUND(Energy/Liveness ,2) as ratio
FROM spotify
WHERE Energy/Liveness > 1.2
ORDER BY ratio;


-- Q17. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.

SELECT 
	Track,
	SUM(likes) OVER(ORDER BY views_by DESC) as Cumulative_sum
FROM spotify
;

-- Q18. Predict the next trending song based on high danceability & energy but low views.
SELECT 
	TOP 10
	track, 
	artist, 
	danceability, 
	energy, 
	views_by 
FROM spotify
WHERE danceability > 0.7 AND energy > 0.7
	AND views_by < 50000
ORDER BY (danceability + energy) DESC

-- Query Optimization 

SELECT * FROM spotify;
EXPLAIN ANALYZE
SELECT 
	Artist, Track, Views_by
FROM spotify
WHERE Artist = 'Gorillaz' and most_playedon = 'Youtube'
ORDER BY Stream DESC;

CREATE INDEX Artist_index ON spotify (Artist);


-- count all the records
select count(*) 
from spotify;


-- query add

-- End of Queries 
