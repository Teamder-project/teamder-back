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

