-- Nome: Marcos Gabriel da Silva Santos
-- Matricula : 202100012053
-- Turma: T01

-- PARA FACILITAR A BUSCA POR QUESTOES PROCURE PELOS SEGUINTES COMENTARIOS (Utilizando Ctrl+F) :
    -- QUESTAO 1.A
    -- QUESTAO 1.B
    -- QUESTAO 1.C
    -- QUESTAO 1.D
    -- QUESTAO 1.E
    -- QUESTAO 1.F
    -- QUESTAO 1.G

    -- QUESTAO 2
    -- QUESTAO 3
    -- QUESTAO 4
    -- QUESTAO 5
-- ========================================================================= TIPOS DA PRIMEIRA LISTA ======================================================================
dataHoje :: Data
dataHoje = (30,09,2021)

type CPF = Integer
type Nome = String
type Genero = Char
type Dia = Int
type Mes = Int
type Ano = Int

type Data = (Dia, Mes, Ano)
type DataNasc = Data
type DataHoje = Data

type Endereco = String
type Municipio = String
type Estado = String
type Telefone = String
type Email = String
type Cidadao = (CPF, Nome, Genero, DataNasc, Endereco, Municipio,Estado, Telefone, Email)

type CadastroSUS = [Cidadao]


type Idade = Int
type IdadeInicial = Idade
type IdadeFinal = Idade
type FaixaIdade = (IdadeInicial, IdadeFinal)
type Quantidade = Int

type QuantidadeFormatada = String
type LinhaFormatada = String
type LinhasFormatadas = String
type TotalFormatado = String

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
    (12333222334, "Jose da Silva"   ,'M', (01,01,1990), "Rua José"                  ,"Muribeca" ,"SE", "3231231232" , "josesinho@gmail.com"),-- 31 anos | ATRASADO
    (87717347115, "Ana Reis"        ,'F', (01,04,1970), "Rua B, 304"                ,"Aracaju"  ,"SE", "999826004"  , "areis@gmail.com"),    -- 51 anos | VUNERAVEL
    (58759034572, "Raimundo Jorge"  ,'X', (28,09,1972), "Rua B, 304"                ,"Estancia"  ,"SE", "999826004"  , "areis@gmail.com"),    -- 48 anos | TOTALMENTE    imunizado
    (44233332332, "Jorginho Silva"  ,'M', (26,09,1972), "Rua B, 304"                ,"Estancia"  ,"SE", "999826004"  , "areis@gmail.com"),    -- 49 anos | VULNERAVEL    imunizado
    (44233424212, "Josefias Decan"  ,'M', (26,09,1972), "Rua B, 304"                ,"Estancia"  ,"SE", "999826004"  , "areis@gmail.com"),
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

-- ================================================================== TIPOS DA SEGUNDA LISTA ======================================================================
type ListaCidadaoFiltrada   = [Cidadao]
type ListaVacinadosFiltrada = Vacinados
type ListaVaziaApresentacao = Apresentacao

type QuantidadeDoses = Int
type QuantidadeInicial = Int

type ProximaFaixaDeIdade = FaixaIdade -- a proxima faixa de idade será Invertida (24, 22)

type Populacao = Int

type PopMun = (Municipio, [(FaixaIdade, Populacao)])
type PopEstado = (Estado, [PopMun])
type PopPais   = [PopEstado]

type Porcentagem = Double

type Apresentacao = [ (Municipio, Porcentagem) ]

populacaoAracaju :: PopMun
populacaoAracaju = ("Aracaju", [ ((0,10), 3000),((11,20), 4000),((21,30), 5000),((31,40), 5000),((41,50), 4000),((51,60), 3000),
                            ((61,70), 1600),((71,80), 900), ((81,90), 300),((91,100), 80),((101,120), 5),((121,130), 0)])

populacaoMuribeca :: PopMun
populacaoMuribeca = ("Muribeca", [ ((0,10), 3000),((11,20), 4000),((21,30), 5000),((31,40), 5000),((41,50), 4000),((51,60), 3000),
                            ((61,70), 1600),((71,80), 900), ((81,90), 300),((91,100), 80),((101,120), 5),((121,130), 0)])
