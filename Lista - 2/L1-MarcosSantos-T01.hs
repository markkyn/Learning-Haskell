-- Nome: Marcos Gabriel da Silva Santos
-- Matricula : 202100012053
-- Turma: T01

dataHoje :: Data
dataHoje = (30,09,2021)

-- Tipos a partir da Questao A
type CPF = Integer
type Nome = String
type Genero = Char
type Dia = Int
type Mes = Int
type Ano = Int
type Data = (Dia, Mes, Ano)
type DataNasc = Data
type Endereco = String
type Municipio = String
type Estado = String
type Telefone = String
type Email = String
type Cidadao = (CPF, Nome, Genero, DataNasc, Endereco, Municipio,Estado, Telefone, Email)

type CadastroSUS = [Cidadao]

-- Tipos a partir da Questao D
type IdadeInicial = Int
type IdadeFinal = Int
type FaixaIdade = (IdadeInicial, IdadeFinal)
type Quantidade = Int

-- Tipos a partir da Questao F
type QuantidadeFormatada = String
type LinhaFormatada = String
type LinhasFormatadas = String
type TotalFormatado = String

-- Tipos a partir da Questao G
type Vacina = String
type TipoDose = Int
type Dose = (Vacina, Data)
type Doses = [Dose]
type Vacinado = ( CPF, Doses )

type Vacinados = [Vacinado]

-- Cadastros

cadastroSUS::CadastroSUS
cadastroSUS = [
    (04511800545, "Marcos Santos"   ,'M', (09,09,1999), "Rua Boludo"                ,"Aracaju"  ,"SE", "998896994"  , "markkyn@gmail.com"),  -- 22 anos | PARCIALMENTE  imunizado
    (26716347665, "Paulo Souza"     ,'M', (11,10,1996), "Rua A, 202"                ,"Muribeca" ,"SE", "999997000"  , "psouza@gmail.com"),   -- 24 anos | ATRASADO
    (12333222334, "Jose da Silva"   ,'M', (01,01,1990), "Rua José"                  ,"Maracatu" ,"MG", "3231231232" , "josesinho@gmail.com"),-- 31 anos | ATRASADO
    (87717347115, "Ana Reis"        ,'F', (01,04,1970), "Rua B, 304"                ,"Aracaju"  ,"SE", "999826004"  , "areis@gmail.com"),    -- 51 anos | VUNERAVEL
    (58759034572, "Raimundo Jorge"  ,'X', (28,09,1972), "Rua B, 304"                ,"Aracaju"  ,"SE", "999826004"  , "areis@gmail.com"),    -- 48 anos | TOTALMENTE    imunizado
    (44233332332, "Jorginho Silva"  ,'M', (26,09,1972), "Rua B, 304"                ,"Aracaju"  ,"SE", "999826004"  , "areis@gmail.com"),    -- 49 anos | VULNERAVEL    imunizado
    (44233424212, "Josefias Decan"  ,'M', (26,09,1972), "Rua B, 304"                ,"Aracaju"  ,"SE", "999826004"  , "areis@gmail.com"),
    (63867508057, "Thiago Santiago" ,'M', (13,05,1981), "Rua Porto, 491"            ,"Curitiba" ,"PR", "65983086273", "santiagovieira@meuteste.com.br"),
    (77185804325, "Yasmin Zanin "   ,'F', (20,01,1964), "Rua Ze, 727"               ,"Juazero"  ,"MG", "35987920626", "zanincalisto@meuteste.com.br"),
    (91010353917, "Sophia Porto"    ,'F', (25,02,1968), "Rua San Joao "             ,"Macapa"   ,"AP", "96987481836", "sophiascheff@meuteste.com.br"),
    (25969757764, "Heitor Roberto"  ,'M', (01,07,1982), "Avenida 234"               ,"Serra"    ,"ES", "28987152998", "robertoambrozzi@meuteste.com.br"),
    (26184931860, "Joaquim Nilton"  ,'M', (02,06,1968), "Rua Paralela, 276"         ,"Maraba"   ,"PA", "94993289942", "niltonjoaquim@meuteste.com.br"),
    (81102000772, "Leandro Moncape" ,'M', (06,05,2005), "Avenida Policial Alves"    ,"Vitoria"  ,"ES", "27982487210", "leandromoncape@meuteste.com.br"),
    (59701483562, "Natalia Cortes"  ,'F', (16,03,2001), "Rua Castro Alves, 123"     ,"Goiania"  ,"GO", "62985796831", "nataliacardiff@meuteste.com"),
    (91257829131, "Hadassa Chelsea" ,'F', (12,03,1987), "Avenida Dr Andre Mendes"   ,"Fortaleza","CE", "85986302489", "hadassachelsea@meuteste.com.br"),
    (79812945849, "Rafael Andre"    ,'M', (19,05,1995), "Rua Bombeiro Motta, 341"   ,"Salvador" ,"BA", "71988110952", "rafaelmanchester@meuteste.com.br"),
    (51452783837, "Lucas Leria"     ,'M', (19,11,1978), "Rua Plinio Salgado, 302"   ,"RioJardim","RJ", "21994296238", "lucaslisboa@meuteste.com.br"),
    (31678947461, "Tereza Augusto"  ,'F', (23,10,1976), "Alameda Vermelha, 213"     ,"Salvador" ,"BA", "71984722460", "terezaaugusto@meuteste.com.br"),
    (84325650761, "Debora Carmen"   ,'F', (12,12,1967), "Rua Andre Gustao, 654"     ,"Serra"    ,"ES", "27982033136", "abardielcamrmen@meuteste.com.br"),
    (83453833141, "Isabela Angel"   ,'F', (05,08,1950), "Rua Galhaço Gustavo, 526"  ,"Valinhos" ,"SP", "17995866243", "isabelaangeles@meuteste.com.br"),
    (45623530699, "Mario Nakamo"    ,'M', (02,04,1984), "Rua Viera Foroni, 437"     ,"Recife"   ,"PE", "71997359940", "takamuramario@meuteste.com"),
    (44383462108, "Anderson Jajaja" ,'M', (27,03,2000), "Rua Baroni Reis, 559"      ,"Joinville","SC", "32999017422", "bliachmaik@meuteste.com.br"),
    (19945212000, "Raul NewCast"    ,'M', (03,01,2001), "Rua Carlos Valinhos, 739"  ,"Sao Paulo","SP", "11997224340", "raulnewcasttle@meuteste.com.br")
    ]


