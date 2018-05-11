tee C:\Users\ASUS\Desktop\R05522625.log
############################# begin ##################################
select * from self;
select database();
############################# BASIC SELECT ##################################
# Display players match designated conditions
SELECT pname, bday, award,weight, height FROM player
WHERE bday<'1993-01-01' AND (height>80 OR weight>200)
      AND NOT (position='C' OR current_team_id=2);

########################### BASIC PROJECTION ################################
# Display the Center player of Golden State Warriors
SELECT p_id, pname, position, bday FROM player
WHERE current_team_id=4 AND position='C';

############################# BASIC RENAME ##################################
# Display team information
SELECT T.team_name AS Team, T.home_arena AS Arena, T.divs AS Division, T.gm AS Manager
FROM team AS T WHERE T.total_salary>0;

################################# UNION #####################################
# Display the Shooting Guards from both active & retired players

# Add a new table containing the list of retired players
DROP TABLE IF EXISTS retired_player;
CREATE TABLE retired_player (
  rp_id            INT           NOT NULL AUTO_INCREMENT,
  pname            varchar(50)   NOT NULL,
  bday             DATE          DEFAULT '0000-00-00',  #dummy date
  award            varchar(100)  DEFAULT NULL, #multi-valued attribute
  weight           INT           NOT NULL, #lb
  height           INT           NOT NULL, #inch
  position         ENUM('PG', 'SG', 'SF', 'PF', 'C', 'Not apply'),
  draft_year       YEAR          DEFAULT '0000' CHECK (draft_year>=1947),#1st draft
  PRIMARY KEY (rp_id)
);
INSERT INTO retired_player(pname, bday, weight, height, position, draft_year, award) VALUES
("Kobe Bryant", '1978-08-23', 212, 78, 'SG', '1996', "5×champion, 2×FMVP, 1×MVP"),
("Tim Duncan", '1976-04-25', 250, 83, 'PF', '1997', "5×champion, 3×FMVP, 2×MVP"),
("Michael Jordan", '1963-02-17', 216, 78, 'SG', '1984', "6×champion, 6×FMVP, 5×MVP"),
("Steve Nash", '1974-02-07', 180, 75, 'PG', '1996', "2×MVP");

# Commands
(SELECT pname AS 'Shooting Guard', weight AS 'Weight(lbs)', height AS 'Height(inches)'
FROM player WHERE position='SG')
UNION
(SELECT pname, weight, height
FROM retired_player WHERE position='SG');

############################### Equijoin ####################################
# Display the player on my list and their teams
SELECT pname AS Name, bday AS 'Birthday', position, team_name AS Team, height
FROM player JOIN team
ON player.current_team_id = team.team_id;

############################# Natural Join ##################################
# Display teams & their home arenas
SELECT team_name AS Team, arena_name AS Arena,
       arena.location AS Loc, arena.capacity
FROM team JOIN arena
ON team.home_arena = arena.arena_id;

############################## Theta Join ###################################
# Those retired players began career ealier than the birth of active players
SELECT R.pname AS "Retired Player", R.draft_year AS "Draft Year",
       A.pname AS "Active Player",  year(A.bday) AS Birthday
FROM retired_player AS R
JOIN player as A
ON R.draft_year <= year(A.bday);

########################### Three Table Join ################################
# Display the players who got over 25 points in a game and their teams
SELECT player.pname, PTS, FGM, FGA, 3PM, 3PA, team.team_name  FROM stats
JOIN player ON (stats.p_id = player.p_id)
JOIN team ON (player.current_team_id = team.team_id)
WHERE PTS>=25;

############################### Aggregate ###################################
# Number of player, min/max height of each team
SELECT team_name AS Team, COUNT(player.pname) AS "# of Players",
       MAX(height) AS MAX_height, MIN(height) AS MIN_height
FROM player JOIN team
ON team.team_id=player.current_team_id
GROUP BY team_name;

############################## Aggregate2 ###################################
# Comparison between divisions
SELECT team.divs AS Divisions, COUNT(team.team_name) AS "Number of Teams",
       AVG(arena.capacity) AS "AVG. Capacity of Arena",
       SUM(team.total_salary) AS "Total Salary of Division"
FROM team JOIN arena
ON (team.home_arena = arena.arena_id)
GROUP BY team.divs;

################################### IN ######################################
# Number of player & slaries of LAKERS & WARRIORS
SELECT team_name AS Team, COUNT(player.pname) AS "# of Players",
       total_salary AS "Team Salary"
FROM player JOIN team
ON team.team_id=player.current_team_id AND (team.team_id IN (3,4))
GROUP BY team_name;

################################### IN2 ######################################
# Players from the team with total salary over 115 mil. USD
SELECT pname, draft_year, team_name
FROM player JOIN team
ON team.team_id=player.current_team_id
WHERE current_team_id in
  (SELECT team_id FROM team
  WHERE total_salary >= 115000000);

######################### Correlated nested query ############################
# Display the teams that have ever win over a team with less total salary
Select team_name, total_salary
FROM team AS HOME
WHERE team_id IN (
  SELECT home_team_id
  FROM game JOIN team AS GUEST
  ON game.guest_team_id=Guest.team_id
  WHERE game.home_score > game.guest_score
    AND HOME.total_salary > GUEST.total_salary
);

######################## Correlated nested query 2 ###########################
# Display the list of players that ever registered in a game
SELECT pname
FROM player AS P
WHERE EXISTS (
  SELECT *
  FROM stats AS S
  JOIN game AS G ON S.game_id=G.game_id
  WHERE S.p_id = P.p_id
);

################################ BONUS 1 #####################################
# Create sponsorship table
DROP TABLE IF EXISTS sponsor;
CREATE TABLE sponsor (
  sp_id            INT           NOT NULL AUTO_INCREMENT,
  spname           varchar(50)   NOT NULL,
  team_id          INT           DEFAULT NULL,
  PRIMARY KEY(sp_id)
);
INSERT INTO sponsor(spname,team_id) VALUES
("NIKE",3),("NIKE",5),("ADIDAS",8),("ADIDAS",3),("KIA",5),("TWITTER",6),
("RAKUTE",DEFAULT),("GM",3),("FORD",7),("FORD",6),("AT&T",DEFAULT);

# show the sponsor and teams
SELECT spname, team_name
FROM sponsor AS sp
LEFT JOIN team ON sp.team_id=team.team_id;

################################ BONUS 2 #####################################
# show the sponsor and teams with outer full join
SELECT spname, team_name
FROM sponsor AS sp
LEFT JOIN team ON sp.team_id=team.team_id
UNION ALL
SELECT spname, team_name
FROM sponsor AS sp
RIGHT JOIN team ON sp.team_id=team.team_id;

################################ BONUS 3 #####################################
# Divisions with avg. team salary over 110 mil. USD
SELECT team.divs AS Divisions,
       AVG(team.total_salary) AS "AVG. Salary of Division"
FROM team JOIN arena
ON (team.home_arena = arena.arena_id)
GROUP BY team.divs
HAVING AVG(team.total_salary)>110000000;

################################ BONUS 4 #####################################
# Display the list of players that never registered in a game
SELECT pname
FROM player AS P
WHERE NOT EXISTS (
  SELECT *
  FROM stats AS S
  JOIN game AS G ON S.game_id=G.game_id
  WHERE S.p_id = P.p_id
);

############################# END ##################################
#DROP DATABASE NBA_Stats;
notee
