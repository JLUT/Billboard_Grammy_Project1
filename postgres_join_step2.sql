-- Joining billboard and grammy genre tables
INSERT INTO billboard_grammy_analysis("artists", "name", "peak_position", "weeks_on_chart", "grammy_wins", "GrammyYear", "Genre")
SELECT  
	b."artists",
    b."name",
    b."peak_position",
    b."weeks_on_chart",
	b."grammy_wins",
	g."GrammyYear",
	g."Genre"
FROM billboard_grammy_analysis b
INNER JOIN grammy_genre g
ON b."name" = g."Name";