cadastroVacinados :: Vacinados
cadastroVacinados =
    [--     CPF                     Primeira Dose                   Segunda Dose
        ( 04511800545, [( "Pfizer"      , (23, 08, 2021))                                        ] ), -- Marcos Santos
        ( 58759034572, [( "Pfizer"      , (04, 04, 2020)) ,("AstraZeneca"   ,(09, 09, 2020))     ] ), -- Raimundo Jorge
        ( 26716347665, [( "CoronaVac"   , (23, 08, 2021))                                        ] ), -- Paulo Souza (Vacinacao Atrasada)  
        ( 12333222334, [( "AstraZeneca" , (01, 01, 2021))                                        ] ), -- Jose da Silva
        ( 44233424212, [( "AstraZeneca" , (01, 01, 2021))                                        ] ),
        ( 63867508057, [("Pfizer"       , (01, 12, 2020)) ,("Pfizer"        ,(03, 01, 2021))     ] ),
        ( 77185804325, [("AstraZeneca" , (02, 11, 2020))                                         ] ),
        ( 91010353917, [("CoronaVac"    , (17, 11, 2020)) ,("CoronaVac"     ,(30, 12, 2020))     ] ),
        ( 25969757764, [("AstraZeneca"  , (01, 03, 2021)) ,("AstraZeneca"   ,(30, 05, 2021))     ] ),
        ( 26184931860, [("CoronaVac"    , (19, 10, 2020)) ,("CoronaVac"     ,(30, 11, 2020))     ] ),
        ( 81102000772, [("Pfizer"      , (23, 11, 2020))                                         ] ),
        ( 59701483562, [("CoronaVac"   , (13, 09, 2020))                                         ] ),
        ( 91257829131, [("CoronaVac"   , (26, 06, 2020))                                         ] ),
        ( 79812945849, [("Pfizer"       , (27, 07, 2020)) ,("Pfizer"        ,(30, 09, 2020))     ] ),
        ( 84325650761, [("CoronaVac"    , (06, 12, 2020))                                        ] )
    ]
