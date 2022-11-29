DROP DATABASE hospital;
- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------

CREATE DATABASE hospital;
USE hospital;

-- -----------------------------------------------------
-- Table `hospital`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE paciente (
  cpf_paciente INT NOT NULL,
  nome_paciente VARCHAR(45) NOT NULL,
  sexo CHAR(1) NOT NULL,
  PRIMARY KEY (cpf_paciente));


-- -----------------------------------------------------
-- Table `hospital`.`medico`
-- -----------------------------------------------------
CREATE TABLE medico (
  crm INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  salario INT NOT NULL,
  data_nasc DATE NOT NULL,
  PRIMARY KEY (crm));


-- -----------------------------------------------------
-- Table `hospital`.`equipamentos`
-- -----------------------------------------------------
CREATE TABLE  equipamentos (
  id_equipamento INT NOT NULL,
  nome_equipamento VARCHAR(45) NOT NULL,
  quantidade INT NOT NULL,
  funcao VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_equipamento));


-- -----------------------------------------------------
-- Table `hospital`.`remedios`
-- -----------------------------------------------------
CREATE TABLE remedios (
  id_remedio INT NOT NULL,
  nome_remedio VARCHAR(45) NOT NULL,
  qtd INT NOT NULL,
  funcao VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_remedio));

-- -----------------------------------------------------
-- Table `mydb`.`consulta`
-- -----------------------------------------------------
CREATE TABLE consulta (
  id_consulta INT NOT NULL AUTO_INCREMENT,
  funcionario_crm INT NOT NULL,
  cpf_paciente INT NOT NULL,
  PRIMARY KEY (id_consulta, funcionario_crm, cpf_paciente),
    FOREIGN KEY (funcionario_crm)REFERENCES medico (crm),
    FOREIGN KEY (cpf_paciente)REFERENCES paciente (cpf_paciente)
    );


-- -----------------------------------------------------
-- Table `mydb`.`equipamentos_has_consulta`
-- -----------------------------------------------------
CREATE TABLE equipamentos_has_consulta (
  equipamentos_id_equipamento INT NOT NULL,
  consulta_id_consulta INT NOT NULL,
  PRIMARY KEY (equipamentos_id_equipamento, consulta_id_consulta),
    FOREIGN KEY (equipamentos_id_equipamento)REFERENCES equipamentos (id_equipamento),
    FOREIGN KEY (consulta_id_consulta)REFERENCES consulta (id_consulta)
    );


-- -----------------------------------------------------
-- Table `mydb`.`remedios_has_consulta`
-- -----------------------------------------------------
CREATE TABLE remedios_has_consulta (
  remedios_id_remedio INT NOT NULL,
  consulta_id_consulta INT NOT NULL,
  PRIMARY KEY (remedios_id_remedio, consulta_id_consulta),
    FOREIGN KEY (remedios_id_remedio) REFERENCES remedios (id_remedio),
    FOREIGN KEY (consulta_id_consulta) REFERENCES consulta (id_consulta));


    /*INSERTS MEDICO*/
insert into medico (crm, nome, salario, data_nasc) values (912.119, 'Jasun', 6490.97, '2015-02-08');
insert into medico (crm, nome, salario, data_nasc) values (603.095, 'Ravi', 2695.91, '2003-11-09');
insert into medico (crm, nome, salario, data_nasc) values (863.807, 'Franciskus', 8443.59, '2004-03-01');
insert into medico (crm, nome, salario, data_nasc) values (545.63, 'Camala', 5969.59, '2002-05-07');
insert into medico (crm, nome, salario, data_nasc) values (178.073, 'Terrel', 9205.34, '2017-11-21');
insert into medico (crm, nome, salario, data_nasc) values (151.028, 'Ashlie', 2362.96, '2019-01-12');
insert into medico (crm, nome, salario, data_nasc) values (887.139, 'Stella', 3970.11, '2004-12-15');
insert into medico (crm, nome, salario, data_nasc) values (716.941, 'Berrie', 7068.85, '2019-04-15');
insert into medico (crm, nome, salario, data_nasc) values (989.074, 'Janene', 5908.9, '2019-12-31');
insert into medico (crm, nome, salario, data_nasc) values (172.139, 'Bone', 6601.17, '2001-08-20');

    /*INSERTS PACIENTE*/
