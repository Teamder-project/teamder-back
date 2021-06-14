#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
DROP SCHEMA IF EXISTS `teamder`;
CREATE SCHEMA `teamder` DEFAULT CHARACTER SET utf8;
USE `teamder`;
#------------------------------------------------------------
# Table: GAMER
#------------------------------------------------------------

CREATE TABLE GAMER(
        id       Int  Auto_increment NOT NULL,
        username Varchar (255),
        password Varchar (255),
        email    Varchar (255),
        birthday Date,
        gender   Varchar (255),
        country  Varchar (255),
        avatar   Longtext
	,CONSTRAINT GAMER_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GROUP_CHAT
#------------------------------------------------------------

CREATE TABLE GROUP_CHAT(
        id       Int  Auto_increment NOT NULL,
        name     Varchar (255),
        logo     Varchar (255),
        id_GAMER Int
	,CONSTRAINT GROUP_CHAT_PK PRIMARY KEY (id)

	,CONSTRAINT GROUP_CHAT_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES GAMER(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: LANGUAGE
#------------------------------------------------------------

CREATE TABLE LANGUAGE(
        id       Int  Auto_increment NOT NULL,
        language Varchar (255)
	,CONSTRAINT LANGUAGE_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: FRIEND_CHAT
#------------------------------------------------------------

CREATE TABLE FRIEND_CHAT(
        id         Int  Auto_increment NOT NULL,
        message    Text,
        time       Datetime,
        id_GAMER   Int,
        id_2_GAMER Int
	,CONSTRAINT FRIEND_CHAT_PK PRIMARY KEY (id)

    ,CONSTRAINT FRIEND_CHAT_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES GAMER(id)
    ,CONSTRAINT FRIEND_CHAT_GAMER_FK_2 FOREIGN KEY (id_2_GAMER) REFERENCES GAMER(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: FRIEND
#------------------------------------------------------------

CREATE TABLE FRIEND(
        id         Int  Auto_increment NOT NULL,
        date_match Datetime,
        id_GAMER   Int,
        id_2_GAMER Int
	,CONSTRAINT FRIEND_PK PRIMARY KEY (id)

    ,CONSTRAINT FRIEND_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES GAMER(id)
    ,CONSTRAINT FRIEND_GAMER_FK_2 FOREIGN KEY (id_2_GAMER) REFERENCES GAMER(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: FRIEND_REQUEST
#------------------------------------------------------------

CREATE TABLE FRIEND_REQUEST(
        id           Int  Auto_increment NOT NULL,
        date_request Datetime,
        id_GAMER     Int,
        id_2_GAMER   Int
	,CONSTRAINT FRIEND_REQUEST_PK PRIMARY KEY (id)

    ,CONSTRAINT FRIEND_REQUEST_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES GAMER(id)
    ,CONSTRAINT FRIEND_REQUEST_GAMER_FK_2 FOREIGN KEY (id_2_GAMER) REFERENCES GAMER(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: RATING
#------------------------------------------------------------

CREATE TABLE RATING(
        id         Int  Auto_increment NOT NULL,
        rating     Int,
        id_GAMER   Int,
        id_2_GAMER Int
	,CONSTRAINT RATING_PK PRIMARY KEY (id)

    ,CONSTRAINT RATING_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES GAMER(id)
    ,CONSTRAINT RATING_GAMER_FK_2 FOREIGN KEY (id_2_GAMER) REFERENCES GAMER(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GROUP_CHAT_MESSAGE
#------------------------------------------------------------

CREATE TABLE GROUP_CHAT_MESSAGE(
        id            Int  Auto_increment NOT NULL,
        message       Text,
        time          Datetime,
        id_GAMER      Int,
        id_GROUP_CHAT Int
	,CONSTRAINT GROUP_CHAT_MESSAGE_PK PRIMARY KEY (id)

	,CONSTRAINT GROUP_CHAT_MESSAGE_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES GAMER(id)
	,CONSTRAINT GROUP_CHAT_MESSAGE_GROUP_CHAT0_FK FOREIGN KEY (id_GROUP_CHAT) REFERENCES GROUP_CHAT(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GAMER_GROUP_CHAT
#------------------------------------------------------------

CREATE TABLE GAMER_GROUP_CHAT(
        id            Int  Auto_increment NOT NULL,
        date_add      Datetime,
        id_GAMER      Int,
        id_GROUP_CHAT Int
	,CONSTRAINT GAMER_GROUP_CHAT_PK PRIMARY KEY (id)

	,CONSTRAINT GAMER_GROUP_CHAT_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES GAMER(id)
	,CONSTRAINT GAMER_GROUP_CHAT_GROUP_CHAT0_FK FOREIGN KEY (id_GROUP_CHAT) REFERENCES GROUP_CHAT(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GAMER_LANGUAGE
#------------------------------------------------------------

CREATE TABLE GAMER_LANGUAGE(
        id          Int  Auto_increment NOT NULL,
        id_LANGUAGE Int,
        id_GAMER    Int
	,CONSTRAINT GAMER_LANGUAGE_PK PRIMARY KEY (id)

	,CONSTRAINT GAMER_LANGUAGE_LANGUAGE_FK FOREIGN KEY (id_LANGUAGE) REFERENCES LANGUAGE(id)
	,CONSTRAINT GAMER_LANGUAGE_GAMER0_FK FOREIGN KEY (id_GAMER) REFERENCES GAMER(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GAME
#------------------------------------------------------------

CREATE TABLE GAME(
        id       Int  Auto_increment NOT NULL,
        name     Varchar (255),
        alias    Varchar (255),
        editor   Varchar (255),
        released Date
	,CONSTRAINT GAME_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GAME_PROFILE
#------------------------------------------------------------

CREATE TABLE GAME_PROFILE(
        id            Int  Auto_increment NOT NULL,
        nickname_game Varchar (255),
        goals         Varchar (255),
        schedule      Varchar (255),
        description   Text,
        id_GAMER      Int,
        id_GAME       Int
	,CONSTRAINT GAME_PROFILE_PK PRIMARY KEY (id)

	,CONSTRAINT GAME_PROFILE_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES GAMER(id)
	,CONSTRAINT GAME_PROFILE_GAME0_FK FOREIGN KEY (id_GAME) REFERENCES GAME(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SWIPE
#------------------------------------------------------------

CREATE TABLE SWIPE(
        id                Int  Auto_increment NOT NULL,
        state             Bool,
        id_GAME_PROFILE   Int,
        id_2_GAME_PROFILE Int
	,CONSTRAINT SWIPE_PK PRIMARY KEY (id)

    ,CONSTRAINT SWIPE_GAME_PROFILE_FK FOREIGN KEY (id_GAME_PROFILE) REFERENCES GAME_PROFILE(id)
    ,CONSTRAINT SWIPE_GAME_PROFILE_FK_2 FOREIGN KEY (id_2_GAME_PROFILE) REFERENCES GAME_PROFILE(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: FRIEND_GAME
#------------------------------------------------------------

CREATE TABLE FRIEND_GAME(
        id        Int  Auto_increment NOT NULL,
        id_FRIEND Int,
        id_GAME   Int
	,CONSTRAINT FRIEND_GAME_PK PRIMARY KEY (id)

	,CONSTRAINT FRIEND_GAME_FRIEND_FK FOREIGN KEY (id_FRIEND) REFERENCES FRIEND(id)
	,CONSTRAINT FRIEND_GAME_GAME0_FK FOREIGN KEY (id_GAME) REFERENCES GAME(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GAMER_EDIT
#------------------------------------------------------------

CREATE TABLE GAMER_EDIT(
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

	,CONSTRAINT GAMER_EDIT_GAMER_FK FOREIGN KEY (id_GAMER) REFERENCES GAMER(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GAME_PROFILE_EDIT
#------------------------------------------------------------

CREATE TABLE GAME_PROFILE_EDIT(
        id              Int  Auto_increment NOT NULL,
        nickname_game   Varchar (255),
        goals           Varchar (255),
        schedule        Varchar (255),
        description     Text,
        date_edit       Datetime,
        id_GAME_PROFILE Int
	,CONSTRAINT GAME_PROFILE_EDIT_PK PRIMARY KEY (id)

	,CONSTRAINT GAME_PROFILE_EDIT_GAME_PROFILE_FK FOREIGN KEY (id_GAME_PROFILE) REFERENCES GAME_PROFILE(id)
)ENGINE=InnoDB;

