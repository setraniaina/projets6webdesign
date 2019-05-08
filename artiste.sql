/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  06/05/2019 21:31:22                      */
/*==============================================================*/


drop table if exists ALBUM;

drop table if exists ARTISTE;

drop table if exists CHANSON;

/*==============================================================*/
/* Table : ALBUM                                                */
/*==============================================================*/
create table ALBUM
(
   IDALBUM              int not null auto_increment,
   IDARTISTE            int not null,
   NOM                  varchar(25),
   primary key (IDALBUM)
);

/*==============================================================*/
/* Table : ARTISTE                                              */
/*==============================================================*/
create table ARTISTE
(
   IDARTISTE            int not null auto_increment,
   NOM                  varchar(25),
   NATIONALITE          varchar(25),
   GENRE                varchar(25),
   DESCRIPTION          text,
   IMAGE                varchar(25),
   COUVERTURE			varchar(50)
   primary key (IDARTISTE)
);

/*==============================================================*/
/* Table : CHANSON                                              */
/*==============================================================*/
create table CHANSON
(
   IDCHANSON            int not null auto_increment,
   IDALBUM              int not null,
   IDARTISTE            int not null,
   TITRE                varchar(25),
   primary key (IDCHANSON)
);

create table LOGIN
(
   IDLOGIN            int not null auto_increment,
   LOGIN              varchar(50) not null,
   PASSWORD            varchar(70) not null,
   primary key (IDLOGIN)
);

alter table ALBUM add constraint FK_ASSOCIATION_2 foreign key (IDARTISTE)
      references ARTISTE (IDARTISTE) on delete restrict on update restrict;

alter table CHANSON add constraint FK_ASSOCIATION_1 foreign key (IDARTISTE)
      references ARTISTE (IDARTISTE) on delete restrict on update restrict;

alter table CHANSON add constraint FK_ASSOCIATION_3 foreign key (IDALBUM)
      references ALBUM (IDALBUM) on delete restrict on update restrict;
	  
insert into artiste (NOM,NATIONALITE,GENRE,DESCRIPTION,IMAGE) values('Nina Simone','American','Jazz','Eunice Kathleen Waymon (February 21, 1933 – April 21, 2003), known professionally as Nina Simone, was an American singer, songwriter, musician, arranger, and civil rights activist. Her music spanned a broad range of musical styles including classical, jazz, blues, folk, R&B, gospel, and pop.','s01','c01');
insert into artiste (NOM,NATIONALITE,GENRE,DESCRIPTION,IMAGE) values('Corey Taylor','American','Metal','Corey Todd Taylor (born December 8, 1973) is an American musician, singer, songwriter, actor and author who is best known as the lead vocalist and lyricist of the bands Slipknot and Stone Sour.','s02','c02');
insert into artiste (NOM,NATIONALITE,GENRE,DESCRIPTION,IMAGE) values('Lady gaga','American','Pop','Stefani Joanne Angelina Germanotta (born March 28, 1986), known professionally as Lady Gaga, is an American singer, songwriter and actress. ','s03','c03');
insert into login (LOGIN,PASSWORD) values ('admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');



