CREATE DATABASE MedPlants;

USE MedPlants;

CREATE TABLE USUARIOS (
	ID_USER INT NOT NULL AUTO_INCREMENT,
	CPF_USER INT NOT NULL UNIQUE,
	NOME_USER VARCHAR(50) NOT NULL,
	SOBRENOME_USER VARCHAR(50) NOT NULL,
	EMAIL_USER VARCHAR(50) NOT NULL,
	SENHA_USER VARCHAR(15) NOT NULL,
	DATA_NASCIMENTO_USER DATE,
	PERGUNTA_SECRETA_USER VARCHAR(200) NOT NULL,
	RESPOSTA_SECRETA_USER TEXT NOT NULL,
	PRIMARY KEY(ID_USER)
);
   
CREATE TABLE SINTOMAS (
	ID_SINT INT NOT NULL AUTO_INCREMENT,
	PALAVRA_CHAVE_SINT VARCHAR(30) NOT NULL,
	DESCRICAO_SINT TEXT NULL,
	PRIMARY KEY(ID_SINT)
);

CREATE TABLE USUARIO_TEM_SINTOMAS (
	USUARIO_TEM_SINTOMAS_ID_USER INT NOT NULL,
    USUARIO_TEM_SINTOMAS_ID_SINT INT NOT NULL,
    FOREIGN KEY (USUARIO_TEM_SINTOMAS_ID_USER) REFERENCES USUARIOS (ID_USER),
    FOREIGN KEY (USUARIO_TEM_SINTOMAS_ID_SINT) REFERENCES SINTOMAS (ID_SINT),
    PRIMARY KEY (USUARIO_TEM_SINTOMAS_ID_USER, USUARIO_TEM_SINTOMAS_ID_SINT)
);

   
CREATE TABLE ERVAS (
	ID_ERV INT NOT NULL AUTO_INCREMENT,
	NOME_POPULAR_ERV VARCHAR(40) NOT NULL,
	NOME_CIENTIFICO VARCHAR(100) NULL,
	INDICACAO_USO_ERV VARCHAR(100) NOT NULL,
	PRIMARY KEY(ID_ERV)
);

CREATE TABLE UTILIZACAO (
	SINTOMAS_ID_SINT INT NOT NULL,
    ERVAS_ID_ERV INT NOT NULL,
    MODO_PREPARO_ATUA TEXT,
    FOREIGN KEY (SINTOMAS_ID_SINT) REFERENCES SINTOMAS (ID_SINT),
    FOREIGN KEY (ERVAS_ID_ERV) REFERENCES ERVAS (ID_ERV),
    PRIMARY KEY(SINTOMAS_ID_SINT, ERVAS_ID_ERV)
);
  
   
CREATE TABLE PROPRIEDADES (
	ID_PROPRI INT NOT NULL AUTO_INCREMENT,
	DESCRICAO_PROPRI TEXT NOT NULL,
	PRIMARY KEY(ID_PROPRI)
);

CREATE TABLE ERVAS_TEM_PROPRIEDADES (
	ERVAS_ID_ERV INT NOT NULL,
	PROPRIEDADES_ID_PROPRI INT NOT NULL,
    FOREIGN KEY (ERVAS_ID_ERV) REFERENCES ERVAS(ID_ERV),
    FOREIGN KEY (PROPRIEDADES_ID_PROPRI) REFERENCES PROPRIEDADES(ID_PROPRI),
    PRIMARY KEY(ERVAS_ID_ERV, PROPRIEDADES_ID_PROPRI)
);
    
CREATE TABLE CONTRA_INDICACAO (
	ID_CONTRA_INDIC INT NOT NULL AUTO_INCREMENT,
    DESCRICACAO_CONTRA_INDIC VARCHAR(200) NOT NULL,
    PRIMARY KEY(ID_CONTRA_INDIC)
);

CREATE TABLE ERVAS_TEM_CONTRA_INDICACAO (
	CONTRA_IND_ID_CONTRA_INDIC INT NOT NULL,
    ERVAS_ID_ERV INT NOT NULL,
	PRIMARY KEY(CONTRA_IND_ID_CONTRA_INDIC, ERVAS_ID_ERV),
    FOREIGN KEY (CONTRA_IND_ID_CONTRA_INDIC) REFERENCES CONTRA_INDICACAO(ID_CONTRA_INDIC),
    FOREIGN KEY (ERVAS_ID_ERV) REFERENCES ERVAS(ID_ERV)
);