-- Cidadaos de Teste
maria :: Cidadao
maria = (53471688765, "Maria Silva", 'F', (21,12,1984), "Rua A, 202", "Gloria", "SE", "99238912831", "msilva@gmail.com")

markkyn:: Cidadao
markkyn = (12345677890, "Markkyn Soul", 'X', (09,09,1999),"Avenida A", "Sao Paulo", "SP", "998891995", "markkyn")
--              Resumo de Apoio
-- List Comprehenssion VS For Loop
--   ------ FOR LOOP ----------
-- lista_externa = []
-- outra_lista = [1,2,3,4,5,6]
-- for i in outra_lista:
--      lista_externa.append( i * 2 )

--  ------- LIST COMPREHENSSION ---------
--  lista_externa = [ i * 2 | i <- outraLista ]

-- QUESTAO A
adicionaSUS :: Cidadao -> CadastroSUS -> CadastroSUS
adicionaSUS cidadao cadastro
    | not (checaCPF (getCPF cidadao) cadastro) = cadastro ++ [cidadao]
    | otherwise = error "Ja existe um Usuario com esse CPF"

checaCPF :: CPF -> CadastroSUS -> Bool
checaCPF _ [] = False
checaCPF cpf cadSus = not( null [x | x <- cadSus, getCPF x == cpf])

-- QUESTAO B
atualizaEndSus :: CPF -> CadastroSUS -> Endereco -> CadastroSUS
atualizaEndSus cpf cadSus endereco
    | checaCPF cpf cadSus =  cadastroSemCidadao ++ [ cidadaoAtualizado ]
    | otherwise           =  error "Esse CPF nao consta no Cadastro"
    where
        cadastroSemCidadao = removeSUS cpf cadSus

        cidadao = getCidadao cpf cadSus

        cidadaoAtualizado = setEndereco cidadao endereco

atualizaTelSus :: CPF -> CadastroSUS -> Telefone -> CadastroSUS
atualizaTelSus cpf cadSus telefone
    | checaCPF cpf cadSus =  cadastroSemCidadao ++ [ cidadaoAtualizado ]
    | otherwise           =  error "Esse CPF nao consta no Cadastro"
    where
        cadastroSemCidadao = removeSUS cpf cadSus

        cidadao = getCidadao cpf cadSus

        cidadaoAtualizado = setTelefone cidadao telefone


-- QUESTAO C
removeSUS :: CPF -> CadastroSUS -> CadastroSUS
removeSUS _ [] = []
removeSUS cpf cadSus = [x | x <- cadSus, getCPF x /= cpf]


-- QUESTAO D
cidadaosPorMunicipio :: CadastroSUS -> Municipio -> Quantidade
cidadaosPorMunicipio cadastro municipio = length [x | x <- cadastro, getMunicipio x == municipio]

cidadaosPorEstado:: CadastroSUS -> Municipio -> Quantidade
cidadaosPorEstado cadastro estado = length [x | x <- cadastro, getEstado x == estado]

cidadaosPorMunicipioIdade :: CadastroSUS -> Municipio-> FaixaIdade -> Quantidade
cidadaosPorMunicipioIdade cadastro municipio faixaIdade = length [x | x <- cadastro, getMunicipio x == municipio
                                                                        && (getIdade x dataHoje >= getIdadeInicial faixaIdade &&
                                                                            getIdade x dataHoje <= getIdadeFinal faixaIdade)]

