--//Basic Queries//
--Query to search for movies by title.
SELECT *
FROM content.Movie
WHERE Title LIKE 'M%';


--------------------------------------------------------------------------------------------------------------------
--Query to search for shows by title.
SELECT *
FROM content.TvSeries
WHERE Title LIKE 'T%';


--------------------------------------------------------------------------------------------------------------------
--Query to search for a list of movies released in a specific country and their cast.
SELECT Title,
       Cast,
	   Country
FROM content.Movie
WHERE Country LIKE '%United%States%';


--------------------------------------------------------------------------------------------------------------------
--Query to search for a list of shows released in a specific country and their cast.
SELECT Title,
       Cast,
	   Country
FROM content.TvSeries
WHERE Country LIKE '%Canada%';


--------------------------------------------------------------------------------------------------------------------
--Query to search for a list of movies released from 2020 to the current date, including their lengths.
SELECT Title,
       ReleaseYear,
	   Duration_in_minutes
FROM content.Movie
WHERE ReleaseYear >= 2020;


--------------------------------------------------------------------------------------------------------------------
--Query to search for a list of shows released from 2020 to the current date, including their lengths.
SELECT Title,
       ReleaseYear,
	   Season
FROM content.TvSeries
WHERE ReleaseYear >= 2020;


--------------------------------------------------------------------------------------------------------------------
--Query to calculate the average duration of movies.
SELECT AVG(Duration_in_minutes) AS AvgDuration
FROM content.Movie;


--------------------------------------------------------------------------------------------------------------------
--Query to calculate the average number of season for a show.
SELECT AVG(Season) AS AvgSeason
FROM content.TvSeries;


--------------------------------------------------------------------------------------------------------------------
--//ADVANCED Queries//
--Query to count the number of movies per platform.
SELECT p.PlatformName, 
       COUNT(m.MovieID) AS Movies
FROM content.Movie AS m
INNER JOIN service.Platform AS p 
   ON m.PlatformKey = p.PlatformKey
GROUP BY p.PlatformName;


--------------------------------------------------------------------------------------------------------------------
--Query to count the number of shows per platform.
SELECT p.PlatformName, 
       COUNT(t.SeriesID) AS TvSeries
FROM content.TvSeries AS t
INNER JOIN service.Platform AS p 
   ON t.PlatformKey = p.PlatformKey
GROUP BY p.PlatformName;


--------------------------------------------------------------------------------------------------------------------
--Query to find a specific platform's content for movies with a PG-13 rating.
SELECT a.AmazonID, 
       m.Title,
	   m.Rating,
       a.Genre,
	   a.Description
FROM content.Movie AS m
INNER JOIN service.AmazonPrimeVideo AS a
   ON m.PlatformKey = a.PlatformKey
WHERE m.Rating = 'PG-13';


--------------------------------------------------------------------------------------------------------------------
--Query to find a specific platform's content for shows with a TV-G rating.
SELECT n.NetflixID, 
       t.Title,
	   t.Rating,
       n.Genre,
	   n.Description
FROM content.TvSeries AS t
INNER JOIN service.Netflix AS n
   ON t.PlatformKey = n.PlatformKey
WHERE t.Rating = 'TV-G';


--------------------------------------------------------------------------------------------------------------------
--Query to find the total duration of movies from a specific platform.
WITH MovieDuration AS (
    SELECT p.PlatformName,
           SUM(m.Duration_in_minutes) AS TotalDuration
    FROM content.Movie AS m
    JOIN service.Platform AS p 
	  ON m.PlatformKey = p.PlatformKey
    GROUP BY p.PlatformName
)

SELECT PlatformName,
       TotalDuration
FROM MovieDuration;


--------------------------------------------------------------------------------------------------------------------
--Query to retrieve movie ID's released after 2015.
SELECT Title, 
       Director
FROM content.Movie
WHERE MovieID IN (
     SELECT MovieID
     FROM content.Movie
     WHERE ReleaseYear > 2015
);