populacaoEstancia :: PopMun
populacaoEstancia = ("Estancia", [ ((0,10), 3000),((11,20), 4000),((21,30), 5000),((31,40), 5000),((41,50), 4000),((51,60), 3000),
                            ((61,70), 1600),((71,80), 900), ((81,90), 300),((91,100), 80),((101,120), 5),((121,130), 0)])

populacaoSergipe :: PopEstado
populacaoSergipe = ("SE", [ populacaoAracaju, populacaoMuribeca, populacaoEstancia ])

populacaoBrasil :: PopPais
populacaoBrasil = [ populacaoSergipe ]




-- ====================================================================== QUESTÕES =======================================================================================
-- QUESTAO 1.A
atualizaEndSus :: CPF -> CadastroSUS -> Endereco -> CadastroSUS
atualizaEndSus _ [] _                   = error "Esse CPF nao consta no Cadastro ou o Cadastro está vazio"
atualizaEndSus cpf (x:xs) endereco
    | cpf == getCPF x                   = cadastroSemCidadao ++ [ cidadaoAtualizado ]
    | otherwise                         = atualizaEndSus cpf xs endereco
    where
        cadastroSemCidadao = removeSUS cpf (x:xs)

        cidadaoAtualizado  = setEndereco x endereco

-- QUESTAO 1.B
removeSUS :: CPF -> CadastroSUS -> CadastroSUS
removeSUS cpf [] = []
removeSUS cpf (x:xs)
    | getCPF x == cpf = xs
    | otherwise = x : removeSUS cpf xs

-- QUESTAO 1.C
-- Exemplo de Execucao: geraListaMuncipioFaixas "Aracaju" [0,80] [] cadSUS (3,11,2021)
--                      geraListaMunicipioFaixas "Aracaju" [(0,24),(30,80)] [] cadastroSUS (3,11,2021)
-- Argumentos:
geraListaMunicipioFaixas :: Municipio -> [FaixaIdade] -> ListaCidadaoFiltrada -> CadastroSUS -> Data -> CadastroSUS
geraListaMunicipioFaixas _ _ filtrada [] _ = filtrada
geraListaMunicipioFaixas mun fxa filtrada (x:xs) dataHoje
    | getMunicipio x == mun
   && cidadaoIdadeOk x fxa dataHoje     = geraListaMunicipioFaixas mun fxa newFiltrada xs dataHoje
    | otherwise                         = geraListaMunicipioFaixas mun fxa filtrada    xs dataHoje
    where
        newFiltrada = filtrada ++ [x]

cidadaoIdadeOk :: Cidadao -> [FaixaIdade] -> Data -> Bool
cidadaoIdadeOk _ [] _ = False
cidadaoIdadeOk cidadao (x:xs) dataHoje
    | getIdade cidadao dataHoje >= getIdadeInicial x
   && getIdade cidadao dataHoje <= getIdadeFinal   x = True
    | otherwise                                      = cidadaoIdadeOk cidadao xs dataHoje

-- QUESTAO 1.D
-- Exemplos de Execucao: aplicaPrimDose 87717347115 ("Pfizer", (3,11,2021))  -> Cidadao não Vacinado    (cadastroVacinados + novoVacinado)
--                       aplicaPrimDose 04511855545 ("Pfizer", (3,11,2021))  -> Cidadao nao Cadastrado  (Erro)
--                       aplicaPrimDose 04511800545 ("Pfizer", (3,11,2021))  -> Cidadao já Vacinado     (Erro)

aplicaPrimDose :: CPF -> Dose -> Vacinados -> Vacinados
aplicaPrimDose cpf dose (x:xs)
    | null xs                           = (x:xs) ++ [newVacinado]
    | checaPrimDose cpf (x:xs)          = error "Esse Cidadao ja esta vacinado"
    | otherwise                         = x: aplicaPrimDose cpf dose xs
    where
        newVacinado = (cpf, [dose])