cidadaosPorEstadoIdade :: CadastroSUS -> Estado -> FaixaIdade -> Quantidade
cidadaosPorEstadoIdade cadastro estado faixaIdade = length [x | x <- cadastro, getEstado x == estado
                                                                        && (getIdade x dataHoje >= getIdadeInicial faixaIdade &&
                                                                            getIdade x dataHoje <= getIdadeFinal faixaIdade)]

-- QUESTAO E
faixasIdade :: [FaixaIdade]
faixasIdade = [ (12,20), (21,30),(31, 40), (41,50), (51, 60), (61, 70),(71,80),(81, 130)]

geraListaMunicipioFaixas :: CadastroSUS -> Municipio -> [FaixaIdade] -> [(FaixaIdade, Quantidade)]
geraListaMunicipioFaixas cad mun fxa = [(x, y)| x <- fxa, y <- [cidadaosPorMunicipioIdade cad mun x]]
--                                                                  +-> Necessita ser uma lista, com o x dentro do "for" como parametro.

geraListaEstadoFaixas :: CadastroSUS -> Estado -> [FaixaIdade] -> [(FaixaIdade, Quantidade)]
geraListaEstadoFaixas cad est fxa = [(x, y)| x <- fxa, y <- [cidadaosPorEstadoIdade cad est x]]

-- QUESTAO F
listaMunicipioFaixas :: CadastroSUS -> Municipio -> [FaixaIdade] -> IO()
listaMunicipioFaixas cad mun fxa = putStr (
                                            printCabecalho mun  ++
                                            breakLine           ++
                                            printHeader         ++
                                            breakLine           ++
                                            formataLinhas (geraListaMunicipioFaixas cad mun fxa) ++
                                            breakLine           ++
                                            formataTotal  (geraListaMunicipioFaixas cad mun fxa)
    )
    where
        breakLine = "\n"
listaEstadoFaixas :: CadastroSUS -> Estado -> [FaixaIdade] -> IO()
listaEstadoFaixas cad est fxa = putStr (
                                            printCabecalho est  ++
                                            breakLine           ++
                                            printHeader         ++
                                            breakLine           ++
                                            formataLinhas (geraListaMunicipioFaixas cad est fxa) ++
                                            breakLine           ++
                                            formataTotal  (geraListaMunicipioFaixas cad est fxa)
    )
    where
        breakLine = "\n"

printHeader :: String
printHeader = "FAIXAS DE IDADE                QUANTIDADE\n"

printCabecalho :: String -> String
printCabecalho mun = "MUNICIPIO: " ++ mun ++ " \n"

formataQuant :: Quantidade -> QuantidadeFormatada  -- o valores devem ser formatados tirando espaço do lado direito não do esquerdo, exemplo: "        9"
formataQuant x = "     " ++ show x ++ "\n"                                                                                                 -- "       19"  || você pode consertar a função utilizando (repiclate (20 - length (show x)) ' ') 
                                                                                                                                           -- "      234"              

formataUmaLinha :: (FaixaIdade, Quantidade) -> LinhaFormatada
formataUmaLinha (( x, y ), z) = show x ++ "-" ++ show y ++ "                                " ++ show  z ++ "\n"

formataLinhas :: [(FaixaIdade, Quantidade)] -> LinhasFormatadas
formataLinhas faixas = concat [formataUmaLinha x | x <- faixas]

formataTotal ::[( FaixaIdade, Quantidade )] -> TotalFormatado
formataTotal faixas = "TOTAL                                " ++ show quantTotal ++ "\n"
    where
        quantTotal = sum [getQuantidade x | x <- faixas]


