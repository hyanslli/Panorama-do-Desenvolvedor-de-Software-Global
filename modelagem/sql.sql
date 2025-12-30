/* ============================
   DIMENSÕES
============================ */

-- Geografia (feita)
CREATE TABLE dim_geografia (
    pk_geografia SERIAL PRIMARY KEY,
    pais         VARCHAR,
);

-- Perfil (feita)
CREATE TABLE dim_perfil (
    pk_perfil         SERIAL PRIMARY KEY,
    id_respondente    INTEGER,
    descricao         VARCHAR,
    faixa_etaria      VARCHAR,
    genero            VARCHAR,
);

-- Ambiente de Trabalho (feita)
CREATE TABLE dim_ambientetrabalho (
    pk_ambientetrabalho    SERIAL PRIMARY KEY,
    id_respondente         VARCHAR, -- Identificador do respondente
    status_emprego         VARCHAR, -- Empregado, Desempregado, Freelancer
    tamanho_empresa        VARCHAR, -- Pequena, Média, Grande
    modalidade_trabalho    VARCHAR, -- Presencial, Remoto, Híbrido
    satisfacao_trabalho    VARCHAR -- Nível de satisfação com o trabalho
);

-- Tempo
CREATE TABLE dim_tempo (
    pk_tempo SERIAL PRIMARY KEY,
    ano      INTEGER
);

-- Tipo de Desenvolvedor
CREATE TABLE dim_tipodesenvolvedor (
    pk_tipodev      SERIAL PRIMARY KEY,
    descricao_tipodev VARCHAR
);

/* ============================
   FATOS
============================ */

-- Fato Respostas dos Desenvolvedores
CREATE TABLE fato_respostasdev (
    fk_geografia          INTEGER NOT NULL,
    fk_perfil             INTEGER NOT NULL,
    fk_educacao           INTEGER NOT NULL,
    fk_ambientetrabalho   INTEGER NOT NULL,
    fk_tempo              INTEGER NOT NULL,
    fk_tipodev           INTEGER NOT NULL,
    id_respondente_origem VARCHAR(50) NOT NULL,
    salario_anual_usd     NUMERIC(18,2),
    anos_experiencia_codigo INTEGER,
    anos_experiencia_profissional INTEGER,

    PRIMARY KEY (fk_geografia, fk_perfil, fk_tipodev, fk_ambientetrabalho, fk_tempo, id_respondente_origem),

    FOREIGN KEY (fk_ambientetrabalho) REFERENCES dim_ambientetrabalho(pk_ambientetrabalho),
    FOREIGN KEY (fk_geografia)         REFERENCES dim_geografia(pk_geografia),
    FOREIGN KEY (fk_perfil)            REFERENCES dim_perfil(pk_perfil),
    FOREIGN KEY (fk_tempo)             REFERENCES dim_tempo(pk_tempo),
    FOREIGN KEY (fk_tipodev)          REFERENCES dim_tipodesenvolvedor(pk_tipodev)
);


