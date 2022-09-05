CREATE TABLE SEASON_CNST AS (
SELECT
playerID,
name,
SUM(SEASON_CNST) AS SEASON_CNST
FROM
(
SELECT
*,
CASE WHEN NAME = LAG(NAME) OVER (ORDER BY PLAYERID, SEASON) THEN 
	CASE WHEN FPTS > LAG(FPTS) OVER (ORDER BY PLAYERID, SEASON) THEN 1 ELSE -1 END
ELSE 0
END AS SEASON_CNST
FROM PLAYER_SEASON_FPTS

) a


GROUP BY 1,2
ORDER BY 3 DESC
)