checaPrimDose :: CPF -> Vacinados -> Bool
checaPrimDose _ [] = False
checaPrimDose cpf (x:xs)
    | getCPFVac x == cpf = True
    | otherwise          = checaPrimDose cpf xs

-- QUESTAO 1.E
-- Exemplos de Execucao: quantidade cadastroVacinados 1 "Aracaju" 0 -> 2
quantidadeDoseMun :: TipoDose -> Municipio -> Vacinados -> CadastroSUS -> Quantidade -> Quantidade
quantidadeDoseMun _ _ [] _ quantidade = quantidade
quantidadeDoseMun  tipoDose municipio (x:xs) cadSus quantidade
    | getQuantDoses x >= tipoDose
   && getMunicipioVac x cadSus == municipio     = quantidadeDoseMun tipoDose municipio xs cadSus (quantidade + 1)
    | otherwise                                 = quantidadeDoseMun tipoDose municipio xs cadSus  quantidade

-- QUESTAO 1.F
quantidadeEstIdDose :: TipoDose -> FaixaIdade -> Estado -> Vacinados -> CadastroSUS -> Quantidade -> Quantidade
quantidadeEstIdDose _ _ _ [] _ quantidade = quantidade
quantidadeEstIdDose  tipoDose fxa estado (x:xs) cadSus quantidade
    | getQuantDoses x >= tipoDose
   && getEstadoVac x cadSus == estado
   && isIdadeOk cpf cadSus fxa                  = quantidadeEstIdDose tipoDose fxa estado xs cadSus (quantidade + 1)
    | otherwise                                 = quantidadeEstIdDose tipoDose fxa estado xs cadSus  quantidade
    where
        cpf = getCPFVac x

-- QUESTAO 1.G
quantidadeEstVacDose :: Estado -> Vacina -> TipoDose -> Vacinados -> CadastroSUS -> Quantidade -> Quantidade
quantidadeEstVacDose _ _ _ [] _ quantidade = quantidade
quantidadeEstVacDose estado vacina tipoDose (x:xs) cadSus quantidade
    | getEstadoVac x cadSus == estado
   && getQuantDoses x >= tipoDose
   && getVacina dose == vacina          = quantidadeEstVacDose estado vacina tipoDose xs cadSus ( quantidade + 1)
    | otherwise                         = quantidadeEstVacDose estado vacina tipoDose xs cadSus   quantidade
   where
       dose = getDosePorTipo x tipoDose

-- QUESTAO 2
-- Exemplo de Execucao : proximaFaixaDeIdade 10000 130 populacaoAracaju
--                     : proximaFaixaDeIdade 10000 41 populacaoMuribeca

proximaFaixaDeIdade :: 
     Quantidade -- ^ Vacinas Recebidas pelo Municipio 
  -> Idade -- ^  Ultima idade de Vacinacao
  -> PopMun -- ^ Populacao do Municipio
  -> FaixaIdade -- ^ Retorna  a Faixa de Idade em ordem decrescente
proximaFaixaDeIdade vacinasRecebidas ultimaIdade popMun
    = proximaFaixaDeIdadeAuxiliar vacinasRecebidas ultimaIdade (formatarFaixas (snd populacaoAracaju) ultimaIdade []) 0 ultimaIdade

proximaFaixaDeIdadeAuxiliar :: Quantidade -> Idade -> [(FaixaIdade, Populacao)] -> Quantidade -> Idade -> FaixaIdade
proximaFaixaDeIdadeAuxiliar  vacinasRecebidas ultimaIdade (x:xs) quantAtual menorIdade
    | quantAtual + populacao > vacinasRecebidas
   && quantAtual == 0                            = error "A quantidade de Vacinas nao é suficiente para primeira faixa apos esta idade "
    | quantAtual + populacao <= vacinasRecebidas = proximaFaixaDeIdadeAuxiliar vacinasRecebidas ultimaIdade xs (quantAtual+populacao) novaMenorIdade
    | otherwise                                  = (ultimaIdade - 1, menorIdade)
    where
        populacao       = snd x
        novaMenorIdade  = fst(fst x)

-- QUESTAO 3
-- EXEMPLO DE EXECUCAO = porcentagemVacinadosEst cadastroVacinados cadastroSUS populacaoSergipe 1

