-- CREATE DATABASE FighterDb

DROP TABLE ATAQUES, DEFESAS, ATAQUES_DOS_JOGADORES, DEFESAS_DOS_JOGADORES, HISTORICO_DE_COMBATE, PERSONAGENS
--TABELAS PRIMARIAS
CREATE TABLE PERSONAGENS (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    Nome VARCHAR(20) NOT NULL,
    Vida VARCHAR(20) NOT NULL,
    PontosDeAtaque INT NOT NULL,
    PontosDeDefesa INT NOT NULL
)

CREATE TABLE ATAQUES (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    Nome VARCHAR(20) NOT NULL,
    Elemento VARCHAR(20) NOT NULL,
    DanoAtaque DECIMAL NOT NULL,
    CustoEnergia INT NOT NULL,
    TipoAtaque INT NOT NULL
)

CREATE TABLE DEFESAS (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    Nome VARCHAR(20) NOT NULL,
    Dano VARCHAR(20) NOT NULL,
    CustoEnergia INT NOT NULL
)

CREATE TABLE ATAQUES_DOS_PERSONAGENS (
    Id INT NOT NULL PRIMARY KEY,
    PersonagemId INT NOT NULL,
    AtaqueId INT NOT NULL,
    FOREIGN KEY (PersonagemId) REFERENCES PERSONAGENS(Id),
    FOREIGN KEY (AtaqueId) REFERENCES ATAQUES(Id)
)

CREATE TABLE DEFESAS_DOS_PERSONAGENS (
    Id INT NOT NULL PRIMARY KEY,
    PersonagemId INT NOT NULL,
    DefesaId INT NOT NULL,
    FOREIGN KEY (PersonagemId) REFERENCES PERSONAGENS(Id),
    FOREIGN KEY (DefesaId) REFERENCES DEFESAS(Id)
)     

--TABELAS DE RELACIONAMENTOS
CREATE TABLE HISTORICO_DE_COMBATE (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    PersAtacanteId INT NOT NULL,
    PersDefensorId INT NOT NULL,
    AtaqueId INT NOT NULL,
    DefesaId INT NULL,
    CONSTRAINT FK_HISTORICO_PERSONAGEM_ATACANTE FOREIGN KEY(PersAtacanteId) REFERENCES PERSONAGENS(Id),
    CONSTRAINT FK_HISTORICO_PERSONAGEM_DEFENSOR FOREIGN KEY(PersDefensorId) REFERENCES PERSONAGENS(Id),
    CONSTRAINT FK_HISTORICO_ATAQUE_REALIZADO FOREIGN KEY(AtaqueId) REFERENCES ATAQUES(Id),
    CONSTRAINT FK_HISTORICO_DEFESA_REALIZADA FOREIGN KEY(AtaqueId) REFERENCES DEFESAS(Id)
)

-- Inserir Ataques Balanceados
INSERT INTO ATAQUES (Nome, Elemento, DanoAtaque, CustoEnergia, TipoAtaque) VALUES
('Ataque Rápido', 'Físico', 15.0, 4, 1),
('Ataque Pesado', 'Físico', 25.0, 7, 1),
('Bola de Fogo', 'Fogo', 20.0, 6, 2),
('Raio Congelante', 'Gelo', 18.0, 5, 2),
('Explosão Elétrica', 'Eletricidade', 22.0, 6, 2),
('Chute Voador', 'Físico', 17.0, 4, 1),
('Soco Poderoso', 'Físico', 20.0, 5, 1),
('Lança de Gelo', 'Gelo', 22.0, 6, 2),
('Tornado de Vento', 'Ar', 18.0, 5, 2),
('Explosão Solar', 'Fogo', 25.0, 7, 2),
('Raio de Plasma', 'Eletricidade', 23.0, 6, 2),
('Golpe de Trovão', 'Eletricidade', 21.0, 5, 1),
('Maremoto', 'Água', 24.0, 7, 2),
('Terremoto', 'Terra', 26.0, 8, 2),
('Golpe Sombrio', 'Sombrio', 19.0, 5, 2);

-- Inserir Defesas Balanceadas
INSERT INTO DEFESAS (Nome, Dano, CustoEnergia) VALUES
('Escudo de Madeira', '10', 3),
('Escudo de Ferro', '15', 4),
('Barreira de Energia', '20', 5),
('Escudo de Energia', '25', 6),
('Barreira de Gelo', '18', 4),
('Muralha de Fogo', '20', 5),
('Campo de Força', '22', 6),
('Escudo Espiritual', '30', 8),
('Defesa Relâmpago', '15', 3),
('Manto de Sombras', '12', 3),
('Redemoinho de Água', '20', 4),
('Proteção de Terra', '28', 7),
('Escudo de Luz', '27', 7);