insert into paciente (cpf_paciente, nome_paciente, sexo) values (474878789, 'Juieta', 'F');
insert into paciente (cpf_paciente, nome_paciente, sexo) values (586198056, 'Lazar', 'M');
insert into paciente (cpf_paciente, nome_paciente, sexo) values (303012054, 'Haze', 'M');
insert into paciente (cpf_paciente, nome_paciente, sexo) values (967158696, 'Dalis', 'M');
insert into paciente (cpf_paciente, nome_paciente, sexo) values (660662633, 'Paolo', 'M');
insert into paciente (cpf_paciente, nome_paciente, sexo) values (656770798, 'Jedidiah', 'M');
insert into paciente (cpf_paciente, nome_paciente, sexo) values (385943376, 'Emlyn', 'F');
insert into paciente (cpf_paciente, nome_paciente, sexo) values (288996147, 'Hermine', 'F');
insert into paciente (cpf_paciente, nome_paciente, sexo) values (213756192, 'Jaclyn', 'F');
insert into paciente (cpf_paciente, nome_paciente, sexo) values (875193508, 'Franchot', 'M');

 /*INSERTS REMEDIOS */
insert into remedios (id_remedio, nome_remedio, qtd, funcao) values (7506, 'Methoxsalen', 1, 'curar');
insert into remedios (id_remedio, nome_remedio, qtd, funcao) values (1177, 'Metronidazole', 6, 'curar');
insert into remedios (id_remedio, nome_remedio, qtd, funcao) values (9770, 'CALCIUM CARBONATE', 3, 'curar');
insert into remedios (id_remedio, nome_remedio, qtd, funcao) values (3128, 'Octinoxate and Oxybenzone', 12, 'curar');
insert into remedios (id_remedio, nome_remedio, qtd, funcao) values (6923, 'Acetominophen', 5, 'curar');
insert into remedios (id_remedio, nome_remedio, qtd, funcao) values (2369, 'BEE VENOM', 6, 'curar');
insert into remedios (id_remedio, nome_remedio, qtd, funcao) values (9602, 'Kali phos, Nat phos, Calc phos', 2, 'curar');
insert into remedios (id_remedio, nome_remedio, qtd, funcao) values (2672, 'Atenolol and Chlorthalidone', 5, 'curar');
insert into remedios (id_remedio, nome_remedio, qtd, funcao) values (1310, 'OCTINOXATE and TITANIUM DIOXIDE', 9, 'curar');
insert into remedios (id_remedio, nome_remedio, qtd, funcao) values (4862, 'Aluminum Zirconium Trichlorohydrex Gly', 9, 'curar');

