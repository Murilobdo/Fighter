-- Inserir 10 ataques aleatórios
INSERT INTO ATAQUES (Nome, Elemento, DanoAtaque, CustoEnergia, TipoAtaque)
VALUES
('Chama Ardente', 'Fogo', 50.0, 10, 1),
('Raio Congelante', 'Gelo', 40.0, 8, 2),
('Terremoto', 'Terra', 60.0, 12, 3),
('Tornado', 'Ar', 45.0, 9, 4),
('Explosão Solar', 'Fogo', 55.0, 11, 2),
('Nevasca', 'Gelo', 50.0, 10, 3),
('Desmoronamento', 'Terra', 65.0, 13, 4),
('Furacão', 'Ar', 55.0, 11, 1),
('Inundação', 'Água', 45.0, 9, 2);

-- Inserir 10 defesas aleatórias
INSERT INTO DEFESAS (Nome, Valor, CustoEnergia)
VALUES
('Barreira de Fogo', 20, 5),
('Escudo de Gelo', 15, 4),
('Parede de Terra', 25, 6),
('Cúpula de Ar', 18, 5),
('Bolha de Água', 12, 3),
('Campo de Energia', 22, 5),
('Capa de Neve', 17, 4),
('Muralha de Pedra', 30, 7),
('Redemoinho de Vento', 24, 6),
('Escudo Aquático', 20, 5);

-- Inserir 25 personagens aleatórios
INSERT INTO PERSONAGENS (Nome, Vida, PontosDeAtaque, PontosDeDefesa)
VALUES
('Guerreiro', 100, 30, 20),
('Mago', 80, 35, 15),
('Arqueiro', 90, 25, 25),
('Paladino', 110, 28, 22),
('Assassino', 85, 40, 18),
('Monge', 95, 27, 23),
('Bárbaro', 120, 32, 18),
('Druida', 100, 29, 21),
('Necromante', 75, 38, 14),
('Caçador', 95, 26, 24),
('Samurai', 105, 31, 19),
('Ladino', 85, 34, 16),
('Clérigo', 100, 28, 22),
('Bardo', 90, 30, 20),
('Feiticeiro', 80, 36, 14),
('Gladiador', 110, 33, 17),
('Viking', 115, 35, 15),
('Mestre das Espadas', 95, 32, 18),
('Elementalista', 85, 37, 13),
('Místico', 100, 28, 21),
('Guardião', 120, 29, 21),
('Ninja', 90, 35, 15),
('Cavaleiro', 105, 30, 20),
('Alquimista', 75, 34, 16),
('Ilusionista', 80, 36, 14);

-- Inserir relações entre personagens e ataques
DECLARE @PersonagemId INT
DECLARE @AtaqueId INT
DECLARE @DefesaId INT

DECLARE PersonagemCursor CURSOR FOR
SELECT Id FROM PERSONAGENS
OPEN PersonagemCursor
FETCH NEXT FROM PersonagemCursor INTO @PersonagemId

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Inserir 5 ataques para cada personagem
    INSERT INTO ATAQUES_DOS_PERSONAGENS (PersonagemId, AtaqueId)
    SELECT @PersonagemId, Id FROM ATAQUES ORDER BY NEWID() OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY

    -- Inserir 3 defesas para cada personagem
    INSERT INTO DEFESAS_DOS_PERSONAGENS (PersonagemId, DefesaId)
    SELECT @PersonagemId, Id FROM DEFESAS ORDER BY NEWID() OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY

    FETCH NEXT FROM PersonagemCursor INTO @PersonagemId
END

CLOSE PersonagemCursor
DEALLOCATE PersonagemCursor

-- Conferir resultados
SELECT * FROM PERSONAGENS
SELECT * FROM ATAQUES
SELECT * FROM DEFESAS
SELECT * FROM ATAQUES_DOS_PERSONAGENS
SELECT * FROM DEFESAS_DOS_PERSONAGENS
