
-- NOME : Marcos Gabriel da Silva Santos
-- MATRICULA : 202100012053

import Data.Char ( isLetter, isDigit, isAlphaNum )

teste1 :: [Int]
teste1 = [-9,8,-7,6,-5,-4,-3,-2,-1,0,1,2,3,4]

teste2 :: String
teste2 = "1f2bde3ac"

permutado2 :: String
permutado2 = "abcdef123"

teste3 :: String
teste3 = "abcdegf977123-9127)@#*&)(&#!@32zxz34zvv"


-- QUESTAO 1
-- NOME : Marcos Gabriel da Silva Santos
-- MATRICULA : 202100012053
questao1 :: [Int] -> [Int]
questao1 entrada = questao1Auxiliar entrada []

questao1Auxiliar :: [Int] -> [Int] -> [Int]
questao1Auxiliar [] cheio = cheio
questao1Auxiliar (x:xs) auxiliar
    | x > 0 = questao1Auxiliar xs (x:auxiliar)
    | otherwise = questao1Auxiliar xs auxiliar

-- QUESTAO 2
-- NOME : Marcos Gabriel da Silva Santos
-- MATRICULA : 202100012053
questao2 :: [Char] -> [Char] -> Bool
questao2 [] _ = True
questao2 (x:xs) b
    | isElementoInLista x b
   && quantidadeAparece x (x:xs) 0 == quantidadeAparece x b 0 = questao2 xs b
    | otherwise = False

isElementoInLista :: Char -> [Char] -> Bool
isElementoInLista _ [] = False
isElementoInLista elemento (x:xs)
    | elemento == x = True
    | otherwise = isElementoInLista elemento xs

quantidadeAparece :: Char -> [Char] -> Int -> Int
quantidadeAparece _ [] quantidadeFinal = quantidadeFinal
quantidadeAparece elemento (x:xs) quantidadeInicial
    | elemento == x = quantidadeAparece elemento xs (quantidadeInicial+1)
    | otherwise = quantidadeAparece elemento xs quantidadeInicial

-- QUESTAO 3
-- NOME : Marcos Gabriel da Silva Santos
-- MATRICULA : 202100012053
questao3 :: String -> ([Char],[Char],[Char])
questao3 xs = questao3Auxiliar xs [] [] []

questao3Auxiliar :: String -> [Char] -> [Char]-> [Char]-> ([Char],[Char],[Char])
questao3Auxiliar [] letras digitos alphanum = (letras,digitos, alphanum)
questao3Auxiliar (x:xs) letras digitos alphanum
    | isLetter x = questao3Auxiliar xs (x:letras) digitos alphanum
    | isDigit x = questao3Auxiliar xs letras (x:digitos) alphanum
    | not (isAlphaNum x) = questao3Auxiliar xs letras digitos (x:alphanum)
    | otherwise = questao3Auxiliar xs letras digitos alphanum

-- QUESTAO 4 - INCOMPLETA
--questao4 :: [Int] -> Int -> Int
--questao4 [] =
--questao4 (x:xs) = 1 + questao4 xs