porcentagemVacinadosEst :: 
     Vacinados -- ^ Cadastro de Vacinados identificados por CPF
  -> CadastroSUS -- ^ Cadastro do Sistema Unico de Saude
  -> PopEstado -- ^ Cadastro Demografico da populacao estadual
  -> TipoDose -- ^  Tipo de Dose que se quer calcular
  -> Porcentagem
porcentagemVacinadosEst cadVac cadSus popEst tipoDose = fromIntegral populacaoVacinada / fromIntegral populacaoTotal * 100
    where
        populacaoVacinada = calcPopulacaoVacinadaEst popEst tipoDose cadVac cadSus 0
        populacaoTotal   = calcPopulacaoEst popEst 0

calcPopulacaoVacinadaEst :: PopEstado -> TipoDose -> Vacinados -> CadastroSUS -> Quantidade -> Quantidade
calcPopulacaoVacinadaEst (_,[]) _ _ _ quantidade = quantidade
calcPopulacaoVacinadaEst ( estado, x:xs ) tipoDose cadVac cadSus quantInicial = calcPopulacaoVacinadaEst (estado, xs) tipoDose cadVac cadSus (quantInicial+populacaoMunicipio)
    where
        populacaoMunicipio = quantidadeDoseMun tipoDose (fst x) cadVac cadSus 0

calcPopulacaoMun :: PopMun -> QuantidadeInicial -> Quantidade
calcPopulacaoMun (_, []) quantidade = quantidade
calcPopulacaoMun (municipio, x:xs) quantidade = calcPopulacaoMun ( municipio,xs ) (quantidade + popFaixa)
    where
        popFaixa = getPopulacao x

calcPopulacaoEst :: PopEstado -> QuantidadeInicial -> Quantidade
calcPopulacaoEst (_, []) quantidade = quantidade
calcPopulacaoEst (estado, x:xs) quantidade = calcPopulacaoEst (estado, xs) (quantidade + popMun)
    where
        popMun = calcPopulacaoMun x 0
-- QUESTAO 4

-- EXEMPLO DE EXECUCAO => apresentarAlfabetico cadastroVacinados cadastroSUS populacaoSergipe 1

apresentarAlfabetico :: 
     Vacinados -- ^ Cadastro de Vacinados identificados por CPF
  -> CadastroSUS -- ^  Cadastro do Sistema Unico de Saude
  -> PopEstado -- ^  Cadastro Demografico da populacao estadual
  -> TipoDose -- ^ Tipo de Dose que se quer calcular
  -> IO() -- Execução da Apresentação de Dados
apresentarAlfabetico cadVac cadSus popEst tipoDose = putStr (formataApresentacao apresentacao [])
    where
        apresentacao = geraApresentacao cadVac cadSus popEst tipoDose []


formataLinha :: (Municipio,Porcentagem) -> String
formataLinha (municipio, porcentagem) = show municipio ++ "             " ++ show porcentagem ++ "\n"

formataApresentacao :: Apresentacao -> String -> String
formataApresentacao [] cheio = cheio
formataApresentacao (x:xs) vazio = formataApresentacao xs  (vazio ++ formataLinha x)

geraApresentacao :: Vacinados -> CadastroSUS -> PopEstado -> TipoDose -> ListaVaziaApresentacao -> Apresentacao
geraApresentacao _ _ (_,[]) _ cheio = sortApresentacao cheio []
geraApresentacao cadVac cadSus (estado, x:xs) tipoDose vazio = geraApresentacao cadVac cadSus (estado, xs) tipoDose incluido
    where
        municipio = fst x
        porcentagem = porcentagemVacinadosMun cadVac cadSus x tipoDose

        incluido = (municipio, truncar porcentagem 3): vazio

truncar :: Double -> Int -> Double
truncar x n = fromIntegral (floor (x * t)) / t
    where t = 10^n

sortApresentacao :: Apresentacao -> ListaVaziaApresentacao -> Apresentacao
sortApresentacao [] cheio = cheio
sortApresentacao xs vazio = sortApresentacao (removeElementoApresentacao maior xs) (maior : vazio)
    where
        maior = maiorElementoApresentacao xs