--------------------------------------------------------------------------------------------------------------------
--///VIEWS///
--//AmazonPrimeVideo//
--View all information of Movie content from AmazonPrimeVideo.
CREATE VIEW AmazonMovieView AS
SELECT a.AmazonID,
       m.Title,
	   m.Director,
	   m.Cast,
	   m.Country,
	   m.ReleaseYear,
	   m.Rating,
	   m.Duration_in_minutes,
	   a.DateAdded,
	   a.Genre,
	   a.Description
FROM service.AmazonPrimeVideo AS a
JOIN content.Movie AS m
  ON a.PlatformKey = m.PlatformKey;

--View all information of TvSeries content from AmazonPrimeVideo.
CREATE VIEW AmazonTvSeriesView AS
SELECT a.AmazonID,
       t.Title,
	   t.Creator,
	   t.Cast,
	   t.Country,
	   t.ReleaseYear,
	   t.Rating,
	   t.Season,
	   a.DateAdded,
	   a.Genre,
	   a.Description
FROM service.AmazonPrimeVideo AS a
JOIN content.TvSeries AS t
  ON a.PlatformKey = t.PlatformKey;


--------------------------------------------------------------------------------------------------------------------
--//DisneyPlus//
--View all information of Movie content from DisneyPlus.
CREATE VIEW DisneyMovieView AS
SELECT d.DisneyID,
       m.Title,
	   m.Director,
	   m.Cast,
	   m.Country,
	   m.ReleaseYear,
	   m.Rating,
	   m.Duration_in_minutes,
	   d.DateAdded,
	   d.Genre,
	   d.Description
FROM service.DisneyPlus AS d
JOIN content.Movie AS m
  ON d.PlatformKey = m.PlatformKey;

--View all information of TvSeries content from the DisneyPlus.
CREATE VIEW DisneyTvSeriesView AS
SELECT d.DisneyID,
       t.Title,
	   t.Creator,
	   t.Cast,
	   t.Country,
	   t.ReleaseYear,
	   t.Rating,
	   t.Season,
	   d.DateAdded,
	   d.Genre,
	   d.Description
FROM service.DisneyPlus AS d
JOIN content.TvSeries AS t
  ON d.PlatformKey = t.PlatformKey;


--------------------------------------------------------------------------------------------------------------------
--//Hulu//
--View all information of Movie content from Hulu.
CREATE VIEW HuluMovieView AS
SELECT h.HuluID,
       m.Title,
	   m.Director,
	   m.Cast,
	   m.Country,
	   m.ReleaseYear,
	   m.Rating,
	   m.Duration_in_minutes,
	   h.DateAdded,
	   h.Genre,
	   h.Description
FROM service.Hulu AS h
JOIN content.Movie AS m
  ON h.PlatformKey = m.PlatformKey;

--View all information of TvSeries content from the Hulu.
CREATE VIEW HuluTvSeriesView AS
SELECT h.HuluID,
       t.Title,
	   t.Creator,
	   t.Cast,
	   t.Country,
	   t.ReleaseYear,
	   t.Rating,
	   t.Season,
	   h.DateAdded,
	   h.Genre,
	   h.Description
FROM service.Hulu AS h
JOIN content.TvSeries AS t
  ON h.PlatformKey = t.PlatformKey;


--------------------------------------------------------------------------------------------------------------------
--//Netflix//
--View all information of Movie content from Netflix.
CREATE VIEW NetflixMovieView AS
SELECT n.NetflixID,
       m.Title,
	   m.Director,
	   m.Cast,
	   m.Country,
	   m.ReleaseYear,
	   m.Rating,
	   m.Duration_in_minutes,
	   n.DateAdded,
	   n.Genre,
	   n.Description
FROM service.Netflix AS n
JOIN content.Movie AS m
  ON n.PlatformKey = m.PlatformKey;

--View all information of TvSeries content from Netflix.
CREATE VIEW NetflixTvSeriesView AS
SELECT n.NetflixID,
       t.Title,
	   t.Creator,
	   t.Cast,
	   t.Country,
	   t.ReleaseYear,
	   t.Rating,
	   t.Season,
	   n.DateAdded,
	   n.Genre,
	   n.Description
FROM service.Netflix AS n
JOIN content.TvSeries AS t
  ON n.PlatformKey = t.PlatformKey;