/*INSERTS EQUIPAMENTOS */
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (4317, 'bisturi', 0, 'cortar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (8854, 'laco', 8, 'amarrar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (9025, 'fita', 3, 'colar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (3995, 'gaze', 11, 'tampar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (7669, 'maca', 5, 'deitar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (1702, 'agulha', 20, 'costurar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (6344, 'carrinho', 7, 'carregar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (2095, 'cano', 4, 'sugar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (6650, 'pontos', 9, 'fechar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (9471, 'soro', 80, 'limpar');

/*UPDATES MEDICO*/
UPDATE medico SET crm = 123.456, nome = 'Joao', salario = 9000.00, data_nasc = '2005-02-17' WHERE crm = 912;
UPDATE medico SET crm = 398.086, nome = 'Eliezer', salario = 8542.45, data_nasc = '2005-01-20' WHERE crm = 603;
UPDATE medico SET crm = 008.890, nome = 'Sam', salario = 0020.50, data_nasc = '2004-05-6' WHERE crm = 172;
UPDATE medico SET crm = 800.431, nome = 'Enzo', salario = 1111.01, data_nasc = '2005-04-23' WHERE crm = 989;
UPDATE medico SET crm = 133.954, nome = 'Caua', salario = 6120.90, data_nasc = '2003-10-01' WHERE crm = 151;

/*UPDATES PACIENTE*/
UPDATE paciente SET cpf_paciente = 123456789, nome_paciente = 'Joao', sexo = 'M' WHERE cpf_paciente = 967158696 ;
UPDATE paciente SET cpf_paciente = 987654321, nome_paciente = 'Bruna', sexo = 'F' WHERE cpf_paciente = 875193508 ;
UPDATE paciente SET cpf_paciente = 549655730, nome_paciente = 'Eliezer', sexo = 'M' WHERE cpf_paciente = 474878789 ;
UPDATE paciente SET cpf_paciente = 432998665, nome_paciente = 'Caua', sexo = 'M' WHERE cpf_paciente = 213756192;
UPDATE paciente SET cpf_paciente = 877611203, nome_paciente = 'Sam', sexo = 'M' WHERE cpf_paciente = 660662633;

/*UPDATES REMEDIOS */
UPDATE remedios SET id_remedio = 1234, nome_remedio = 'Viagra', qtd = 69, funcao = 'Subir' WHERE id_remedio = 4862;
UPDATE remedios SET id_remedio = 4321, nome_remedio = 'Codeina', qtd = 5, funcao = 'Chapar' WHERE id_remedio = 1310;
UPDATE remedios SET id_remedio = 5544, nome_remedio = 'Acido', qtd = 80, funcao = 'Matar' WHERE id_remedio = 2369;
UPDATE remedios SET id_remedio = 1987, nome_remedio = 'Dipirona', qtd = 1, funcao = 'Curar' WHERE id_remedio = 1177;
UPDATE remedios SET id_remedio = 5091, nome_remedio = 'Laxante', qtd = 10, funcao = 'Soltar' WHERE id_remedio = 4862;

/*UPDATES EQUIPAMENTOS */
UPDATE equipamentos SET id_equipamento = 1234, nome_equipamento = 'Desfibrilador', quantidade = 7, funcao = 'Choque' WHERE id_equipamento = 9471;
UPDATE equipamentos SET id_equipamento = 4321, nome_equipamento = 'Estetoscopio', quantidade = 39, funcao = 'Ouvir' WHERE id_equipamento = 6650;
UPDATE equipamentos SET id_equipamento = 7653, nome_equipamento = 'Oximetro', quantidade = 53, funcao = 'Oxigenio' WHERE id_equipamento = 2095;
UPDATE equipamentos SET id_equipamento = 9008, nome_equipamento = 'Hamper', quantidade = 100, funcao = 'Lixo' WHERE id_equipamento = 6344;
UPDATE equipamentos SET id_equipamento = 5231, nome_equipamento = 'Eletrocardiografo', quantidade = 3, funcao = 'Eletrocardiograma' WHERE id_equipamento = 1702;

/*DELETES MEDICO*/
DELETE FROM medico WHERE crm = 178;
DELETE FROM medico WHERE crm = 123;
DELETE FROM medico WHERE crm = 717;
DELETE FROM medico WHERE crm = 9;
DELETE FROM medico WHERE crm = 887;

/*DELETES PACIENTE*/
DELETE FROM paciente WHERE cpf_paciente = 123456789;
DELETE FROM paciente WHERE cpf_paciente = 987654321;
DELETE FROM paciente WHERE cpf_paciente = 656770798;
DELETE FROM paciente WHERE cpf_paciente = 303012054;
DELETE FROM paciente WHERE cpf_paciente = 586198056;

/*DELETES REMEDIOS */
DELETE FROM remedios WHERE id_remedio = 7506;
DELETE FROM remedios WHERE id_remedio = 4321;
DELETE FROM remedios WHERE id_remedio = 1234;
DELETE FROM remedios WHERE id_remedio = 9602;
DELETE FROM remedios WHERE id_remedio = 9770;

/*DELETES EQUIPAMENTOS */
DELETE FROM equipamentos WHERE id_equipamento = 7653;
DELETE FROM equipamentos WHERE id_equipamento = 4321;
DELETE FROM equipamentos WHERE id_equipamento = 1234;
DELETE FROM equipamentos WHERE id_equipamento = 7669;
DELETE FROM equipamentos WHERE id_equipamento = 9025;

/*SELECTS*/
SELECT * FROM medico ORDER BY salario ASC;
SELECT * FROM paciente ORDER BY cpf_paciente ASC;
SELECT * FROM remedios ORDER BY qtd ASC;
SELECT * FROM equipamentos ORDER BY quantidade ASC;

SELECT nome FROM medico WHERE crm = 800;
SELECT nome_paciente FROM paciente WHERE cpf_paciente = 385943376;
SELECT nome_remedio FROM remedios WHERE id_remedio = 2672;
SELECT nome_equipamento FROM equipamentos WHERE id_equipamento = 4317;


/*
1- INT n aceita mais de 9 caracteres.
2- Where n aceita string
3-Chaves Estrangeiras n funfam
4-Inner Join
*/