-- QUESTAO G
aplicaPrimDose :: CPF -> CadastroSUS -> FaixaIdade -> Municipio -> Vacina -> Data -> Vacinados -> Vacinados
aplicaPrimDose    cpf       cadSus         fxa            mun        vac       dat     cadVac    -- Retorno

    | isVacinado cpf cadVac                                                         = error "Esse Cidadao ja recebeu uma dose da vacina"
    | not (isVacinado cpf cadVac)       && not (isCadastrado cpf cadSus)            = error "Esse Cidadao nao esta Cadastrado no SUS"
    | not (isVacinado cpf cadVac)       && isCadastrado cpf cadSus
   && not (isIdadeOk cpf cadSus fxa)                                                = error "Esse Cidadao nao esta na Faixa de Idade"
    | not (isVacinado cpf cadVac)       && isCadastrado cpf cadSus
   && not (isIdadeOk cpf cadSus fxa)    && not (checaMunicipio cpf cadSus mun )     = error "Esse Cidadao nao esta registrado no municipio "
    | otherwise = [ (getCPF x, geraListaVacinas vac) | x <- cadSus, getCPF x == cpf] ++ cadVac
                -- +-> esse x e um Cidadao
    where
        dataH = dat

        geraListaVacinas vacina
            | vacina == "Jenssen" = [("Jenssen", dataH), ("Jenssen", dataH)]
            | otherwise = [(vacina, dataH)]

-- QUESTAO H
aplicaSegDose:: CPF -> Data -> Vacinados -> Vacinados
aplicaSegDose   cpf     dat     cadVac
    | not (isVacinado cpf cadVac)                                   = error "Esse cidadao nao esta vacinado"
    | isVacinado cpf cadVac && isFullyVacinated cpf cadVac          = error "Esse cidadao ja esta totalmente imunizado"
    | isVacinado cpf cadVac && not (isFullyVacinated cpf cadVac)
  && not (isDataOk dataPrimDose dat)                                = error "As datas nao conferem"
    | isVacinado cpf cadVac && not(isFullyVacinated cpf cadVac)
  &&  isDataOk dataPrimDose dat                                     = novoVacinado : semVacinado cpf cadVac
    where
        dataPrimDose   = getDataPrim (getVacinado cpf cadVac)
        primeiraDose   = getPrimDose (getVacinado cpf cadVac)
        vacinaPrimDose = getVacina primeiraDose

        doses    = novaDoses vacinaPrimDose dat primeiraDose

        novoVacinado = (cpf, doses)

-- QUESTAO I
atualizaVacina :: CPF -> TipoDose -> Vacina -> Vacinados -> Vacinados
atualizaVacina cpf tipo vac cadVac
    | not( isVacinado cpf cadVac )       = error "Esse Cidadao nao esta Vacinado"
    | tipo > getQuantDoses vacinado      = error "Essa Dose nao foi ministrada nesse cidadao"
    | otherwise                          = setNomeDose vacinado tipo vac : semVacinado cpf cadVac
    where
        vacinado = getVacinado cpf cadVac

-- QUESTAO J
quantidadeDoseMun :: Vacinados -> TipoDose -> Municipio -> CadastroSUS -> Quantidade
quantidadeDoseMun cadVac tipo mun cadSUS  = length [ vacinado | vacinado <-  cadastroVacinados, getQuantDoses vacinado == tipo
                                                            && getMunicipio (getCidadao (getCPFVacinado vacinado) cadSUS) == mun]

quantidadeDoseEst :: Vacinados -> TipoDose -> Estado -> CadastroSUS -> Quantidade
quantidadeDoseEst cadVac tipo est cadSUS  = length [ vacinado | vacinado <-  cadastroVacinados, getQuantDoses vacinado == tipo
                                                            && getEstado (getCidadao (getCPFVacinado vacinado) cadSUS) == est
                                                   ]
-- QUESTAO K
quantidadeMunIdDose :: Vacinados -> Estado -> FaixaIdade -> TipoDose -> CadastroSUS -> Quantidade
quantidadeMunIdDose     cadVac        mun          fxa         tipo        cadSUS
    = length [ vacinado | vacinado <-  cadastroVacinados, getQuantDoses vacinado == tipo
                                                       && getMunicipio (getCidadao (getCPFVacinado vacinado) cadSUS) == mun
                                                       && isIdadeOk ( getCPFVacinado vacinado ) cadSUS fxa
             ]

