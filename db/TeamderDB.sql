#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
DROP SCHEMA IF EXISTS `teamder`;
CREATE SCHEMA `teamder` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
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


#------------------------------------------------------------
#               Jeu de données
#-------------------------------------------------------------

#jeux disponibles
INSERT INTO `teamder`.`game` (`id`, `name`, `editor`, `released`, `alias`) 
	VALUES 
        ('1', 'League Of Legends', 'Riot Games', '2009-10-27', 'lol'),
        ('2', 'Apex Legends', 'Respawn Entertainment', '2019-02-04', 'apex'),
        ('3', 'Rocket League', 'Psyonix', '2015-07-07', 'rl'),
        ('4', 'Counter Strike : Global Offensive', 'Valve', '2012-08-21', 'csgo');

#comptes disponibles : permet de se connecter
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
	('16', 'Lapin', 'lapin', 'lapin@lapin.com', '1900-01-01', 'NR', 'France','katarina'),
        ('17', 'LaMadre', 'madre', 'madre@madre.com', '1994-09-11','F', 'France', 'teemo'),
        ('18', 'LePadre', 'padre', 'padre@padre.com', '1998-01-01', 'M', 'France', 'teemo'),
	('19', 'Revy', 'revy', 'revy@revy.com', '2003-01-01', 'M', 'France', 'ak47-cs'),
        ('20', 'Ashitaka', 'ashi', 'ashi@ashi.com', '1980-01-01', 'M', 'Jap', 'trainee-rl'),
        ('21', 'San', 'san', 'san@san.com', '1980-01-01', 'F', 'Jap', 'trainee-rl'),
        ('22', 'Chihiro', 'chihi', 'chihi@chihi.com', '1975-01-01', 'F', 'Jap', 'teemo'),
        ('23', 'Aku', 'aku', 'aku@aku.com', '1980-01-01', 'M', 'Jap', 'masamune'),
        ('24', 'Anneke', 'anne', 'anne@anne.com', '1973-03-08', 'F', 'Pays-Bas', 'trainee-rl'),
        ('25', 'Floor', 'floor', 'floor@floor.com', '1981-02-21', 'F', 'Pays-Bas', 'katarina'),
        ('26', 'Tarja', 'tarja', 'tarja@tarja.com', '1977-08-17', 'F', 'Finland', 'trainee-rl'),
        ('27', 'Agnetha', 'agne', 'agne@agne.com', '1950-04-05', 'M', 'Jap', 'masamune'),
        ('28', 'Marco', 'marco', 'marko@marko.com', '1966-01-14', 'M', 'Finland', 'default'),
        ('29', 'Docker', 'docker', 'docker@docker.com', '2000-09-19', 'NR', 'USA', 'default'),
        ('30', 'Frida', 'frida', 'frida@frida.com', '1945-11-15', 'F', 'Norway', 'trainee-rl'),
        ('31', 'Benny', 'benny', 'benny@benny.com', '1946-12-16', 'M', 'Suede', 'trainee-rl'),
        ('32', 'Bjorn', 'bjorn', 'bjorn@bjorn.com', '1945-05-25', 'M', 'Suede', 'trainee-rl'),
        ('33', 'Bill', 'bill', 'bill@bill.com', '1955-10-28', 'M', 'USA', 'pathfinder'),
        ('34', 'Pong', 'pong', 'pong@pong.com', '1972-11-29', 'NR', 'USA', 'default'),
        ('35', 'Pac-Man', 'pac', 'pac@pac.com', '1980-05-22', 'NR', 'Jap', 'default'),
        ('36', 'Mario', 'mario', 'mario@mario.com', '1981-01-01', 'M', 'Jap', 'default'),
        ('37', 'Ben', 'ben', 'ben@ben.com', '1946-12-16', 'M', 'Suede', 'trainee-rl'),
        ('38', 'John', 'john', 'john@john.com', '1940-10-09', 'M', 'England', 'multicolor-cs'),
        ('39', 'Paul', 'paul', 'paul@paul.com', '1942-06-18', 'M', 'England', 'multicolor-cs'),
        ('40', 'George', 'geo', 'geo@geo.com', '1943-02-25', 'M', 'England', 'multicolor-cs'),
        ('41', 'Ringo', 'ringo', 'ringo@ringo.com', '1940-07-07', 'M', 'England', 'multicolor-cs'),
        ('42', 'Steve', 'steve', 'steve@steve.com', '1955-02-24', 'M', 'USA', 'multicolor-cs'),
        ('43', 'Hup', 'hup', 'hup@hup.com', '1983-03-01', 'M', 'England', 'octane-rl'),
        ('44', 'Peter', 'pet', 'pet@pet.com', '1984-06-08', 'M', 'US', 'mirage'),
        ('45', 'Raymond', 'ray', 'ray@ray.com', '1984-06-08', 'M', 'US', 'mirage'),
        ('46', 'Winston', 'win', 'win@win.com', '1984-06-08', 'M', 'US', 'mirage'),
        ('47', 'Egon', 'egon', 'egon@egon.com', '1984-06-08', 'M', 'US', 'mirage'),
        ('48', 'Dana', 'dana', 'dana@dana.com', '1984-06-08', 'F', 'US', 'mirage'),
        ('49', 'Slimer', 'slim', 'slim@slim.com', '1984-06-08', 'M', 'US', 'ahri'),
        ('50', 'Alien', 'alien', 'alien@alien.com', '1979-01-01', 'alien', 'US', 'trainee-rl'),
        ('51', 'Ripley', 'rep', 'rep@rep.com', '1979-01-01', 'F', 'US', 'octane'),
	('52', 'Ash', 'ash', 'ash@ash.com', '1979-01-01', 'droïde', 'US', 'default'),
        ('53', 'Newt', 'newt', 'newt@newt.com', '1986-01-01', 'F', 'US', 'ahri'),
	('54', 'Gandalf-leblanc', 'gdlfb', 'gdlfb@gdlfb.com', '1954-01-01', 'M', 'England', 'ekko'),
        ('55', 'Gandalf-legris', 'gdlfg', 'gdlfg@gdlfg.com', '1954-01-01', 'M', 'England', 'ekko'),
        ('56', 'Saruman', 'saru', 'saru@saru.com', '1954-01-01', 'M', 'England', 'ekko'),
        ('57', 'Bilbo', 'bilbo', 'bilbo@bilbo.com', '1954-01-01', 'M', 'England', 'ekko'),
        ('58', 'Frodo', 'frodo', 'frodo@frodo.com', '1954-01-01', 'M', 'England', 'ekko'),
        ('59', 'Sam', 'sam', 'sam@sam.com', '1954-01-01', 'M', 'England', 'ekko'),
        ('60', 'Gollum', 'gollum', 'gollum@gollum.com', '1954-01-01', 'M', 'England', 'teemo'),
        ('61', 'Aragorn', 'ara', 'ara@ara.com', '1954-01-01', 'M', 'England', 'yasuo'),
        ('62', 'Arwen', 'arwen', 'arwen@arwen.com', '1954-01-01', 'F', 'England', 'yasuo'),
	('63', 'Legolas', 'lego', 'lego@lego.com', '1954-01-01', 'M', 'England', 'yasuo'),
	('64', 'Ghimli', 'ghim', 'ghim@ghim.com', '1954-01-01', 'M', 'England', 'dragon-lore'),
        ('65', 'Sauron', 'sauron', 'sauron@sauron.com', '1954-01-01', 'M', 'England', 'dragon-lore'),
        ('66', 'Elrond', 'elrond', 'elrond@elrond.com', '1954-01-01', 'M', 'England', 'yasuo'),
        ('67', 'Faramir', 'fara', 'fara@fara.com', '1954-01-01', 'M', 'England', 'dragon-lore'),
        ('68', 'Galadriel', 'gala', 'gala@gal.com', '1954-01-01', 'F', 'England', 'ahri'),
	('69', 'Boromir', 'boro', 'boro@boro.com', '1954-01-01', 'M', 'England', 'yasuo'),
	('70', 'Wall-e', 'wall', 'wall@wall.com', '1998-01-01', 'droïde', 'USA', 'bloodhound'),
        ('71', 'Eve', 'eve', 'eve@eve.com', '1998-01-01', 'droïde', 'USA', 'bloodhound'),
        ('72', 'Harry', 'harry', 'harry@harry.com', '1997-06-27', 'M', 'England', 'map-cs'),
        ('73', 'Ron', 'ron', 'ron@ron.com', '1997-06-27', 'M', 'England', 'map-cs'),
        ('74', 'Hermione', 'hermione', 'hermione@hermione.com', '1997-06-27', 'F', 'England', 'bangalore'),
	('75', 'Ginny', 'ginny', 'ginny@ginny.com', '1997-06-27', 'F', 'England', 'bangalore'),
	('76', 'Luna', 'luna', 'luna@luna.com', '1997-06-27', 'F', 'England', 'bangalore'),
	('77', 'Nevil', 'nevil', 'nevil@nevil.com', '1997-06-27', 'M', 'England', 'map-cs'),
	('78', 'Drago', 'drago', 'drago@drago.com', '1997-06-27', 'M', 'England', 'map-cs'),
	('79', 'Dumbledore', 'dum', 'dum@dum.com', '1997-06-27', 'M', 'England', 'guitar'),
	('80', 'McGonagall', 'mc', 'mc@mc.com', '1997-06-27', 'F', 'England', 'bangalore');

