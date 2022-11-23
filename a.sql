CREATE DATABASE hospital;

CREATE TABLE medico (
    crm INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45) NOT NULL,
    salario DECIMAL NOT NULL,
    data_nasc DATE NOT NULL
);

CREATE TABLE paciente (
    cpf INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45) NOT NULL,
    sexo CHAR(1) NOT NULL
);

CREATE TABLE consulta (
    id_consulta INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    FOREIGN KEY (funcionario_cpf) REFERENCES medico,
    FOREIGN KEY (paciente_cpf) REFERENCES paciente,
);

CREATE TABLE equipamentos (
    id_equipamento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45) NOT NULL,
    quantidade INT NOT NULL,
    funcao VARCHAR(45) NOT NULL
);

CREATE TABLE remedios(
   id_remedio INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45) NOT NULL,
    salario DECIMAL NOT NULL,
    funcao VARCHAR(45) NOT NULL
);

CREATE TABLE remedios_has_consulta (
    FOREIGN KEY (remedios_id) REFERENCES remedios,
    FOREIGN KEY (consulta_id) REFERENCES consulta,
);

CREATE TABLE equipamentos_has_consulta (
    FOREIGN KEY (equipamentos_id) REFERENCES equipamentos,
    FOREIGN KEY (consulta_id) REFERENCES consulta,
);


-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE `hospital`;
USE `hospital`;

-- -----------------------------------------------------
-- Table `mydb`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`funcionarios` (
  `cpf_funcionario` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `salario` DECIMAL NOT NULL,
  `data_nascimento` DATE NOT NULL,
  PRIMARY KEY (`cpf_funcionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`horarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`horarios` (
  `id_horarios` INT NOT NULL,
  `preco` INT NOT NULL,
  PRIMARY KEY (`id_horarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pacientes` (
  `cpf_paciente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `doenca` VARCHAR(45) NULL,
  `data_nascimento` DATE NOT NULL,
  PRIMARY KEY (`cpf_paciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico` (
  `crm` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `salario` DECIMAL NOT NULL,
  `data_nasc` DATE NOT NULL,
  PRIMARY KEY (`crm`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`equipamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`equipamentos` (
  `id_equipamento` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `quantidade` INT NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_equipamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`remedios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`remedios` (
  `id_remedio` INT NOT NULL,
  `nome_remedio` INT NOT NULL,
  `qtd` INT NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_remedio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paciente` (
  `cpf_paciente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  PRIMARY KEY (`cpf_paciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`consulta` (
  `id_consulta` INT NOT NULL,
  `funcionario_cpf` INT NOT NULL,
  `paciente_cpf_paciente` INT NOT NULL,
  PRIMARY KEY (`id_consulta`, `funcionario_cpf`, `paciente_cpf_paciente`),
  INDEX `fk_consulta_funcionario_idx` (`funcionario_cpf` ASC) VISIBLE,
  INDEX `fk_consulta_paciente1_idx` (`paciente_cpf_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_consulta_funcionario`
    FOREIGN KEY (`funcionario_cpf`)
    REFERENCES `mydb`.`medico` (`crm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_paciente1`
    FOREIGN KEY (`paciente_cpf_paciente`)
    REFERENCES `mydb`.`paciente` (`cpf_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`equipamentos_has_consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`equipamentos_has_consulta` (
  `equipamentos_id_equipamento` INT NOT NULL,
  `consulta_id_consulta` INT NOT NULL,
  PRIMARY KEY (`equipamentos_id_equipamento`, `consulta_id_consulta`),
  INDEX `fk_equipamentos_has_consulta_consulta1_idx` (`consulta_id_consulta` ASC) VISIBLE,
  INDEX `fk_equipamentos_has_consulta_equipamentos1_idx` (`equipamentos_id_equipamento` ASC) VISIBLE,
  CONSTRAINT `fk_equipamentos_has_consulta_equipamentos1`
    FOREIGN KEY (`equipamentos_id_equipamento`)
    REFERENCES `mydb`.`equipamentos` (`id_equipamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipamentos_has_consulta_consulta1`
    FOREIGN KEY (`consulta_id_consulta`)
    REFERENCES `mydb`.`consulta` (`id_consulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`remedios_has_consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`remedios_has_consulta` (
  `remedios_id_remedio` INT NOT NULL,
  `consulta_id_consulta` INT NOT NULL,
  PRIMARY KEY (`remedios_id_remedio`, `consulta_id_consulta`),
  INDEX `fk_remedios_has_consulta_consulta1_idx` (`consulta_id_consulta` ASC) VISIBLE,
  INDEX `fk_remedios_has_consulta_remedios1_idx` (`remedios_id_remedio` ASC) VISIBLE,
  CONSTRAINT `fk_remedios_has_consulta_remedios1`
    FOREIGN KEY (`remedios_id_remedio`)
    REFERENCES `mydb`.`remedios` (`id_remedio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_remedios_has_consulta_consulta1`
    FOREIGN KEY (`consulta_id_consulta`)
    REFERENCES `mydb`.`consulta` (`id_consulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
