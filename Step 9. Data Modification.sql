--//UPDATE//
--Updating blank values into NULL from Movie table
UPDATE content.Movie
SET Title = NULL
WHERE Title = ' ';

UPDATE content.Movie
SET Director = NULL
WHERE Director = ' ';

UPDATE content.Movie
SET Cast = NULL
WHERE Cast = ' ';

UPDATE content.Movie
SET Country = NULL
WHERE Country = ' ';

UPDATE content.Movie
SET ReleaseYear = NULL
WHERE ReleaseYear = ' ';

UPDATE content.Movie
SET Rating = 'Not Rated'
WHERE Rating = ' ';

UPDATE content.Movie
SET Duration_in_minutes = NULL
WHERE Duration_in_minutes = 0;


--------------------------------------------------------------------------------------------------------------------
--Updating blank values into NULL from TvSeries table
UPDATE content.TvSeries
SET Title = NULL
WHERE Title = ' ';

UPDATE content.TvSeries
SET Creator = NULL
WHERE Creator = ' ';

UPDATE content.TvSeries
SET Cast = NULL
WHERE Cast = ' ';

UPDATE content.TvSeries
SET Country = NULL
WHERE Country = ' ';

UPDATE content.TvSeries
SET ReleaseYear = NULL
WHERE ReleaseYear = ' ';

UPDATE content.TvSeries
SET Rating = 'Not Rated'
WHERE Rating = ' ';

UPDATE content.TvSeries
SET Season = NULL
WHERE Season = 0;


--------------------------------------------------------------------------------------------------------------------
--Update Role information for a specific user.
UPDATE admin.Role
SET Name = 'new_Name', 
    Role = 'new_Role', 
	Username = 'new_Username', 
	Login = 'new_Login', 
	Password = 'new_Password'
WHERE RoleID = 'id_number';


--------------------------------------------------------------------------------------------------------------------
--Update Platform information.
UPDATE service.Platform
SET PlatformName = 'new_PlatformName', 
    Website = 'new_Website'
WHERE PlatformKey = 'id_number';


--------------------------------------------------------------------------------------------------------------------
-- Update Movie information.
UPDATE content.Movie
SET Title = 'new_Title', 
    Director = 'new_Director', 
	Cast = 'new_Cast', 
	Country = 'new_Country', 
	ReleaseYear = 2023,
    Rating = 'new_Rating', 
	Duration_in_minutes = 'new_duration_in_minutes'
WHERE MovieID = 'id_number';


--------------------------------------------------------------------------------------------------------------------
--Update TvSeries information.
UPDATE content.TvSeries
SET Title = 'new_Title', 
    Creator = 'new_Creator', 
	Cast = 'new_Cast', 
	Country = 'new_Country', 
	ReleaseYear = 2023,
    Rating = 'new_Rating', 
	Season = 'number_of_season'
WHERE SeriesID = 'id_number';


--------------------------------------------------------------------------------------------------------------------
--Update a specific platform's Content information.
UPDATE service.AmazonPrimeVideo
SET DateAdded = 'new_date', 
    Genre = 'new_Genre', 
	Description = 'new_Description'
WHERE AmazonID = 'id_number';

UPDATE service.DisneyPlus
SET DateAdded = 'new_date', 
    Genre = 'new_Genre', 
	Description = 'new_Description'
WHERE DisneyID = 'id_number';

UPDATE service.Hulu
SET DateAdded = 'new_date', 
    Genre = 'new_Genre', 
	Description = 'new_Description'
WHERE HuluID = 'id_number';

UPDATE service.Netflix
SET DateAdded = 'new_date', 
    Genre = 'new_Genre', 
	Description = 'new_Description'
WHERE NetflixID = 'id_number';


--------------------------------------------------------------------------------------------------------------------
--Delete a specific user's role.
DELETE FROM admin.Role
WHERE RoleID = 'id_number';


--------------------------------------------------------------------------------------------------------------------
--Delete a Platform information.
DELETE FROM service.Platform
WHERE PlatformKey = 'id_number';


--------------------------------------------------------------------------------------------------------------------
--Delete a Movie content.
DELETE FROM content.Movie
WHERE MovieID = 'id_number';


--------------------------------------------------------------------------------------------------------------------
--Delete a TV Series content.
DELETE FROM content.TvSeries
WHERE SeriesID = 'id_number';


--------------------------------------------------------------------------------------------------------------------
--Delete an AmazonPrimeVideo content.
DELETE FROM service.AmazonPrimeVideo
WHERE AmazonID = 'id_number';


--------------------------------------------------------------------------------------------------------------------
--Delete a Disney Plus content.
DELETE FROM service.DisneyPlus
WHERE DisneyID = 'id_number';


--------------------------------------------------------------------------------------------------------------------
--Delete a Hulu content.
DELETE FROM service.Hulu
WHERE HuluID = 'id_number';


--------------------------------------------------------------------------------------------------------------------
--Delete a Netflix content.
DELETE FROM service.Netflix
WHERE NetflixID = 'id_number';