quantidadeEstIdDose :: Vacinados -> Estado -> FaixaIdade -> TipoDose -> CadastroSUS -> Quantidade
quantidadeEstIdDose     cadVac        est          fxa         tipo        cadSUS
    = length [ vacinado | vacinado <-  cadastroVacinados, getQuantDoses vacinado == tipo
                                                       && getEstado (getCidadao (getCPFVacinado vacinado) cadSUS) == est
                                                       && isIdadeOk ( getCPFVacinado vacinado ) cadSUS fxa
             ]

-- QUESTAO L
quantidadeMunVacDose :: Vacinados -> Municipio -> Vacina -> TipoDose -> CadastroSUS -> Quantidade
quantidadeMunVacDose cadVac mun vac tipo cadSUS
    = length [ vacinado | vacinado <- cadastroVacinados, getQuantDoses vacinado == tipo
                                        && getMunicipio (getCidadao (getCPFVacinado vacinado) cadSUS) == mun
                                        && getVacina (getDosePorTipo vacinado tipo) == vac
             ]

quantidadeEstVacDose :: Vacinados -> Estado -> Vacina -> TipoDose -> CadastroSUS -> Quantidade
quantidadeEstVacDose cadVac est vac tipo cadSUS
    = length [ vacinado | vacinado <- cadastroVacinados,
                                        getQuantDoses vacinado == tipo
                                        && getEstado (getCidadao (getCPFVacinado vacinado) cadSUS) == est
                                        && getVacina (getDosePorTipo vacinado tipo) == vac
             ]

-- QUESTAO M 
quantidadeMunAtrasados :: Vacinados -> CadastroSUS -> Municipio -> Quantidade
quantidadeMunAtrasados      cadVac        cadSUS        mun      = length
    [
        x | x <- cadVac,
         estaAtrasada dataHoje (getPrimDose x)
         && getMunicipio ( getCidadao (getCPFVacinado x) cadSUS ) == mun
         && not (isFullyVacinated (getCPFVacinado x) cadVac )
    ]
quantidadeEstAtrasados :: Vacinados -> CadastroSUS -> Estado -> Quantidade
quantidadeEstAtrasados      cadVac        cadSUS        est      = length
    [
        x | x <- cadVac,
         estaAtrasada dataHoje (getPrimDose x)
         && getEstado ( getCidadao (getCPFVacinado x) cadSUS ) == est
         && not (isFullyVacinated (getCPFVacinado x) cadVac )
    ]

-- QUESTAO N
quantidadeVacinadosPorGeneroMun :: Vacinados -> CadastroSUS -> Genero -> Municipio -> TipoDose -> Quantidade
quantidadeVacinadosPorGeneroMun cadVac cadSUS gen mun tipo = length
    [
       x | x <- cadVac, getQuantDoses x == tipo
                     && getMunicipio (getCidadao (getCPFVacinado x) cadSUS) == mun
                     && getGenero (getCidadao (getCPFVacinado x) cadSUS) == gen
    ]
quantidadeVacinadosPorGeneroEst :: Vacinados -> CadastroSUS -> Genero -> Estado -> TipoDose -> Quantidade
quantidadeVacinadosPorGeneroEst cadVac cadSUS gen est tipo = length
    [
       x | x <- cadVac, getQuantDoses x == tipo
                     && getEstado (getCidadao (getCPFVacinado x) cadSUS) == est
                     && getGenero (getCidadao (getCPFVacinado x) cadSUS) == gen
    ]


-- QUESTAO O
exibir :: Vacinados -> CadastroSUS -> Genero -> Municipio -> TipoDose -> IO()
exibir cadVac cadSUS gen mun tipo = putStr (
                                                cabecalho  ++
                                                infoGenero ++
                                                breakLine  ++
                                                infoQuantidade

    )
    where
        quantidade = quantidadeVacinadosPorGeneroMun cadVac cadSUS gen mun tipo

        breakLine = "\n"

        cabecalho = "MUNICIPIO: " ++ mun ++ "\n"

        infoGenero = "GENERO: " ++ show gen ++ "\n"

        infoQuantidade = "Existem " ++ show quantidade ++ " cidadaos vacinados do Genero " ++ show gen ++" em " ++ mun ++ "\n"