#profils crees : permettent de tester le swipe
INSERT INTO `teamder`.`game_profile` (`nickname_game`, `goals`, `schedule`, `description`, `id_GAMER`, `id_GAME`)
        VALUES
                ('Jiujiu', 'Chill', 'samedi matin', 'Cherche mate pour ranked sans se prendre la tête, niveau silver-gold. Joue à tous les postes sauf mid', '1', '1'),
                ('Jiujiu', 'Troll', 'samedi après-midi', 'Cherche mate pour one-shot tout ce qui passe. Tir aux pigeons en vue.', '1', '4'),
		('DarkMax', 'Chill', 'En soirée', 'Le beau jeu, niveau gold. Joue à tous les postes sauf botlane', '2', '1'),
                ('Math', 'Try-hard', 'samedi après-midi', 'Cherche pote pour grimper master', '3', '4'),
                ('Lutyz', 'Try-hard', 'week-end', 'Cherche mate pour ranked gold-plat. Je suis midlaner', 4, 1),
                ('Lutyz', 'Try-hard', 'week-end', 'Cherche mate pour ranked Grand Champion.', 4, 3),
                ('Lutyz', 'Chill', 'week-end', 'Cherche mate pour ranked chill plat-diam. Je joue Octane ou Valkyrie', 4, 2),
                ('Killeuse', 'Kill', 'tout le temps', 'Cherche mate pour la gagne. Joue des assassins, préférence mid et jungle', '5', '1'),
                ('Killeuse', 'Kill', 'tout le temps', 'Cherche mate pour la gagne', '5', '4'),
                ('Maitre-zen', 'Try-hard', 'aujourd\'hui', 'Je décompresse online. Beaucoup de temps dispo', '6', '1'),
                ('Elfe', 'Chill', 'tout le temps', 'Cherche mate pour jouer et faire des rencontres. A l\'aventure, compagnons ! Nain non souhaité. Niveau débutant.', '7', '1'),
                ('Elfe', 'Chill', 'tout le temps', 'Cherche mate pour jouer et faire des rencontres. A l\'aventure, compagnons ! Nain non souhaité. Niveau débutant.', '7', '2'),
                ('Elfe', 'Chill', 'tout le temps', 'Cherche mate pour jouer et faire des rencontres. A l\'aventure, compagnons ! Nain non souhaité. Niveau débutant.', '7', '3'),
                ('Elfe', 'Chill', 'tout le temps', 'Cherche mate pour jouer egame_profilet faire des rencontres. A l\'aventure, compagnons ! Nain non souhaité. Niveau débutant.', '7', '4'),
                ('Tenshirock', 'Hack', 'tout le temps', 'Je viens pour vous hacker.', '8', '1'),
                ('Smourbiff', 'Chill', 'tout le temps', 'Pouki pouki pouki pouet', '9', '1'),
                ('Twix-droit', 'Troll', 'lundi, mercredi', 'Cherche mate pour m\'amuser, troller et me payer une bonne tranche de rire. Humour obligatoire.', '10', '1'),
                ('Twix-droit', 'Troll', 'lundi, mercredi', 'Cherche mate pour m\'amuser, troller et me payer une bonne tranche de rire. Humour obligatoire.', '10', '2'),
                ('Twix-gauche', 'Troll', 'lundi, mercredi', 'Cherche mate pour m\'amuser, troller et me payer une bonne tranche de rire. Humour obligatoire.', '11', '1'),
                ('Twix-gauche', 'Troll', 'lundi, mercredi', 'Cherche mate pour m\'amuser, troller et me payer une bonne tranche de rire. Humour obligatoire.', '11', '2'),
		('Totoro', 'Chill', 'la nuit', 'Faut que ça pousse', '12', '1'),
		('Schumi', 'Chill', 'le soir', 'Pas de stress, on prend le temps, on décompresse.', '13', '1'),
		('Zizou', 'Troll', 'du lundi au dimanche', 'Avec moi, on gagne. Sinon, c\'est coup de boule', '14', '1'),
                ('Zizou', 'Troll', 'du lundi au dimanche', 'Avec moi, on gagne. Sinon, c\'est coup de boule', '14', '3'),
                ('Hitman', 'Try-Hard', 'la nuit', '...', '15', '1'),
                ('Pan-pan', 'Chill', 'mercredi', 'Préfère taper IG plutôt qu\'IRL. Ne vous fiez pas aux apparences, je suis plus berzerk que lapinou.', '16', '1'),
                ('Pan-pan', 'Chill', 'mercredi', 'Préfère taper IG plutôt qu\'IRL. Ne vous fiez pas aux apparences, je suis plus berzerk que lapinou.', '16', '4'),
                ('LaMadre', 'Se defouler', 'quand pas de travail', 'A garde une ame d\enfant. En profite pour jouer quand les miens dorment.', '17', '1'),
                ('LePadre', 'Chill', 'le midi, sur la pause dej', 'Joue pour chiller, entre deux réunions', '18', '1'),
		('Revy', 'Kill', 'Quand tu veux', 'I have a big gun, I took it from my lord, sick with justice, I just wanna feel u', '19', '1'),
                ('Ashitaka', 'Chill', 'entre deux gibiers', 'San, Ai shiteru', '20', '1'),
                ('San', 'Chill', 'entre deux gibiers', 'Ashitaka, Ai shiteru', '21', '1'),
                ('Chihiro', 'Chill', 'Entre deux corvees', 'Taskete kudasai !', '22', '1'),
                ('Aku', 'Chill', 'Quand je ne cherche pas mon nom', 'Taskete kudasai !', '23', '1'),
                ('Anneke', 'Kill', 'entre deux concerts', 'My friend, an angel in disguise', '24', '1'),
                ('Floor', 'Kill', 'entre deux concerts', 'We see a mother with no child, We meet a stranger poor, exiled, How\'s the heart while it still beats? Asks a no one Another John DoeSorrow hides well in your shell A fellow man with hurt to spare Dear one, here I am to share the fear An act of kindness Without an amen How\'s the heart Underneath the silence? How\'s the one Drowning in the mire?, Let us sound a human paean, Come in, the fire\'s warm, Burn the rope and dance some more', '25', '1'),
		('Tarja', 'Kill', 'entre deux concerts', 'Welcome to the anteroom of death', '26', '1'),
		('Agnetha', 'Chill', 'entre deux concerts', 'Waterloo, I was defeated, you won the war', '27', '1'),
                ('Marco', 'Kill', 'entre deux concerts', 'ROAAAAAAAAAAAAAAAAAAAR !', '28', '1'),
                ('Docker', 'Chill', 'entre deux dockerisation', 'Musique d\ascenseur pendant les temps de conteneurisation', '29', '1'),
                ('Frida', 'Chill', 'entre deux concerts', 'Waterloo, I was defeated, you won the war', '30', '1'),
                ('Benny', 'Chill', 'entre deux concerts', 'Waterloo, I was defeated, you won the war', '31', '1'),
                ('Bjorn', 'Chill', 'entre deux concerts', 'Waterloo, I was defeated, you won the war', '32', '1'),
		('Bill', 'Try-hard', 'entre deux MAJ', 'Je vous avais prévenu', '33', '1'),
		('Pong', 'Troll', 'Tout le temps', 'Pong pong pong pong pong pong pong pong pong pong pong pong pong pong pong pong pong pong pong pong pong pong pong pong pong', '34', '1'),
                ('Pac-man', 'Troll', 'Tout le temps', 'Peut-etre qu\on me rendra rouge ou bleu, en attendant, je continue de manger des fantomes', '35', '1'),
                ('Mario', 'Try-hard', 'Tout le temps', 'Viens m\'aider a sauver Peach', '36', '1'),
                ('Ben', 'Troll', 'Souvent', 'Apres John, voici Ben, soldat inconnu au bataillon', '37', '1'),
                ('John', 'Chill', 'entre deux concerts', 'In a yellow submarine', '38', '1'),
		('Paul', 'Chill', 'entre deux concerts', 'In a yellow submarine', '39', '1'),
		('George', 'Chill', 'entre deux concerts', 'In a yellow submarine', '40', '1'),
		('Ringo', 'Chill', 'entre deux concerts', 'In a yellow submarine', '41', '1'),
		('Steve', 'Try-hard', 'tout le temps', 'Rejoins-moi, mange des pommes et renais !', '42', '1'),
		('Hup', 'troll', 'hup', 'Hup paladin !', '43', '1'),
		('Peter', 'Kill', 'Tout le temps', 'Who can we call ? Ghost buster ! Tutututudu !', '44', '1'),
                ('Raymond', 'Kill', 'Tout le temps', 'Who can we call ? Ghost buster ! Tutututudu !', '45', '1'),
                ('Winston', 'Kill', 'Tout le temps', 'Who can we call ? Ghost buster ! Tutututudu !', '46', '1'),
                ('Egon', 'Kill', 'Tout le temps', 'Who can we call ? Ghost buster ! Tutututudu !', '47', '1'),
                ('Dana', 'Kill', 'Tout le temps', 'Who can we call ? Ghost buster ! Tutututudu !', '48', '1'),
                ('Slimer', 'Troll', 'Tout le temps', 'Who can we call ? Ghost buster ! Tutututudu ! Bwarararara', '49', '1'),
                ('Alien', 'Kill', 'Tout le temps', 'Une partie de cache-cache dans le Nostromo, ca te tente ?', '50', '1'),
                ('Ripley', 'Kill', 'Tout le temps', 'Partons chasser de le xenomorphe', '51', '1'),
                ('Ash', 'Kill', 'Tout le temps', 'A votre service !', '52', '1'),
                ('Newt', 'Chill', 'Tout le temps', 'Affirmatif !', '53', '1'),
                ('Gandalf-leblanc', 'Kill', 'En temps de guerre', 'U shall not pass !', '54', '1'),
                ('Gandalf-legris', 'Kill', 'En temps de guerre', 'U shall not pass !', '55', '1'),
                ('Saruman', 'Kill', 'En temps de guerre', 'Au service du mal', '56', '1'),
                ('Bilbo', 'Chill', 'Quand je ne fais pas la sieste', 'Fume sa pipe en jouant', '57', '1'),
                ('Frodo', 'Chill', 'Quand je ne fais pas la sieste', 'Il faut detruire l\'anneau', '58', '1'),
                ('Sam', 'Chill', 'Quand je ne fais pas la sieste', 'Encore des lambas...', '59', '1'),
                ('Gollum', 'Troll', 'quand je ne cherche pas mon precieux', 'Mon precieux', '60', '1'),
                ('Aragorn', 'Kill', 'Quand le roi est de retour', 'Toujours pret a aider les hobbits', '61', '1'),
                ('Arwen', 'Chill', 'le reste de ma vie', 'Telin le thaed. Lasto beth nin, tolo dan nan galad.', '62', '1'),
                ('Legolas', 'Kill', 'Le dimanche', 'Govannas vin gwennen le, Haldir o Lorien.', '63', '1'),
                ('Ghimli', 'Kill', 'Le samedi', 'Tapons sur les elfes et autre creature de ce genre comme mon ancetre Gurdil. Compagnons de beuverie souhaite', '64', '1'),
                ('Sauron', 'Kill', 'Tout le temps', 'Je vous ai a l\'oeil', '65', '1'),
                ('Elrond', 'Kill', 'Tout le temps', 'Je suis le roi pour l\'eternite', '66', '1'),
                ('Faramir', 'Kill', 'Tout le temps', 'Frodon Sacquet, je crois qu’enfin nous nous comprenons.', '67', '1'),
                ('Galadriel', 'chill', 'depuis une eternite et pour toujours', 'Moi c\'que j\'aime dans les balades c\'est qu\'on peut se balader on peut cueillir des salades et après on peut les manger.', '68', '1'),                
                ('Boromir', 'Kill', 'Tout le temps', 'Je vous aurais suivi mon frère, mon capitaine, mon roi.', '69', '1'),
		('Wall-e', 'Chill', 'Tout le temps', 'Wall-e.', '70', '1'),
		('Eve', 'Kill', 'Tout le temps', 'Eveuh', '71', '1'),
                ('Harry', 'Chill', 'Hors temps scolaire', 'Expecto patronum', '72', '1'),
                ('Ron', 'Chill', 'Hors temps scolaire', 'Pourquoi des araignees ?! Pourquoi pas des papillons ?!', '73', '1'),
                ('Hermione', 'Chill', 'Hors temps scolaire', 'Recherche mate qui n\'a pas la capacite emotionnelle d\'une petite cuillere', '74', '1'),
                ('Ginny', 'Chill', 'Hors temps scolaire', 'Cherche partenaire au moins aussi beau et intelligent qu\'Harry', '75', '1'),
                ('Luna', 'Troll', 'Hors temps scolaire', 'Les choses finissent toujours pas revenir, mais pas toujours de la manière qu\’on croit.', '76', '1'),
                ('Nevil', 'Chill', 'Hors temps scolaire', 'Cherche mate pour trouver mon crapaud perdu', '77', '1'),
                ('Drago', 'Try-hard', 'Hors temps scolaire', 'Vive serpentard, moldu non autorise', '78', '1'),
                ('Dumbledore', 'Chill', 'Hors temps scolaire', 'Il faut beaucoup de bravoure pour faire face à ses ennemis mais il n\’en faut pas moins pour affronter ses amis. ', '79', '1'),
		('McGonagall', 'Try-hard', 'Hors temps scolaire', 'Rejoins-moi dans la noble maison Gryffondor', '80', '1');

#swipe accepté entre le profil 1 et 2 : permet de creer un lien "ami"
INSERT INTO `teamder`.`swipe` (`id`, `state`, `id_GAME_PROFILE`, `id_2_GAME_PROFILE`) VALUES ('1', '1', '1', '2');
INSERT INTO `teamder`.`swipe` (`id`, `state`, `id_GAME_PROFILE`, `id_2_GAME_PROFILE`) VALUES ('2', '1', '2', '1');

#enregistre le match entre profil 1 et profil : permet de tester le chat
INSERT INTO `teamder`.`friend` (`id`, `id_GAMER`, `id_2_GAMER`) VALUES ('1', '1', '2');
