create database DEVSpace;

use devspace;

create table curso(
codCurso INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(280) NOT NULL,
descricao VARCHAR(2000) NOT NULL,
qtdEstrelas INTEGER NOT NULL,
estado varchar(50) NOT NULL,
qtdVagas INTEGER NOT NULL,
valor NUMERIC(9,2)
);
drop table imagens;
select  * from imagens; 
select  * from curso; 

create table imagens(
codImagens INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
principal integer,
caminho varchar(200) not null,
curso_codCurso integer not null,
FOREIGN KEY(curso_codCurso) REFERENCES curso(codCurso)
);