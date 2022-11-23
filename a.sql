-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------

CREATE DATABASE `hospital`;
USE `hospital`;

-- -----------------------------------------------------
-- Table `hospital`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE `pacientes` (
  `cpf_paciente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `doenca` VARCHAR(45) NULL,
  `data_nascimento` DATE NOT NULL,
  PRIMARY KEY (`cpf_paciente`));


-- -----------------------------------------------------
-- Table `hospital`.`medico`
-- -----------------------------------------------------
CREATE TABLE `medico` (
  `crm` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `salario` DECIMAL NOT NULL,
  `data_nasc` DATE NOT NULL,
  PRIMARY KEY (`crm`));


-- -----------------------------------------------------
-- Table `hospital`.`equipamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`equipamentos` (
  `id_equipamento` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `quantidade` INT NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_equipamento`));


-- -----------------------------------------------------
-- Table `hospital`.`remedios`
-- -----------------------------------------------------
CREATE TABLE `remedios` (
  `id_remedio` INT NOT NULL,
  `nome_remedio` INT NOT NULL,
  `qtd` INT NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_remedio`));


-- -----------------------------------------------------
-- Table `hospital`.`paciente`
-- -----------------------------------------------------
CREATE TABLE `paciente` (
  `cpf_paciente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  PRIMARY KEY (`cpf_paciente`));


-- -----------------------------------------------------
-- Table `mydb`.`consulta`
-- -----------------------------------------------------
CREATE TABLE `consulta` (
  `id_consulta` INT NOT NULL,
  `funcionario_cpf` INT NOT NULL,
  `paciente_cpf_paciente` INT NOT NULL,
  PRIMARY KEY (`id_consulta`, `funcionario_cpf`, `paciente_cpf_paciente`),
    FOREIGN KEY (`funcionario_cpf`)REFERENCES `mydb`.`medico` (`crm`),
    FOREIGN KEY (`paciente_cpf_paciente`)REFERENCES `mydb`.`paciente` (`cpf_paciente`));


-- -----------------------------------------------------
-- Table `mydb`.`equipamentos_has_consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EX`equipamentos_has_consulta` (
  `equipamentos_id_equipamento` INT NOT NULL,
  `consulta_id_consulta` INT NOT NULL,
  PRIMARY KEY (`equipamentos_id_equipamento`, `consulta_id_consulta`),
    FOREIGN KEY (`equipamentos_id_equipamento`)REFERENCES `mydb`.`equipamentos` (`id_equipamento`)
    FOREIGN KEY (`consulta_id_consulta`)REFERENCES `mydb`.`consulta` (`id_consulta`));


-- -----------------------------------------------------
-- Table `mydb`.`remedios_has_consulta`
-- -----------------------------------------------------
CREATE TABLE `remedios_has_consulta` (
  `remedios_id_remedio` INT NOT NULL,
  `consulta_id_consulta` INT NOT NULL,
  PRIMARY KEY (`remedios_id_remedio`, `consulta_id_consulta`),
    FOREIGN KEY (`remedios_id_remedio`) REFERENCES `mydb`.`remedios` (`id_remedio`)
    FOREIGN KEY (`consulta_id_consulta`) REFERENCES `mydb`.`consulta` (`id_consulta`));


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
insert into paciente (cpf, nome, sexo) values (47486259887, 'Juieta', 'F');
insert into paciente (cpf, nome, sexo) values (58619805634, 'Lazar', 'M');
insert into paciente (cpf, nome, sexo) values (30301205476, 'Haze', 'M');
insert into paciente (cpf, nome, sexo) values (96715869630, 'Dalis', 'M');
insert into paciente (cpf, nome, sexo) values (66066263372, 'Paolo', 'M');
insert into paciente (cpf, nome, sexo) values (65677079860, 'Jedidiah', 'M');
insert into paciente (cpf, nome, sexo) values (38594337667, 'Emlyn', 'F');
insert into paciente (cpf, nome, sexo) values (28899614752, 'Hermine', 'F');
insert into paciente (cpf, nome, sexo) values (21375619281, 'Jaclyn', 'F');
insert into paciente (cpf, nome, sexo) values (87519350448, 'Franchot', 'M');
 /*INSERTS */

/*DROP DATABASE hospital;*/