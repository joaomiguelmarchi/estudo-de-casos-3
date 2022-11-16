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
