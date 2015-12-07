/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     06/12/2015 21:19:06                          */
/*==============================================================*/


drop table if exists DETALLE;

drop table if exists DETALLE_RUBRO;

drop table if exists FACTURA;

drop table if exists PROVEEDOR;

drop table if exists RUBO_FACTURA;

drop table if exists RUBRO;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: DETALLE                                               */
/*==============================================================*/
create table DETALLE
(
   ID_DETALLE           int not null,
   ID_USUARIO           int,
   ID_FACTU             int,
   ID_FACTURA           int not null,
   primary key (ID_DETALLE)
);

/*==============================================================*/
/* Table: DETALLE_RUBRO                                         */
/*==============================================================*/
create table DETALLE_RUBRO
(
   ID_DETALLE_RUBRO     int not null,
   ID_RUBRO             int,
   NOMBRE_RUBRO         char(20) not null,
   VALOR_MAXIMO         decimal(6,3) not null,
   TIPO                 char(20),
   primary key (ID_DETALLE_RUBRO)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA
(
   ID_FACTU             int not null,
   FECHA                date not null,
   primary key (ID_FACTU)
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR
(
   ID_PROVEEDOR         int not null,
   ID_FACTU             int,
   NOMBRE_PROVEEDOR     char(20) not null,
   ROL                  char(20) not null,
   primary key (ID_PROVEEDOR)
);

/*==============================================================*/
/* Table: RUBO_FACTURA                                          */
/*==============================================================*/
create table RUBO_FACTURA
(
   ID_RUBRO             int not null,
   ID_FACTU             int not null,
   primary key (ID_RUBRO, ID_FACTU)
);

/*==============================================================*/
/* Table: RUBRO                                                 */
/*==============================================================*/
create table RUBRO
(
   ID_RUBRO             int not null,
   ID_DETALLE_RUBRO     int,
   VALOR_ACTUAL         decimal(6,3),
   primary key (ID_RUBRO)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   ID_USUARIO           int not null,
   NOMBRE_USUARIO       char(25) not null,
   CONTRASENA_USUARIO   char(10) not null,
   CEDULA_USUARIO       char(13),
   primary key (ID_USUARIO)
);

alter table DETALLE add constraint FK_FACTURA_DETALLE foreign key (ID_FACTU)
      references FACTURA (ID_FACTU) on delete restrict on update restrict;

alter table DETALLE add constraint FK_USUARIO_DETALLE foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table DETALLE_RUBRO add constraint FK_RELATIONSHIP_6 foreign key (ID_RUBRO)
      references RUBRO (ID_RUBRO) on delete restrict on update restrict;

alter table PROVEEDOR add constraint FK_FACTURA_PROVEEDOR foreign key (ID_FACTU)
      references FACTURA (ID_FACTU) on delete restrict on update restrict;

alter table RUBO_FACTURA add constraint FK_RUBO_FACTURA foreign key (ID_RUBRO)
      references RUBRO (ID_RUBRO) on delete restrict on update restrict;

alter table RUBO_FACTURA add constraint FK_RUBO_FACTURA2 foreign key (ID_FACTU)
      references FACTURA (ID_FACTU) on delete restrict on update restrict;

alter table RUBRO add constraint FK_RELATIONSHIP_5 foreign key (ID_DETALLE_RUBRO)
      references DETALLE_RUBRO (ID_DETALLE_RUBRO) on delete restrict on update restrict;