removeElementoApresentacao :: (Municipio,Porcentagem) -> Apresentacao -> Apresentacao
removeElementoApresentacao x [] = []
removeElementoApresentacao x (y:ys)
    | x == y = ys
    | otherwise = y: removeElementoApresentacao x ys

maiorElementoApresentacao :: [(Municipio,Porcentagem)] -> (Municipio,Porcentagem)
maiorElementoApresentacao [] = undefined
maiorElementoApresentacao [x] = x
maiorElementoApresentacao (x:xs)
    | x >= maiorElementoApresentacao xs = x
    | otherwise = maiorElementoApresentacao xs

porcentagemVacinadosMun :: Vacinados -> CadastroSUS -> PopMun -> TipoDose -> Porcentagem
porcentagemVacinadosMun cadVac cadSus popMun tipoDose = fromIntegral populacaoVacinada / fromIntegral populacaoTotal * 100
    where
        populacaoVacinada = calcPopulacaoVacinadaMun popMun tipoDose cadVac cadSus 0
        populacaoTotal   = calcPopulacaoMun popMun 0

calcPopulacaoVacinadaMun :: PopMun -> TipoDose -> Vacinados -> CadastroSUS -> Quantidade -> Quantidade
calcPopulacaoVacinadaMun (_,[]) _ _ _ quantidade = quantidade
calcPopulacaoVacinadaMun ( municipio, x:xs ) tipoDose cadVac cadSus quantInicial = quantidadeDoseMun tipoDose municipio cadVac cadSus 0

-- QUESTAO 5
-- EXEMPLO DE EXECUCAO => apresentarPorcentagem cadastroVacinados cadastroSUS populacaoSergipe 1

apresentarPorcentagem :: 
     Vacinados -- ^ Cadastro de Vacinados identificados por CPF
  -> CadastroSUS -- ^  Cadastro do Sistema Unico de Saude
  -> PopEstado -- ^  Cadastro Demografico da populacao estadual
  -> TipoDose -- ^ Tipo de Dose que se quer calcular
  -> IO() -- Execução da Apresentação de Dados
apresentarPorcentagem cadVac cadSus popEst tipoDose = putStr (formataApresentacao apresentacao [])
    where
        apresentacao = geraApresentacaoPorc cadVac cadSus popEst tipoDose []


geraApresentacaoPorc :: Vacinados -> CadastroSUS -> PopEstado -> TipoDose -> ListaVaziaApresentacao -> Apresentacao
geraApresentacaoPorc _ _ (_,[]) _ cheio = sortApresentacaoPorc cheio []
geraApresentacaoPorc cadVac cadSus (estado, x:xs) tipoDose vazio = geraApresentacaoPorc cadVac cadSus (estado, xs) tipoDose incluido
    where
        municipio = fst x
        porcentagem = porcentagemVacinadosMun cadVac cadSus x tipoDose

        incluido = (municipio, truncar porcentagem 3): vazio

sortApresentacaoPorc :: Apresentacao -> ListaVaziaApresentacao -> Apresentacao
sortApresentacaoPorc [] cheio = reverse cheio
sortApresentacaoPorc xs vazio = sortApresentacaoPorc (removeElementoApresentacao maior xs) (maior : vazio)
    where
        maior = maiorElementoApresentacaoPorc xs

maiorElementoApresentacaoPorc :: [(Municipio,Porcentagem)] -> (Municipio,Porcentagem)
maiorElementoApresentacaoPorc [] = undefined
maiorElementoApresentacaoPorc [x] = x
maiorElementoApresentacaoPorc (x:xs)
    | snd x >= snd( maiorElementoApresentacao xs) = x
    | otherwise = maiorElementoApresentacao xs

-- ========================================================================= FUNCOES AUXILIARES ======================================================================
-- Cidadaos
getCidadao :: CPF -> CadastroSUS -> Cidadao
getCidadao _ [] = error "Cidadao nao encontrado"
getCidadao cpf (x:xs)
    | getCPF x == cpf   = x
    | otherwise         = getCidadao cpf xs


