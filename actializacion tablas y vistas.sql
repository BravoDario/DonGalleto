use don_galleto;
create table mermaMaterial(
	idMermaMaterial int primary key auto_increment,
    cantidad int not null,
    unidad varchar(10) not null,
    idMaterial int not null,
	constraint fkIdMaterial foreign key(idMaterial) references material(idMaterial)
);
insert into mermaMaterial values (default, 100, "GR", 1),(default, 200, "GR", 2),(default, 5, "L", 10);
#select * from vistamermamaterial;
create view VistaMermaMaterial as select * from mermaMatserial mg, material g where mg.idMaterial = g.idMaterial;


create table mermaGalleta(
	idMermaGalleta int primary key auto_increment,
    cantidad int not null,
    idGalleta int not null,
	constraint fkIdGalleta foreign key(idGalleta) references galleta(idGalleta)
);

insert into mermaGalleta values (default, 5, 2),(default, 5, 1),(default, 5, 3);
#select * from VistaMermaGalleta;
create view VistaMermaGalleta as select mg.idMermaGalleta, mg.cantidad, mg.idGalleta, g.idInventario, g.nombre, g.precio from mermaGalleta mg inner join galleta g on mg.idGalleta = g.idGalleta;

drop table merma;
drop view contenidomerma;

#select * from detalle_venta;
alter table detalle_venta add column idGalleta int not null;

# *** Enviar los id's de galleta.detalle_venta a detalle_venta.idGalleta
update detalle_venta set idGalleta = 1 where idDetalle_venta = 1;
update detalle_venta set idGalleta = 2 where idDetalle_venta = 2;
update detalle_venta set idGalleta = 3 where idDetalle_venta = 3;
update detalle_venta set idGalleta = 4 where idDetalle_venta = 4;
update detalle_venta set idGalleta = 5 where idDetalle_venta = 5;
update detalle_venta set idGalleta = 6 where idDetalle_venta = 6;
update detalle_venta set idGalleta = 7 where idDetalle_venta = 7;
update detalle_venta set idGalleta = 8 where idDetalle_venta = 8;
update detalle_venta set idGalleta = 9 where idDetalle_venta = 9;
update detalle_venta set idGalleta = 10 where idDetalle_venta = 10;

alter table detalle_venta add constraint idGalleta foreign key (idGalleta) references galleta(idGalleta);
  
alter table galleta drop constraint fk_galleta_detalle_venta;
alter table galleta drop column idDetalle_venta;