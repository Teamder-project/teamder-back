#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
DROP SCHEMA IF EXISTS `teamder`;
CREATE SCHEMA `teamder` DEFAULT CHARACTER SET utf8;
USE `teamder`;
#------------------------------------------------------------
# Table: gamer
#------------------------------------------------------------

CREATE TABLE gamer(
        id       Int  Auto_increment NOT NULL,
        username Varchar (255),
        password Varchar (255),
        email    Varchar (255),
        birthday Date,
        gender   Varchar (255),
        country  Varchar (255),
        avatar   Longtext
	,CONSTRAINT gamer_pk PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: group_chat
#------------------------------------------------------------

CREATE TABLE group_chat(
        id       Int  Auto_increment NOT NULL,
        name     Varchar (255),
        logo     Varchar (255),
        id_GAMER Int
	,CONSTRAINT group_chat_PK PRIMARY KEY (id)

	,CONSTRAINT group_chat_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES gamer(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: language
#------------------------------------------------------------

CREATE TABLE language(
        id       Int  Auto_increment NOT NULL,
        language Varchar (255)
	,CONSTRAINT LANGUAGE_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: friend_chat
#------------------------------------------------------------

CREATE TABLE friend_chat(
        id         Int  Auto_increment NOT NULL,
        message    Text,
        time       Datetime,
        id_GAMER   Int,
        id_2_GAMER Int
	,CONSTRAINT friend_chat_PK PRIMARY KEY (id)

    ,CONSTRAINT friend_chat_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES gamer(id)
    ,CONSTRAINT friend_chat_GAMER_FK_2 FOREIGN KEY (id_2_GAMER) REFERENCES gamer(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: friend
#------------------------------------------------------------

CREATE TABLE friend(
        id         Int  Auto_increment NOT NULL,
        date_match Datetime,
        id_GAMER   Int,
        id_2_GAMER Int
	,CONSTRAINT friend_PK PRIMARY KEY (id)

    ,CONSTRAINT friend_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES gamer(id)
    ,CONSTRAINT friend_GAMER_FK_2 FOREIGN KEY (id_2_GAMER) REFERENCES gamer(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: friend_request
#------------------------------------------------------------

CREATE TABLE friend_request(
        id           Int  Auto_increment NOT NULL,
        date_request Datetime,
        id_GAMER     Int,
        id_2_GAMER   Int
	,CONSTRAINT friend_request_PK PRIMARY KEY (id)

    ,CONSTRAINT friend_request_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES gamer(id)
    ,CONSTRAINT friend_request_GAMER_FK_2 FOREIGN KEY (id_2_GAMER) REFERENCES gamer(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: rating
#------------------------------------------------------------

CREATE TABLE rating(
        id         Int  Auto_increment NOT NULL,
        rating     Int,
        id_GAMER   Int,
        id_2_GAMER Int
	,CONSTRAINT rating_PK PRIMARY KEY (id)

    ,CONSTRAINT rating_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES gamer(id)
    ,CONSTRAINT rating_GAMER_FK_2 FOREIGN KEY (id_2_GAMER) REFERENCES gamer(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: group_chat_message
#------------------------------------------------------------

CREATE TABLE group_chat_message(
        id            Int  Auto_increment NOT NULL,
        message       Text,
        time          Datetime,
        id_GAMER      Int,
        id_group_chat Int
	,CONSTRAINT group_chat_message_PK PRIMARY KEY (id)

	,CONSTRAINT group_chat_message_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES gamer(id)
	,CONSTRAINT group_chat_message_group_chat0_FK FOREIGN KEY (id_GROUP_CHAT) REFERENCES group_chat(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: gamer_group_chat
#------------------------------------------------------------

CREATE TABLE gamer_group_chat(
        id            Int  Auto_increment NOT NULL,
        date_add      Datetime,
        id_GAMER      Int,
        id_group_chat Int
	,CONSTRAINT GAMER_group_chat_PK PRIMARY KEY (id)

	,CONSTRAINT GAMER_group_chat_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES gamer(id)
	,CONSTRAINT GAMER_group_chat_group_chat0_FK FOREIGN KEY (id_GROUP_CHAT) REFERENCES group_chat(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: gamer_language
#------------------------------------------------------------

CREATE TABLE gamer_language(
        id          Int  Auto_increment NOT NULL,
        id_LANGUAGE Int,
        id_GAMER    Int
	,CONSTRAINT GAMER_LANGUAGE_PK PRIMARY KEY (id)

	,CONSTRAINT GAMER_LANGUAGE_LANGUAGE_FK FOREIGN KEY (id_LANGUAGE) REFERENCES language(id)
	,CONSTRAINT GAMER_LANGUAGE_GAMER0_FK FOREIGN KEY (id_GAMER) REFERENCES gamer(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: game
#------------------------------------------------------------

CREATE TABLE game(
        id       Int  Auto_increment NOT NULL,
        name     Varchar (255),
        alias    Varchar (255),
        editor   Varchar (255),
        released Date
	,CONSTRAINT GAME_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: game_profile
#------------------------------------------------------------

CREATE TABLE game_profile(
        id            Int  Auto_increment NOT NULL,
        nickname_game Varchar (255),
        goals         Varchar (255),
        schedule      Varchar (255),
        description   Text,
        id_GAMER      Int,
        id_GAME       Int
	,CONSTRAINT GAME_PROFILE_PK PRIMARY KEY (id)

	,CONSTRAINT GAME_PROFILE_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES gamer(id)
	,CONSTRAINT GAME_PROFILE_GAME0_FK FOREIGN KEY (id_GAME) REFERENCES game(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: swipe
#------------------------------------------------------------

CREATE TABLE swipe(
        id                Int  Auto_increment NOT NULL,
        state             Bool,
        id_GAME_PROFILE   Int,
        id_2_GAME_PROFILE Int
	,CONSTRAINT SWIPE_PK PRIMARY KEY (id)

    ,CONSTRAINT SWIPE_GAME_PROFILE_FK FOREIGN KEY (id_GAME_PROFILE) REFERENCES game_profile(id)
    ,CONSTRAINT SWIPE_GAME_PROFILE_FK_2 FOREIGN KEY (id_2_GAME_PROFILE) REFERENCES game_profile(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: friend_game
#------------------------------------------------------------

CREATE TABLE friend_game(
        id        Int  Auto_increment NOT NULL,
        id_friend Int,
        id_GAME   Int
	,CONSTRAINT friend_GAME_PK PRIMARY KEY (id)

	,CONSTRAINT friend_GAME_friend_FK FOREIGN KEY (id_friend) REFERENCES friend(id)
	,CONSTRAINT friend_GAME_GAME0_FK FOREIGN KEY (id_GAME) REFERENCES game(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: gamer_edit
#------------------------------------------------------------

CREATE TABLE gamer_edit(
        id        Int  Auto_increment NOT NULL,
        username  Varchar (255),
        password  Varchar (255),
        email     Varchar (255),
        birthday  Date,
        gender    Varchar (255),
        country   Varchar (255),
        avatar    Longtext,
        date_edit Datetime,
        id_GAMER  Int
	,CONSTRAINT GAMER_EDIT_PK PRIMARY KEY (id)

	,CONSTRAINT GAMER_EDIT_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES gamer(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: game_profile_edit
#------------------------------------------------------------

CREATE TABLE game_profile_edit(
        id              Int  Auto_increment NOT NULL,
        nickname_game   Varchar (255),
        goals           Varchar (255),
        schedule        Varchar (255),
        description     Text,
        date_edit       Datetime,
        id_GAME_PROFILE Int
	,CONSTRAINT GAME_PROFILE_EDIT_PK PRIMARY KEY (id)

	,CONSTRAINT GAME_PROFILE_EDIT_GAME_PROFILE_FK FOREIGN KEY (id_GAME_PROFILE) REFERENCES game_profile(id)
)ENGINE=InnoDB;
#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
INSERT INTO `teamder`.`game` (`id`, `name`, `editor`, `released`, `alias`) 
	VALUES 
    ('1', 'League Of Legends', 'Riot Games', '2009-10-27', 'lol'),
	('2', 'Apex Legends', 'Respawn Entertainment', '2019-02-04', 'apex'),
    ('3', 'Rocket League', 'Psyonix', '2015-07-07', 'rl'),
    ('4', 'Counter Strike : Global Offensive', 'Valve', '2012-08-21', 'csgo');

INSERT INTO `teamder`.`gamer` (`id`, `username`, `password`, `email`, `birthday`, `gender`, `country`, `avatar`) 
	VALUES 
		('1', 'Juju', 'juju', 'juju@juju.com', '1994-09-11', 'F', 'France','katarina'),
		('2', 'Max', 'max', 'max@max.com', '1992-01-01', 'M', 'France', 'teemo'),
		('3', 'Math', 'math', 'math@math.com', '1998-01-01', 'M', 'France', 'teemo'),
		('4', 'Lutyz', '12345', 'Lutyz@gmail.com', '1998-11-13', 'Homme', 'France', 'ahri'),
		('5', 'BeatrixKuddo', 'bea', 'bea@bea.com', '1970-04-29', 'F', 'US','katarina'),
		('6', 'DalaiLama', 'dalai', 'dalai@dalai.com', '1391-01-01', 'M', 'Tibet', 'default'),
		('7', 'L\'Elfe', 'elfe', 'elfe@elfe', '2001-01-01', 'F', 'France','ahri'),
		('8', 'Tenshirock', 'ten', 'ten@ten.com', '2008-11-07', 'F', 'France','ak47-cs'),
		('9', 'Smourbiff', 'smour', 'smour@smour.com', '2010-01-01', 'NR', 'France', 'teemo'),
		('10', 'Twix-dte', 'twix', 'twix-dte@twix.com', '1967-01-01', 'NR', 'US','trainee-rl'),
		('11', 'Twix-gche', 'twix', 'twix-gche@twix.com', '1967-01-01', 'NR', 'US','trainee-rl'),
		('12', 'Totoro', 'toto', 'totoro@totoro.com', '1988-04-16', 'NR', 'Japon','teemo'),
		('13', 'Schumacher', 'schumi', 'schumi@schumi.com', '1969-01-03', 'M', 'Deutschland', 'masamune'),
		('14', 'Zizou', 'zizou', 'zizou@zizou.com', '1972-06-23', 'M', 'France','masamune'),
		('15', 'Hitman', 'hit', 'hit@hit.com', '2000-01-01', 'M', 'Danemark','ak47-cs'),
		('16', 'Lapin', 'lapin', 'lapin@lapin.com', '1900-01-01', 'NR', 'France','katarina');

INSERT INTO game_profile (nickname_game, goals, schedule, description, id_GAMER, id_GAME) 
	VALUES 
    ('Jiujiu', 'Chill', 'samedi matin', 'Cherche mate pour ranked sans se prendre la tête, niveau silver-gold. Joue à tous les postes sauf mid', '1', '1'),
    ('Killeuse', 'Kill', 'tout le temps', 'Cherche mate pour la gagne', '5', '4'),
    ('Elfe', 'Chill', 'tout le temps', 'Cherche mate pour jouer et faire des rencontres. A l\'aventure, compagnons ! Nain non souhaité. Niveau débutant.', '7', '1'),
    ('Elfe', 'Chill', 'tout le temps', 'Cherche mate pour jouer et faire des rencontres. A l\'aventure, compagnons ! Nain non souhaité. Niveau débutant.', '7', '2'),
    ('Elfe', 'Chill', 'tout le temps', 'Cherche mate pour jouer et faire des rencontres. A l\'aventure, compagnons ! Nain non souhaité. Niveau débutant.', '7', '3'),
    ('Elfe', 'Chill', 'tout le temps', 'Cherche mate pour jouer et faire des rencontres. A l\'aventure, compagnons ! Nain non souhaité. Niveau débutant.', '7', '4'),
    ('Twix-droit', 'Troll', 'lundi, mercredi', 'Cherche mate pour m\'amuser, troller et me payer une bonne tranche de rire. Humour obligatoire.', '10', '1'),
    ('Twix-droit', 'Troll', 'lundi, mercredi', 'Cherche mate pour m\'amuser, troller et me payer une bonne tranche de rire. Humour obligatoire.', '10', '2'),
    ('Twix-gauche', 'Troll', 'lundi, mercredi', 'Cherche mate pour m\'amuser, troller et me payer une bonne tranche de rire. Humour obligatoire.', '11', '1'),
    ('Twix-gauche', 'Troll', 'lundi, mercredi', 'Cherche mate pour m\'amuser, troller et me payer une bonne tranche de rire. Humour obligatoire.', '11', '2');