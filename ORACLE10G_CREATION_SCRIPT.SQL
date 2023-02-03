-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                      Oracle Version 10g
--                        (3/2/2023 12:32:59)
-- -----------------------------------------------------------------------------
--      Nom de la base : pokemon_db
--      Projet : pokemon_db
--      Auteur : Julien Ait azzouzene
--      Date de dernière modification : 3/2/2023 12:32:28
-- -----------------------------------------------------------------------------

DROP TABLE POK_TYPE CASCADE CONSTRAINTS;

DROP TABLE POK_OFFENSIVE_CATEGORY CASCADE CONSTRAINTS;

DROP TABLE POK_MOVES CASCADE CONSTRAINTS;

DROP TABLE POK_GENERATION CASCADE CONSTRAINTS;

DROP TABLE POK_SECUNDARY_EFFECT CASCADE CONSTRAINTS;

DROP TABLE POK_POKEMON CASCADE CONSTRAINTS;

DROP TABLE POK_MON_STATS CASCADE CONSTRAINTS;

DROP TABLE POK_MOV_STATS CASCADE CONSTRAINTS;

DROP TABLE POK_MON_IS_TYPE CASCADE CONSTRAINTS;

DROP TABLE POK_SUMMON CASCADE CONSTRAINTS;

-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

--CREATE DATABASE pokemon_db;

-- -----------------------------------------------------------------------------
--       TABLE : POK_TYPE
-- -----------------------------------------------------------------------------