-- ====================================================================================================================================================================

--  ===================================================== FUNCOES AUXILIARES  =========================================================================================

-- ====================================================================================================================================================================

-- FUNCOES ENVOLVENDO CIDADAO
getCidadao :: CPF -> CadastroSUS -> Cidadao
getCidadao cpf cadSUS = head [x | x <- cadSUS, getCPF x == cpf ]

getEstado :: (a,b,c,d,e,f,Estado,h,i) -> Estado
getEstado (_,_,_,_,_,_,estado,_,_) = estado

getMunicipio :: (a,b,c,d,e,Municipio,g,h,i) -> Municipio
getMunicipio (_,_,_,_,_,municipio, _,_,_) = municipio

getCPF :: (CPF,b,c,d,e,f,g,h,i) -> CPF
getCPF (cpf, _,_,_,_,_,_,_,_ ) = cpf

getGenero :: (a,b,Genero,d,e,f,g,h,i) -> Genero
getGenero (_,_,gender, _,_,_,_,_,_) = gender

setEndereco :: Cidadao -> Endereco -> Cidadao
setEndereco (a, b, c, d, e, f, g, h, i)  endereco = (a, b, c, d, endereco, f, g, h, i)

setTelefone :: Cidadao -> Telefone -> Cidadao
setTelefone (a, b, c, d, e, f, g, h, i)  telefone = (a, b, c, d, e, f, g, telefone, i)

checaMunicipio :: CPF ->  CadastroSUS -> Municipio -> Bool
checaMunicipio cpf cadSus mun = not (null [x | getMunicipio (getCidadao cpf cadSus) == mun, x <- cadSus])

isCadastrado :: CPF -> CadastroSUS -> Bool
isCadastrado = checaCPF


-- FUNCOES ENVOLVENDO IDADE
getIdadeInicial:: FaixaIdade -> IdadeInicial
getIdadeInicial ( inicial , _ ) = inicial

getIdadeFinal:: FaixaIdade -> IdadeFinal
getIdadeFinal ( _ , final ) = final

getIdade :: (a,b,c,DataNasc,e,f,g,h,i) -> Data -> Int
getIdade (_,_,_,( diaNasc, mesNasc, anoNasc ), _,_,_,_,_) (diaHoje, mesHoje, anoHoje)
        | mesHoje < mesNasc                             = anoHoje - anoNasc - 1
        | (mesNasc == mesHoje) && (diaNasc > diaHoje)   = anoHoje - anoNasc - 1
        | otherwise                                     = anoHoje - anoNasc

isIdadeOk :: CPF ->  CadastroSUS -> FaixaIdade -> Bool
isIdadeOk cpf cadSus fxa                            = not (null [ x | x <- cadSus
                                                        , (getIdadeInicial fxa <= getIdade x dataHoje)
                                                        && (getIdade x dataHoje <= getIdadeFinal fxa)
                                                        && (getCPF x ==  cpf) ])

-- FUNCOES ENVOLVENDO DATA
getDia :: Data -> Dia
getDia (d,_,_) = d

getMes :: Data -> Dia
getMes (_,m,_) = m

getAno :: Data -> Dia
getAno (_,_,a) = a

isDataOk :: Data -> Data -> Bool
isDataOk (diaP, mesP, anoP) (diaS, mesS, anoS)
    | anoS < anoP                                       = False
    | anoS >= anoP && mesS < mesP                       = False
    | anoS >= anoP && mesP <= mesS && diaS <= diaP      = False -- Levando em consideracao que ele nao pode tomar 2 vacinas no mesmo dia 
                                                                -- (exceto na jenssen , que tem uma funcaoEspecifica)
    | otherwise                                         = True

