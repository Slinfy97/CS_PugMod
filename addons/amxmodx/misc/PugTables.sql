CREATE TABLE IF NOT EXISTS pug_players
(
	steam VARCHAR(35) NOT NULL DEFAULT '',
	name VARCHAR(32) NOT NULL DEFAULT '',
	length INT NOT NULL DEFAULT 0,
	unban VARCHAR(32) NOT NULL DEFAULT '',
	reason VARCHAR(128) NOT NULL DEFAULT '',
	banned SMALLINT NOT NULL DEFAULT 0,
	leaves SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY (steam)
);

CREATE TABLE IF NOT EXISTS pug_stats
(
	steam VARCHAR(35) NOT NULL DEFAULT '',
	kills SMALLINT NOT NULL DEFAULT 0,
	assists SMALLINT NOT NULL DEFAULT 0,
	deaths SMALLINT NOT NULL DEFAULT 0,
	headshots SMALLINT NOT NULL DEFAULT 0,
	shots SMALLINT NOT NULL DEFAULT 0,
	hits SMALLINT NOT NULL DEFAULT 0,
	damage SMALLINT NOT NULL DEFAULT 0,
	rws FLOAT NOT NULL DEFAULT 0.0,
	rounds SMALLINT NOT NULL DEFAULT 0,
	rounds_lose SMALLINT NOT NULL DEFAULT 0,
	rounds_win SMALLINT NOT NULL DEFAULT 0,
	matchs SMALLINT NOT NULL DEFAULT 0,
	matchs_lose SMALLINT NOT NULL DEFAULT 0,
	matchs_win SMALLINT NOT NULL DEFAULT 0,
	rank SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY (steam),
	FOREIGN KEY (steam) REFERENCES pug_players(steam)
);

CREATE TABLE IF NOT EXISTS pug_bomb
(
	steam VARCHAR(35) NOT NULL DEFAULT '',
	defuses SMALLINT NOT NULL DEFAULT 0,
	defused SMALLINT NOT NULL DEFAULT 0,
	plants SMALLINT NOT NULL DEFAULT 0,
	explosions SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY (steam),
	FOREIGN KEY (steam) REFERENCES pug_players(steam)
);

CREATE TABLE IF NOT EXISTS pug_streak
(
	steam VARCHAR(35) NOT NULL DEFAULT '',
	1k SMALLINT NOT NULL DEFAULT 0,
	2k SMALLINT NOT NULL DEFAULT 0,
	3k SMALLINT NOT NULL DEFAULT 0,
	4k SMALLINT NOT NULL DEFAULT 0,
	5k SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY (steam),
	FOREIGN KEY (steam) REFERENCES pug_players(steam)
);

CREATE TABLE IF NOT EXISTS pug_versus
(
	steam VARCHAR(35) NOT NULL DEFAULT '',
	v1 SMALLINT NOT NULL DEFAULT 0,
	v2 SMALLINT NOT NULL DEFAULT 0,
	v3 SMALLINT NOT NULL DEFAULT 0,
	v4 SMALLINT NOT NULL DEFAULT 0,
	v5 SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY (steam),
	FOREIGN KEY (steam) REFERENCES pug_players(steam)
);

CREATE TABLE IF NOT EXISTS pug_misc
(
	steam VARCHAR(35) NOT NULL DEFAULT '',
	acc FLOAT NOT NULL DEFAULT 0.0,
	eff FLOAT NOT NULL DEFAULT 0.0,
	hsp FLOAT NOT NULL DEFAULT 0.0,
	adr FLOAT NOT NULL DEFAULT 0.0,
	fpr FLOAT NOT NULL DEFAULT 0.0,
	kdr FLOAT NOT NULL DEFAULT 0.0,
	skl FLOAT NOT NULL DEFAULT 0.0,
	rws FLOAT NOT NULL DEFAULT 0.0,
	PRIMARY KEY (steam),
	FOREIGN KEY (steam) REFERENCES pug_players(steam)
);

CREATE TABLE IF NOT EXISTS pug_weapon
(
	id INT NOT NULL AUTO_INCREMENT,
	weapon SMALLINT NOT NULL DEFAULT 0,
	string VARCHAR(32) NOT NULL DEFAULT '',
	kills SMALLINT NOT NULL DEFAULT 0,
	deaths SMALLINT NOT NULL DEFAULT 0,
	headshots SMALLINT NOT NULL DEFAULT 0,
	shots SMALLINT NOT NULL DEFAULT 0,
	hits SMALLINT NOT NULL DEFAULT 0,
	damage SMALLINT NOT NULL DEFAULT 0,
	steam VARCHAR(35) NOT NULL DEFAULT '',
	PRIMARY KEY (id),
	FOREIGN KEY (steam) REFERENCES pug_players(steam)
);

CREATE TABLE IF NOT EXISTS pug_match
(
	id INT NOT NULL AUTO_INCREMENT,
	server VARCHAR(32) NOT NULL DEFAULT '',
	ip VARCHAR(32) NOT NULL DEFAULT '',
	map VARCHAR(32) NOT NULL DEFAULT '',
	score1 SMALLINT NOT NULL DEFAULT 0,
	score2 SMALLINT NOT NULL DEFAULT 0,
	rounds SMALLINT NOT NULL DEFAULT 0,
	date DATETIME NOT NULL DEFAULT NOW(),
	seconds FLOAT NOT NULL DEFAULT 0.0,
	duration VARCHAR(32) NOT NULL DEFAULT '',
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS pug_match_stats
(
	id INT NOT NULL AUTO_INCREMENT,
	steam VARCHAR(35) NOT NULL DEFAULT '',
	kills SMALLINT NOT NULL DEFAULT 0,
	assists SMALLINT NOT NULL DEFAULT 0,
	deaths SMALLINT NOT NULL DEFAULT 0,
	headshots SMALLINT NOT NULL DEFAULT 0,
	shots SMALLINT NOT NULL DEFAULT 0,
	hits SMALLINT NOT NULL DEFAULT 0,
	damage SMALLINT NOT NULL DEFAULT 0,
	rws FLOAT NOT NULL DEFAULT 0.0,
	rounds SMALLINT NOT NULL DEFAULT 0,
	rounds_lose SMALLINT NOT NULL DEFAULT 0,
	rounds_win SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES pug_match(id),
	FOREIGN KEY (steam) REFERENCES pug_players(steam)
);