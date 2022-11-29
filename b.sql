DROP DATABASE hospital;
- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------

CREATE DATABASE `hospital`;
USE `hospital`;

-- -----------------------------------------------------
-- Table `hospital`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE `paciente` (
  `cpf_paciente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  PRIMARY KEY (`cpf_paciente`));


-- -----------------------------------------------------
-- Table `hospital`.`medico`
-- -----------------------------------------------------
CREATE TABLE `medico` (
  `crm` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `salario` INT NOT NULL,
  `data_nasc` DATE NOT NULL,
  PRIMARY KEY (`crm`));


-- -----------------------------------------------------
-- Table `hospital`.`equipamentos`
-- -----------------------------------------------------
CREATE TABLE  `equipamentos` (
  `id_equipamento` INT NOT NULL,
  `nome_equipamento` VARCHAR(45) NOT NULL,
  `quantidade` INT NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_equipamento`));


-- -----------------------------------------------------
-- Table `hospital`.`remedios`
-- -----------------------------------------------------
CREATE TABLE `remedios` (
  `id_remedio` INT NOT NULL,
  `nome_remedio` VARCHAR(45) NOT NULL,
  `qtd` INT NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_remedio`));

-- -----------------------------------------------------
-- Table `mydb`.`consulta`
-- -----------------------------------------------------
CREATE TABLE `consulta` (
  `id_consulta` INT NOT NULL AUTO_INCREMENT,
  `funcionario_cpf` INT NOT NULL,
  `paciente_cpf_paciente` INT NOT NULL,
  PRIMARY KEY (`id_consulta`, `funcionario_cpf`, `paciente_cpf_paciente`),
    FOREIGN KEY (`funcionario_cpf`)REFERENCES medico (`crm`),
    FOREIGN KEY (`paciente_cpf_paciente`)REFERENCES `paciente` (`cpf_paciente`)
    );


-- -----------------------------------------------------
-- Table `mydb`.`equipamentos_has_consulta`
-- -----------------------------------------------------
CREATE TABLE `equipamentos_has_consulta` (
  `equipamentos_id_equipamento` INT NOT NULL,
  `consulta_id_consulta` INT NOT NULL,
  PRIMARY KEY (`equipamentos_id_equipamento`, `consulta_id_consulta`),
    FOREIGN KEY (`equipamentos_id_equipamento`)REFERENCES `equipamentos` (`id_equipamento`),
    FOREIGN KEY (`consulta_id_consulta`)REFERENCES `consulta` (`id_consulta`)
    );


-- -----------------------------------------------------
-- Table `mydb`.`remedios_has_consulta`
-- -----------------------------------------------------
CREATE TABLE `remedios_has_consulta` (
  `remedios_id_remedio` INT NOT NULL,
  `consulta_id_consulta` INT NOT NULL,
  PRIMARY KEY (`remedios_id_remedio`, `consulta_id_consulta`),
    FOREIGN KEY (`remedios_id_remedio`) REFERENCES `remedios` (`id_remedio`),
    FOREIGN KEY (`consulta_id_consulta`) REFERENCES `consulta` (`id_consulta`));


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
insert into paciente (cpf_paciente, nome, sexo) values (474878789, 'Juieta', 'F');
insert into paciente (cpf_paciente, nome, sexo) values (586198056, 'Lazar', 'M');
insert into paciente (cpf_paciente, nome, sexo) values (303012054, 'Haze', 'M');
insert into paciente (cpf_paciente, nome, sexo) values (967158696, 'Dalis', 'M');
insert into paciente (cpf_paciente, nome, sexo) values (660662633, 'Paolo', 'M');
insert into paciente (cpf_paciente, nome, sexo) values (656770798, 'Jedidiah', 'M');
insert into paciente (cpf_paciente, nome, sexo) values (385943376, 'Emlyn', 'F');
insert into paciente (cpf_paciente, nome, sexo) values (288996147, 'Hermine', 'F');
insert into paciente (cpf_paciente, nome, sexo) values (213756192, 'Jaclyn', 'F');
insert into paciente (cpf_paciente, nome, sexo) values (875193508, 'Franchot', 'M');

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
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (8854, 'laço', 8, 'amarrar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (9025, 'fita', 3, 'colar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (3995, 'gaze', 11, 'tampar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (7669, 'maca', 5, 'deitar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (1702, 'agulha', 20, 'costurar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (6344, 'carrinho', 7, 'carregar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (2095, 'cano', 4, 'sugar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (6650, 'pontos', 9, 'fechar');
insert into equipamentos (id_equipamento, nome_equipamento, quantidade, funcao) values (9471, 'soro', 80, 'limpar');