getDataPrim :: Vacinado -> Data
getDataPrim ( _, [(_, x)]) = x

getDataPrimDose :: Dose -> Data
getDataPrimDose (_,dat) = dat


diferencaData :: Data -> Data -> Int
diferencaData  dataH  dat = (365 * (anoHoje - anoDps)) + ( 30 *(mesHoje - mesDps) ) + (diaHoje - diaDps )

  where
    diaHoje = getDia dataH
    mesHoje = getMes dataH
    anoHoje = getAno dataH
    diaDps  = getDia dat
    mesDps  = getMes dat
    anoDps  = getAno dat

-- FUNCOES ENVOLVENDO VACINADO
getVacinado :: CPF -> Vacinados -> Vacinado
getVacinado cpf cadVac = head [x | x <- cadVac, getCPFVacinado x == cpf]

getCPFVacinado :: Vacinado -> CPF
getCPFVacinado (cpf, _ ) = cpf

semVacinado :: CPF -> Vacinados -> Vacinados
semVacinado cpf vacinados = [ x | x <- vacinados , getCPFVacinado x /= cpf ]

-- FUNCOES ENVOLVENDO VACINA


getQuantDoses :: Vacinado -> Quantidade
getQuantDoses (_, doses) = length doses

getPrimDose :: Vacinado -> Dose
getPrimDose (_, [(vac, dat),_]) = (vac, dat)
getPrimDose (_, [(vac, dat)]) = (vac, dat)

getSegDose :: Vacinado -> Dose
getSegDose (_, [ _,(vac, dat)]) = (vac, dat)

getDosePorTipo :: Vacinado -> TipoDose -> Dose
getDosePorTipo       vac         tipo
    | tipo == 1 = getPrimDose vac
    | tipo == 2 = getSegDose  vac
    | otherwise = error "o Tipo nao consere com a quantidade de doses"

setNomePrimDose :: Vacinado -> Vacina -> Vacinado
setNomePrimDose (a, [ (b, c), d ])  novoNome = (a , [(novoNome,c),d])
setNomePrimDose (a, [ (b, c)])      novoNome = (a , [(novoNome,c)])

setNomeSegDose :: Vacinado -> Vacina -> Vacinado
setNomeSegDose (a, [ primDose, (b, c) ]) novoNome = (a, [primDose, (novoNome, c) ])

setNomeDose :: Vacinado -> TipoDose ->  Vacina -> Vacinado
setNomeDose     vacinad       tipo         vac
    |  tipo == 1                    = setNomePrimDose vacinad vac
    |  tipo == 2                    = setNomeSegDose  vacinad vac
    |  tipo  > 2 || tipo < 1        = error "Tipo de Vacina nao compativel"

getVacina :: Dose -> Vacina
getVacina (vac, _) = vac

isVacinado :: CPF -> Vacinados -> Bool
isVacinado cpf cadVac = not( null [x | x <- cadVac, getCPFVacinado x == cpf])

isFullyVacinated :: CPF -> Vacinados -> Bool
isFullyVacinated cpf vac = not(null [x | x <- vac, (getCPFVacinado x == cpf) && (getQuantDoses x > 1) ])

novaDoses :: Vacina -> Data -> Dose -> Doses
novaDoses vac dat primDose = [primDose, segDose]
    where
        segDose = (vac, dat)

estaAtrasada :: Data -> Dose -> Bool
estaAtrasada dataH primeiraDose
    | (getVacina primeiraDose == "AstraZeneca" || getVacina primeiraDose == "Pfizer")
   && diferencaData dataH (getDataPrimDose primeiraDose) > 90                       = True
    | (getVacina primeiraDose == "CoronaVac")
   && diferencaData dataH (getDataPrimDose primeiraDose) > 21                       = True
    | otherwise                                                                        = False

getQuantidade :: ( FaixaIdade, Quantidade ) -> Quantidade
getQuantidade (_, quant) = quant

-- ======================================================================================================================================================================================================================
-- ======================================================================== FUNCOES AUXILIARES DA PARTE 2 =============