CREATE TABLE POK_TYPE
   (
    TYP_NUM CHAR(32)  NOT NULL,
    MOV_CAT_CODE CHAR(1)  NULL,
    TYP_ENG_NAME CHAR(32)  NOT NULL,
    NOM_JAPONAIS CHAR(32)  NULL
,   CONSTRAINT PK_POK_TYPE PRIMARY KEY (TYP_NUM)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE POK_TYPE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_POK_TYPE_POK_OFFENSIVE_CA
     ON POK_TYPE (MOV_CAT_CODE ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : POK_OFFENSIVE_CATEGORY
-- -----------------------------------------------------------------------------

CREATE TABLE POK_OFFENSIVE_CATEGORY
   (
    MOV_CAT_CODE CHAR(1)  NOT NULL,
    MOV_CAT_ENG_LABEL CHAR(32)  NOT NULL
,   CONSTRAINT PK_POK_OFFENSIVE_CATEGORY PRIMARY KEY (MOV_CAT_CODE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : POK_MOVES
-- -----------------------------------------------------------------------------

CREATE TABLE POK_MOVES
   (
    MOV_NUM NUMBER(4)  NOT NULL,
    MOV_CAT_CODE CHAR(1)  NOT NULL,
    TYP_NUM CHAR(32)  NOT NULL,
    MOV_ENG_NAME CHAR(32)  NOT NULL
,   CONSTRAINT PK_POK_MOVES PRIMARY KEY (MOV_NUM)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE POK_MOVES
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_POK_MOVES_POK_OFFENSIVE_C
     ON POK_MOVES (MOV_CAT_CODE ASC)
    ;

CREATE  INDEX I_FK_POK_MOVES_POK_TYPE
     ON POK_MOVES (TYP_NUM ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : POK_GENERATION
-- -----------------------------------------------------------------------------

CREATE TABLE POK_GENERATION
   (
    GEN_NUM NUMBER(2)  NOT NULL,
    GEN_COMP NUMBER(2)  NOT NULL,
    GEN_CORE_GAMES CHAR(64)  NULL
,   CONSTRAINT PK_POK_GENERATION PRIMARY KEY (GEN_NUM, GEN_COMP)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : POK_SECUNDARY_EFFECT
-- -----------------------------------------------------------------------------

CREATE TABLE POK_SECUNDARY_EFFECT
   (
    EFF_ID NUMBER(3)  NOT NULL,
    EFF_NAME CHAR(32)  NOT NULL,
    EFF_DESCRIPTION CHAR(32)  NULL
,   CONSTRAINT PK_POK_SECUNDARY_EFFECT PRIMARY KEY (EFF_ID)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : POK_POKEMON
-- -----------------------------------------------------------------------------

CREATE TABLE POK_POKEMON
   (
    MON_DEX_NUM NUMBER(4)  NOT NULL,
    MON_ENG_NAME CHAR(32)  NOT NULL,
    MON_SPA_NAME CHAR(32)  NULL,
    MON_FR_NAME CHAR(32)  NULL,
    MON_GER_NAME CHAR(32)  NULL,
    MON_ITA_NAME CHAR(32)  NULL,
    MON_KOR_NAME CHAR(32)  NULL,
    MON_CH_NAME CHAR(32)  NULL
,   CONSTRAINT PK_POK_POKEMON PRIMARY KEY (MON_DEX_NUM)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : POK_MON_STATS
-- -----------------------------------------------------------------------------

CREATE TABLE POK_MON_STATS
   (
    MON_DEX_NUM NUMBER(4)  NOT NULL,
    GEN_NUM NUMBER(2)  NOT NULL,
    GEN_COMP NUMBER(2)  NOT NULL,
    STA_BASE_HP NUMBER(4)  NULL,
    STA_BASE_ATTACK NUMBER(4)  NULL,
    STA_BASE_DEFENSE NUMBER(4)  NULL,
    STA_BASE_SPE_ATTACK NUMBER(4)  NULL,
    STA_BASE_SPE_DEFENSE NUMBER(4)  NULL,
    STA_BASE_SPEED NUMBER(4)  NULL,
    STA_BASE_SPECIAL NUMBER(4)  NULL
,   CONSTRAINT PK_POK_MON_STATS PRIMARY KEY (MON_DEX_NUM, GEN_NUM, GEN_COMP)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE POK_MON_STATS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_POK_MON_STATS_POK_POKEMON
     ON POK_MON_STATS (MON_DEX_NUM ASC)
    ;

CREATE  INDEX I_FK_POK_MON_STATS_POK_GENERAT
     ON POK_MON_STATS (GEN_NUM ASC, GEN_COMP ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : POK_MOV_STATS
-- -----------------------------------------------------------------------------

CREATE TABLE POK_MOV_STATS
   (
    MOV_NUM NUMBER(4)  NOT NULL,
    GEN_NUM NUMBER(2)  NOT NULL,
    GEN_COMP NUMBER(2)  NOT NULL,
    VAL_MAX_PPS NUMBER(2)  NOT NULL,
    VAL_POWER NUMBER(4)  NULL,
    VAL_ACCURACY NUMBER(3)  NULL
,   CONSTRAINT PK_POK_MOV_STATS PRIMARY KEY (MOV_NUM, GEN_NUM, GEN_COMP)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE POK_MOV_STATS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_POK_MOV_STATS_POK_MOVES
     ON POK_MOV_STATS (MOV_NUM ASC)
    ;

CREATE  INDEX I_FK_POK_MOV_STATS_POK_GENERAT
     ON POK_MOV_STATS (GEN_NUM ASC, GEN_COMP ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : POK_MON_IS_TYPE
-- -----------------------------------------------------------------------------

CREATE TABLE POK_MON_IS_TYPE
   (
    MON_DEX_NUM NUMBER(4)  NOT NULL,
    TYP_NUM CHAR(32)  NOT NULL
,   CONSTRAINT PK_POK_MON_IS_TYPE PRIMARY KEY (MON_DEX_NUM, TYP_NUM)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE POK_MON_IS_TYPE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_POK_MON_IS_TYPE_POK_POKEM
     ON POK_MON_IS_TYPE (MON_DEX_NUM ASC)
    ;

CREATE  INDEX I_FK_POK_MON_IS_TYPE_POK_TYPE
     ON POK_MON_IS_TYPE (TYP_NUM ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : POK_SUMMON
-- -----------------------------------------------------------------------------

CREATE TABLE POK_SUMMON
   (
    MOV_NUM NUMBER(4)  NOT NULL,
    EFF_ID NUMBER(3)  NOT NULL,
    SUM_CHANCE NUMBER(3)  NULL
,   CONSTRAINT PK_POK_SUMMON PRIMARY KEY (MOV_NUM, EFF_ID)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE POK_SUMMON
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_POK_SUMMON_POK_MOVES
     ON POK_SUMMON (MOV_NUM ASC)
    ;

CREATE  INDEX I_FK_POK_SUMMON_POK_SECUNDARY_
     ON POK_SUMMON (EFF_ID ASC)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE POK_TYPE ADD (
     CONSTRAINT FK_POK_TYPE_POK_OFFENSIVE_CATE
          FOREIGN KEY (MOV_CAT_CODE)
               REFERENCES POK_OFFENSIVE_CATEGORY (MOV_CAT_CODE))   ;

ALTER TABLE POK_MOVES ADD (
     CONSTRAINT FK_POK_MOVES_POK_OFFENSIVE_CAT
          FOREIGN KEY (MOV_CAT_CODE)
               REFERENCES POK_OFFENSIVE_CATEGORY (MOV_CAT_CODE))   ;

ALTER TABLE POK_MOVES ADD (
     CONSTRAINT FK_POK_MOVES_POK_TYPE
          FOREIGN KEY (TYP_NUM)
               REFERENCES POK_TYPE (TYP_NUM))   ;

ALTER TABLE POK_MON_STATS ADD (
     CONSTRAINT FK_POK_MON_STATS_POK_POKEMON
          FOREIGN KEY (MON_DEX_NUM)
               REFERENCES POK_POKEMON (MON_DEX_NUM))   ;

ALTER TABLE POK_MON_STATS ADD (
     CONSTRAINT FK_POK_MON_STATS_POK_GENERATIO
          FOREIGN KEY (GEN_NUM, GEN_COMP)
               REFERENCES POK_GENERATION (GEN_NUM, GEN_COMP))   ;

ALTER TABLE POK_MOV_STATS ADD (
     CONSTRAINT FK_POK_MOV_STATS_POK_MOVES
          FOREIGN KEY (MOV_NUM)
               REFERENCES POK_MOVES (MOV_NUM))   ;

ALTER TABLE POK_MOV_STATS ADD (
     CONSTRAINT FK_POK_MOV_STATS_POK_GENERATIO
          FOREIGN KEY (GEN_NUM, GEN_COMP)
               REFERENCES POK_GENERATION (GEN_NUM, GEN_COMP))   ;

ALTER TABLE POK_MON_IS_TYPE ADD (
     CONSTRAINT FK_POK_MON_IS_TYPE_POK_POKEMON
          FOREIGN KEY (MON_DEX_NUM)
               REFERENCES POK_POKEMON (MON_DEX_NUM))   ;

ALTER TABLE POK_MON_IS_TYPE ADD (
     CONSTRAINT FK_POK_MON_IS_TYPE_POK_TYPE
          FOREIGN KEY (TYP_NUM)
               REFERENCES POK_TYPE (TYP_NUM))   ;

ALTER TABLE POK_SUMMON ADD (
     CONSTRAINT FK_POK_SUMMON_POK_MOVES
          FOREIGN KEY (MOV_NUM)
               REFERENCES POK_MOVES (MOV_NUM))   ;

ALTER TABLE POK_SUMMON ADD (
     CONSTRAINT FK_POK_SUMMON_POK_SECUNDARY_EF
          FOREIGN KEY (EFF_ID)
               REFERENCES POK_SECUNDARY_EFFECT (EFF_ID))   ;


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------