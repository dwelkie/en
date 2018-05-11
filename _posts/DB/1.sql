#tee C:\Users\ASUS\Desktop\R05522625.log
############################# begin ##################################
CREATE DATABASE NBA_Stats;
Use NBA_Stats;
############################# self ##################################
CREATE TABLE self (
  student_id    varchar(50)     NOT NULL,
  name          varchar(50)     NOT NULL,
  degree        varchar(50)     NOT NULL,
  dept          varchar(200)    NOT NULL,
  year          INT             NOT NULL
);
INSERT INTO self VALUES ("R05522625", "王威翔", "Master", "Mechanical Engineering", 2);
select * from self;
select database();
############################# arena entity ##################################
# https://en.wikipedia.org/wiki/List_of_National_Basketball_Association_arenas
CREATE TABLE arena (
  arena_id    INT          NOT NULL AUTO_INCREMENT,
  arena_name  varchar(50)  NOT NULL,
  location    varchar(50)  NOT NULL,
  capacity    INT          DEFAULT 0,
  UNIQUE(arena_name),
  PRIMARY KEY (arena_id)
);
INSERT INTO arena(arena_name, location, capacity) VALUES
("Not apply", "-", 0),
("STAPLES Center", "L.A., California", 19060),
("Oracle Arena", "Oakland, California", 19596),
("Toyota Center", "Houston, Texas", 18055),
("Wells Fargo Center", "Philadelphia, Pennsylvania", 20478),
("fake arena", "My house", 2),
("AT&T Center", "San Antonio, Texas", 18418);
############################# team entity ##################################
# http://hoopshype.com/salaries/
# https://stats.nba.com/teams/
DROP TABLE IF EXISTS team;
CREATE TABLE team (
  team_id       INT NOT NULL AUTO_INCREMENT,
  team_name     varchar(100) NOT NULL, #composite-valued attribute
  home_arena    INT          DEFAULT 1,
  divs      ENUM('Atlantic', 'Central', 'Southeast', 'Northwest', 'Pacific', 'Southwest', 'Not apply'),
  gm            varchar(50)  DEFAULT '-',  #current general manager
  total_salary  INT,
  PRIMARY KEY (team_id),
  FOREIGN KEY (home_arena) REFERENCES arena (arena_id)
);
#1
INSERT INTO team(team_name, home_arena, divs, gm, total_salary) VALUES ("PHILADELPHIA 76ERS", 5, "Atlantic", "Bryan Colangelo", 101151770);
#2
INSERT INTO team(team_name, home_arena, divs, gm, total_salary) VALUES ("fake team", 6, "Southwest", DEFAULT, 0);
#3
INSERT INTO team(team_name, home_arena, divs, gm, total_salary) VALUES ("LOS ANGELES LAKERS", 2, "Pacific", "Rob Pelinka", 103044807);
#4
INSERT INTO team(team_name, home_arena, divs, gm, total_salary) VALUES ("GOLDEN STATE WARRIORS", 3,"Pacific", "Bob Myers", 137593052);
#5
INSERT INTO team(team_name, home_arena, divs, gm, total_salary) VALUES ("LA CLIPPERS", 2, "Pacific", "Michael Winger", 119011260);
#6
INSERT INTO team(team_name, home_arena, divs, gm, total_salary) VALUES ("HOUSTON ROCKETS", 4, "Southwest", "Daryl Morey", 119606297);
#7
INSERT INTO team(team_name, home_arena, divs, gm, total_salary) VALUES ("SAN ANTONIO SPURS", 7, "Southwest", "R. C. Buford", 114629344);