getCPF :: (CPF,b,c,d,e,f,g,h,i) -> CPF
getCPF (cpf, _,_,_,_,_,_,_,_ ) = cpf

getMunicipio :: (a,b,c,d,e,Municipio,g,h,i) -> Municipio
getMunicipio (_,_,_,_,_, municipio, _, _, _) = municipio

getEstado :: (a,b,c,d,e, f,Estado,h,i) -> Estado
getEstado (_,_,_,_,_, _, estado, _, _) = estado

getIdadeInicial:: FaixaIdade -> IdadeInicial
getIdadeInicial ( inicial , _ ) = inicial

getIdadeFinal:: FaixaIdade -> IdadeFinal
getIdadeFinal ( _ , final ) = final

getIdade :: (a,b,c,DataNasc,e,f,g,h,i) -> Data -> Idade
getIdade (_,_,_,( diaNasc, mesNasc, anoNasc ), _,_,_,_,_) (diaHoje, mesHoje, anoHoje)
        | mesHoje < mesNasc                             = anoHoje - anoNasc - 1
        | mesNasc == mesHoje && diaNasc > diaHoje   = anoHoje - anoNasc - 1
        | otherwise                                     = anoHoje - anoNasc

-- Vacinados
getCPFVac :: (CPF, d) -> CPF
getCPFVac (cpf, _ ) = cpf

getMunicipioVac :: (CPF, d) -> CadastroSUS -> Municipio
getMunicipioVac (cpf, _) cadSus = getMunicipio (getCidadao cpf cadSus)

getEstadoVac :: (CPF, d) -> CadastroSUS -> Municipio
getEstadoVac (cpf, _) cadSus = getEstado (getCidadao cpf cadSus)

getQuantDoses :: Vacinado -> Quantidade
getQuantDoses (_, doses) = length doses

setEndereco :: Cidadao -> Endereco -> Cidadao
setEndereco (a, b, c, d, e, f, g, h, i)  endereco = (a, b, c, d, endereco, f, g, h, i)

-- CensoDemografico
getPopulacao :: (FaixaIdade, Populacao) -> Populacao
getPopulacao (_, populacao) = populacao

isIdadeOk :: CPF ->  CadastroSUS -> FaixaIdade -> Bool
isIdadeOk cpf cadSus fxa                            = not (null [ x | x <- cadSus
                                                        , getIdadeInicial fxa <= getIdade x dataHoje
                                                        && getIdade x dataHoje <= getIdadeFinal fxa
                                                        && getCPF x ==  cpf ])


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

getVacina :: Dose -> Vacina
getVacina (vac, _) = vac


faixasDemograficas :: [FaixaIdade]
faixasDemograficas = [(0,10),(11,20),(21,30),(31,40),(41,50),(51,60),(61,70),(71,80),(81,90),(91,100),(101,110),(111,120),(121,130)]

faixasDemograficasFormatada :: [FaixaIdade] -> Idade -> [FaixaIdade] -> [FaixaIdade]
faixasDemograficasFormatada [] _ _= []
faixasDemograficasFormatada (x:xs) idade vazio
    | idadeBetweenFaixa idade x
   && snd x > idade           = (fst x, idade) : vazio
    | idadeBetweenFaixa idade x = x : vazio
    | otherwise = faixasDemograficasFormatada xs idade (x : vazio)

idadeBetweenFaixa :: Idade -> FaixaIdade -> Bool
idadeBetweenFaixa idade fxa
    | idade >= getIdadeInicial fxa
   && idade <= getIdadeFinal   fxa = True
    | otherwise                    = False
formatarFaixas :: [(FaixaIdade, Populacao)] -> Idade -> [(FaixaIdade, Populacao)] -> [(FaixaIdade, Populacao)]
formatarFaixas [] _ nova = reverse nova
formatarFaixas (x:xs) idade nova
    | idadeBetweenFaixa (idade - 1) faixa   = x : nova
    | otherwise                             = formatarFaixas xs idade ( x:nova )
    where
        faixa = fst x

