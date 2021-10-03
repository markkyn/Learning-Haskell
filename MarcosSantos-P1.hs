-- Nome : Marcos Gabriel da Silva Santos
-- Matricula: 202100012053
-- Turma: T01

-- Observacoes : As Funcoes auxiliares de cada Questao esta abaixo da Funcao Principal da questao
--              Funcoes Principais:
--                     Questao 1 : satisfaz
--                     Questao 2 : questao2
--                     Questao 3 : somatorio
--                     Questao 4 : semOrdem

-- Questao 1
satisfaz :: Integer -> Bool
satisfaz inteiro
    | length listaDoInteiro /= 4   = error "Numero de Inteiros nao"
    | mult == inteiro          = True
    | otherwise                = False 
        where 
            listaDoInteiro = intToList inteiro 

            inicio = take 2 listaDoInteiro
            final  = drop 2 listaDoInteiro

            soma = listToInt inicio + listToInt final
            mult = soma * soma

-- Funcoes Auxiliares Questao 1
numDigits :: Integer -> Integer
numDigits n = toInteger (round (logBase 10 (fromIntegral n)) + 1)

intToList :: Integer -> [Integer]
intToList number = [ read [x] :: Integer | x <- show number ]

listToInt :: [Integer] -> Integer
listToInt [a,b] = a*10 + b

-- Questao 2
type ListPessoas = [(Nome, Genero, Ano, EstadoCivil)]
type Nome = String
type Genero  = Char
type Ano = Int 
type Idade = Int
type EstadoCivil = Char 

questao2 :: ListPessoas -> Ano -> Genero -> [(Nome, Idade)]
questao2 list anoHoje gen = zip listaNomes listaIdade

    where
        listaNomes = [ getNome x | x <- list, getGenero x == gen] -- Lista de Nomes do Genero Escolhido

        listaIdade = [ calcIdade x anoHoje | x <- list, getGenero x == gen]

-- Funcoes Auxiliares da Questao 2
getNome :: (Nome, Genero, Ano, EstadoCivil) -> Nome
getNome (nom, _, _, _) = nom

getGenero :: (Nome, Genero, Ano, EstadoCivil) -> Genero
getGenero (_, gen, _, _) = gen

getAno :: (Nome, Genero, Ano, EstadoCivil) -> Ano
getAno (_,_,a, _) = a

calcIdade :: (Nome, Genero, Ano, EstadoCivil) -> Ano -> Idade
calcIdade pessoa anoHoje 
    | anoHoje < getAno pessoa = error "Essa pessoa ainda nao nasceu"
    | otherwise               = anoHoje - getAno pessoa  

cadastroTeste :: ListPessoas
cadastroTeste = [
        ("Marcos", 'M', 1999, 'S'),
        ("Giovanny", 'M', 1992, 'C'),
        ("Raimundo", 'M', 1997, 'O'),
        ("Jorge", 'M', 1994, 'V'),
        ("Itallo", 'M', 1992, 'C'),
        ("Leila", 'F', 1972, 'C'),
        ("Victoria", 'F', 1999, 'C'),
        ("Amanda", 'F', 2002, 'S')
    ]

-- Questao 3
somatorio :: Int ->  Int -> Double
somatorio a b = sum [ 1 / ( 2^x ) | x <- [a .. b] ]

-- Questao 4
type Lista = [(Posicao, Number)]
type Number = Int
type Posicao = Int
type ListQuestao = [Number]

semOrdem :: ListQuestao -> Bool 
semOrdem listQuest 
    | listPosicoes == [1 .. quantidadeNum listQuest primNum] = False 
    | otherwise                                              = True 
    where
        tamanho :: [Posicao]
        tamanho = [1 .. length listQuest]
        
        numeros :: [Number]
        numeros = listQuest

        list = zip tamanho numeros

        primNum  = getNumber (head list)

        listPosicoes = [getPosicao x | x <- list, getNumber x == primNum ]

-- Funcoes Auxiliares ( Questao 4 )
getNumFromPosicao :: Lista -> Posicao -> Number
getNumFromPosicao list pos = getNumber ( head [ x | x <- list, getPosicao x == pos] )

getPosicao :: (Posicao, Number) -> Posicao
getPosicao (pos, _ ) = pos

getNumber :: (Posicao, Number) -> Number
getNumber (_ , num) = num 

quantidadeNum :: ListQuestao -> Number -> Int
quantidadeNum list num = length [x | x <- list, x == num]