############################# player entity ##################################
DROP TABLE IF EXISTS player;
CREATE TABLE player (
  p_id             INT           NOT NULL AUTO_INCREMENT,
  pname            varchar(50)   NOT NULL,
  bday             DATE          DEFAULT '0000-00-00',  #dummy date
  award            varchar(100)  DEFAULT NULL, #multi-valued attribute
  weight           INT           NOT NULL, #lb
  height           INT           NOT NULL, #inch
  current_team_id  INT           DEFAULT NULL,
  position         ENUM('PG', 'SG', 'SF', 'PF', 'C', 'Not apply'), #should be a multi-valued attribute
  draft_year       YEAR          DEFAULT '0000' CHECK (draft_year>=1947), #the first nba draft
  PRIMARY KEY (p_id),
  FOREIGN KEY (current_team_id) REFERENCES team (team_id)
);
INSERT INTO player(pname, bday, weight, height, current_team_id, position, draft_year, award) VALUES
("Kyle Kuzma", '1995-07-24', 220, 81, 3, 'PF', '2017', DEFAULT),
("Kentavious Caldwell-Pope", '1993-02-18',205,78,3,'SG','2013',DEFAULT),
("Isaiah Thomas",'1989-02-07',185,69,3,'PG','2011',DEFAULT),
("Brook Lopez",'1988-04-01',268,84,3,'C','2008',DEFAULT),
("Brandon Ingram",'1997-09-02',190,81,3,'SF','2016',DEFAULT),
("Stephen Curry", '1988-03-14', 190, 75, 4, 'PG', '2009', "2×champion, 2×MVP"),
("JaVale McGee", '1988-01-19',270,84,4,'C','2008',"1×champion"),
("Nick Young",'1985-06-01',210,79,4,'SG','2007',DEFAULT),
("Kevin Durant",'1988-09-29',240,81,4,'SF','2007', "1×champion, 1×FMVP, 1×MVP"),
("DeAndre Jordan", '1988-07-21', 265, 83, 5, 'C', '2008', DEFAULT),
("James Harden", '1989-08-26', 220, 77, 6, 'SG', '2009', DEFAULT),
("Manu Ginobili", '1977-07-28', 205, 78, 7, 'SG', '1999', "4×champion"),
("ME", '1993-11-09', 176, 68, NULL, 'Not apply', DEFAULT, DEFAULT);
#################### assistant coach weak entity (multi-attr pk) ##########################
#referee of each game
#https://www.basketball-reference.com/referees/
#assistant coach / staff of each team
#player of each team
#FOREIGN KEY (current_team_id) REFERENCES team (team_id) ,
#CONSTRAINT PK_coach PRIMARY KEY (c_id,current_team_id)
#################### coach entity ##########################
#https://en.wikipedia.org/wiki/List_of_current_National_Basketball_Association_head_coaches
DROP TABLE IF EXISTS head_coach;
CREATE TABLE head_coach (
  c_id             INT           NOT NULL AUTO_INCREMENT,
  cname            varchar(50)   NOT NULL,
  begin_year       YEAR          DEFAULT '0000',
  win              INT           DEFAULT 0,
  lose             INT           DEFAULT 0,
  current_team_id  INT           DEFAULT 1,
  PRIMARY KEY (c_id),
  FOREIGN KEY (current_team_id) REFERENCES team (team_id)
);
INSERT INTO head_coach(cname, begin_year, win, lose, current_team_id) VALUES
("Steve Kerr", '2014', 265, 63, 4),
("Luke Walton", '2016', 162, 60, 3),
("Doc Rivers", '1999', 1469, 846, 5);
INSERT INTO head_coach(cname) VALUES ("ME");
############### game entity (recursive relation @ home/guest teams) #################
DROP TABLE IF EXISTS game;
CREATE TABLE game (
  game_id          INT            NOT NULL AUTO_INCREMENT,
  date             DATE           DEFAULT '0000-00-00',
#  referees        varchar(250)   NOT NULL,
  game_type        ENUM('regular', 'play-off', 'preseason', 'all-star'),
  home_team_id     INT            DEFAULT 1,
  guest_team_id    INT            DEFAULT 1,
  home_score       INT            DEFAULT 0,
  guest_score      INT            DEFAULT 0,
  FOREIGN KEY (home_team_id) REFERENCES team (team_id) ,
  FOREIGN KEY (guest_team_id) REFERENCES team (team_id) ,
  PRIMARY KEY (game_id)
);
# Dec 22, 2017 - LAL106 @ GSW113 # https://stats.nba.com/game/0021700479/
INSERT INTO game(date, game_type, home_team_id, guest_team_id, home_score, guest_score)
VALUES ('2017-12-22', 'regular', 4, 3, 106,113);
# Dec 29, 2017 - LAL106 vs. LAC121 # https://stats.nba.com/game/0021700529/
INSERT INTO game(date, game_type, home_team_id, guest_team_id, home_score, guest_score)
VALUES ('2017-12-29', 'regular', 3, 5, 121,106);
# Feb 22, 2018 - GSW134 vs. LAC127 #https://stats.nba.com/game/0021700872/
INSERT INTO game(date, game_type, home_team_id, guest_team_id, home_score, guest_score)
VALUES ('2018-02-22', 'regular', 4, 5, 134,127);
############################# Statics (m-n relation of players & games) ##################################
DROP TABLE IF EXISTS stats;
CREATE TABLE stats (
  game_id          INT            NOT NULL,
  p_id             INT            NOT NULL,
  time             TIME           DEFAULT 0000 CHECK(time<=4800),
  PTS              INT            DEFAULT 0,
  FGM              INT            DEFAULT 0,
  FGA              INT            DEFAULT 0 CHECK(FGA>=FGM),
  3PM              INT            DEFAULT 0,
  3PA              INT            DEFAULT 0 CHECK(3PA>=3PM),
  FTM              INT            DEFAULT 0,
  FTA              INT            DEFAULT 0 CHECK(FTA>=FTM),
  OREB             INT            DEFAULT 0,
  DREB             INT            DEFAULT 0,
  STL              INT            DEFAULT 0,
  AST              INT            DEFAULT 0,
  TOV              INT            DEFAULT 0,
  BLK              INT            DEFAULT 0,
  PF               INT            DEFAULT 0 CHECK(PF<=6),
  FOREIGN KEY (game_id) REFERENCES game (game_id) ,
  FOREIGN KEY (p_id) REFERENCES player (p_id)
);
# INSERT INTO stats (game_id, p_id, time, PTS, FGM, FGA, 3PM, 3PA, FTM, FTA, OREB, DREB, AST, TOV, STL, BLK, PF)
INSERT INTO stats VALUES
(3, 10, 3133, 16, 5, 7, DEFAULT, DEFAULT, 6, 6, 5, 9, 3, 4, 3, 3, 1),
(3, 6, 3708, 44, 14, 19, 8, 11, 8, 8, 1, 5, 10, 4, 2, 0, 4),
(1, 1, 4258, 27, 9, 15, 3, 6, 6, 8, 3, 11, 1, 3, 2, 1, 3);
############################# Result print out ##################################
Show tables;
show create table arena;
select * from arena;
show create table team;
select * from team;
show create table player;
select * from player;
show create table head_coach;
select * from head_coach;
show create table game;
select * from game;
show create table stats;
select * from stats;
############################# END ##################################
#DROP DATABASE NBA_Stats;
#notee
