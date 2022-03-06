-- Nome: Marcos Gabriel da Silva Santos
-- Matricula : 202100012053
-- Turma: T01

-- Nome das Funções
    -- Quastao 1.a : atualizaEndSUS CPF -> Endereco -> CadastroSUS -> CadastroSUS
    -- Quastao 1.b : removeSUS :: CPF -> CadastroSUS -> CadastroSUS
    -- Quastao 1.c : geraListaMunicipioFaixas :: CadastroSUS -> Municipio -> [FaixaIdade] -> [(FaixaIdade, Quantidade)]
    -- Quastao 1.d : quantidadeDoseMun :: Vacinados -> TipoDose -> Municipio -> CadastroSUS -> Quantidade
    -- Quastao 1.e : quantidadeEstIdDose :: Vacinados -> Estado -> FaixaIdade -> TipoDose -> CadastroSUS -> Quantidade
    -- Quastao 1.f : quantidadeEstVacDose :: Vacinados -> Estado -> Vacina -> TipoDose -> CadastroSUS -> Quantidade
    -- Quastao 2.a : apresentar :: Estado -> CadastroSUS -> Vacinados -> [(Municipio, Float)]
    -- Quastao 2.b : porcentagemEstados :: CadastroSUS -> Vacinados -> [(Estado, Float)]

dataHoje :: Data
dataHoje = (30,09,2021)

-- QUESTAO 1.a
-- Comentario do Avaliador: 
atualizaEndSUS :: CPF -> Endereco -> CadastroSUS -> CadastroSUS
atualizaEndSUS cpf endereco cadSus = cidadao : filter (\n -> getCPF n /= cpf) cadSus
    where
        cidadao = setEndereco (getCidadao cpf cadSus) endereco


-- QUESTAO 1.b
-- Comentario do Avaliador: 
removeSUS :: CPF -> CadastroSUS -> CadastroSUS
removeSUS cpf = filter (\n -> getCPF n /= cpf)

-- QUESTAO 1.c
--     Comentario do Avaliador: 
geraListaMunicipioFaixas :: CadastroSUS -> Municipio -> [FaixaIdade] -> [(FaixaIdade, Quantidade)]
geraListaMunicipioFaixas cadSus municipio = map (\n -> quantidadeFaixaMun n cadSus municipio)

-- QUESTAO 1.d
--     Comentario do Avaliador: 
quantidadeDoseMun :: Vacinados -> TipoDose -> Municipio -> CadastroSUS -> Quantidade
quantidadeDoseMun cadVac tipo municipio cadSus = length ( filter (\vacinado -> getMunicipioVacinado vacinado cadSus == municipio) vacTipo)-- Utiliza a Lista vacTipo para verificar o municipio de cada Vacinado
    where
        vacTipo = filter (\vacinado -> tipo <= getTipoDoseVacinado vacinado) cadVac -- Lista de Vacinados com o pelo menos o tipo de dose do argumento

-- QUESTAO 1.e
--     Comentario do Avaliador: 
quantidadeEstIdDose :: Vacinados -> Estado -> FaixaIdade -> TipoDose -> CadastroSUS -> Quantidade
quantidadeEstIdDose cadVac estado fxa tipo cadSus = length (
                                                                filter (\vacinado ->
                                                                            getEstadoVacinado vacinado cadSus == estado
                                                                        &&  isIdadeBetween  (getIdade (getCidadaoVacinado vacinado cadSus) dataHoje) fxa
                                                                        &&  getTipoDoseVacinado vacinado >= tipo
                                                                        )

                                                                        cadVac
                                                            )
-- QUESTAO 1.f
--     Comentario do Avaliador: 
quantidadeEstVacDose :: Vacinados -> Estado -> Vacina -> TipoDose -> CadastroSUS -> Quantidade
quantidadeEstVacDose cadVac estado vacina tipo cadSus = length vacEst
    where
        vacTipo   = filter (\vacinado -> tipo <= getTipoDoseVacinado vacinado) cadVac
        vacVac    = filter (\vacinado -> getVacinaTipoDose vacinado tipo == vacina) vacTipo
        vacEst    = filter (\vacinado -> getEstadoVacinado vacinado cadSus == estado) vacVac

-- QUESTAO 2.a
--     Comentario do Avaliador: 
type Porcentagem = Int

apresentar :: Estado -> CadastroSUS -> Vacinados -> [(Municipio, Float)]
apresentar estado cadSus cadVac =  sort( map (\municipio -> (municipio, calcPorcentagem 
                                                                        (quantidadeVacinadosMun municipio listaMunVacinados)
                                                                        (quantidadeCidadaosMun cadSus municipio)))
                                         listaMunNaoDuplicados)
    where
        listaMunVacinados = map (\x -> getMunicipioVacinado x cadSus) (filter (\vacinado -> getEstadoVacinado vacinado cadastroSUS == estado) cadVac)
        listaMunNaoDuplicados = removeDuplicados listaMunVacinados

     
-- Contabiliza a quantidade de vacinados pos a entrega de uma lista com o municipios dos vacinados naquele estado
quantidadeVacinadosMun :: Municipio -> [Municipio] -> Int
quantidadeVacinadosMun municipio lista = foldr (\x acc -> if  municipio == x then acc+1 else acc ) 0 lista -- UTILIZACAO DO FOLDR

--QUESTAO 2.b
--     Comentario do Avaliador: 
porcentagemEstados :: CadastroSUS -> Vacinados -> [(Estado, Float)]
porcentagemEstados cadSus cadVac = reverse (inverterListTupla (sort (inverterListTupla munPorc)))
    where
        listEst = listaEstados cadSus
        munPorc = map (\estado ->( estado , (calcPorcentagem
                                                        (quantidadeVacinadosEst cadVac cadSus estado) -- Parametro calcPorcentagem
                                                        (quantidadeCidadaosEst cadSus estado))))      -- Parametro calcPorcentagem
                        listEst

-- Funcoes Auxiliares 2.a

quantidadeCidadaosMun :: CadastroSUS -> Municipio -> Quantidade
quantidadeCidadaosMun cadSus municipio = length (filter (\n -> getMunicipio n == municipio) cadSus)

listaMunicipiosEst :: Estado -> CadastroSUS -> [Municipio]
listaMunicipiosEst estado cadSus = removeDuplicados municipiosDuplicados
    where
        municipiosDuplicados = map getMunicipio (filter (\n -> getEstado n == estado) cadSus)

-- Funcoes auxiliares 2.b
listaEstados :: CadastroSUS -> [Estado]
listaEstados cadSus = removeDuplicados estadosDuplicados
    where
        estadosDuplicados = map getEstado cadSus

quantidadeVacinadosEst :: Vacinados -> CadastroSUS -> Estado -> Quantidade
quantidadeVacinadosEst cadVac cadSus estado = length (filter (\n -> getEstadoVacinado n cadSus == estado) cadVac)

quantidadeCidadaosEst :: CadastroSUS -> Estado -> Quantidade
quantidadeCidadaosEst cadSus estado = length (filter (\n -> getEstado n == estado) cadSus)

inverterTupla :: (a,b) -> (b,a)
inverterTupla (a,b) = (b,a)

inverterListTupla :: [(a,b)] -> [(b, a)]
inverterListTupla = map inverterTupla

-- Funcoes auxiliares 2 (a,b,c)
calcPorcentagem::Int  -> Int ->  Float
calcPorcentagem quantidade quantidadeTotal = (fromIntegral (quantidade) / fromIntegral (quantidadeTotal) ) * 100.0

removeDuplicados :: Eq a => [a] -> [a]
removeDuplicados [] = []
removeDuplicados (x:xs) = x : removeDuplicados (listaSemMun x xs)
    where
        listaSemMun :: Eq a => a -> [a] -> [a]
        listaSemMun x [] = []
        listaSemMun x (y:ys)
            | x == y = listaSemMun x ys
            | otherwise = y : listaSemMun x ys

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

type Idade = Int
type IdadeInicial = Int
type IdadeFinal = Int
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

cadastroSUS:: CadastroSUS
cadastroSUS = [
    (04511800545, "Marcos Santos"   ,'M', (09,09,1999), "Rua Boludo"                ,"Aracaju"  ,"SE", "998896994"  , "markkyn@gmail.com"),  -- 22 anos | PARCIALMENTE  imunizado
    (26716347665, "Paulo Souza"     ,'M', (11,10,1996), "Rua A, 202"                ,"Muribeca" ,"SE", "999997000"  , "psouza@gmail.com"),   -- 24 anos | ATRASADO
    (12333222334, "Jose da Silva"   ,'M', (01,01,1990), "Rua José"                  ,"Maracatu" ,"MG", "3231231232" , "josesinho@gmail.com"),-- 31 anos | ATRASADO
    (87717347115, "Ana Reis"        ,'F', (01,04,1970), "Rua B, 304"                ,"Aracaju"  ,"SE", "999826004"  , "areis@gmail.com"),    -- 51 anos | VUNERAVEL
    (58759034572, "Raimundo Jorge"  ,'X', (31,09,1972), "Rua B, 304"                ,"Aracaju"  ,"SE", "999826004"  , "areis@gmail.com"),    -- 48 anos | TOTALMENTE    imunizado
    (44233332332, "Jorginho Silva"  ,'M', (26,09,1972), "Rua B, 304"                ,"Aracaju"  ,"SE", "999826004"  , "areis@gmail.com"),    -- 49 anos | VULNERAVEL    imunizado
    (44233424212, "Josefias Decan"  ,'M', (26,09,1972), "Rua B, 304"                ,"Aracaju"  ,"SE", "999826004"  , "areis@gmail.com"),
    (63867508057, "Thiago Santiago" ,'M', (13,05,1981), "Rua Porto, 491"            ,"Estancia" ,"SE", "65983086273", "santiagovieira@meuteste.com.br"),
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
    [--     CPF                     Primeira Dose                   Segunda Dose                         Nome              Municipio   TipoDose
        ( 04511800545, [( "Pfizer"      , (23, 08, 2021))                                        ] ), -- Marcos Santos   -- Aracaju  -- 1
        ( 58759034572, [( "Pfizer"      , (04, 04, 2020)) ,("AstraZeneca"   ,(09, 09, 2020))     ] ), -- Raimundo Jorge  -- Aracaju  -- 2
        ( 26716347665, [( "CoronaVac"   , (23, 08, 2021))                                        ] ), -- Paulo Souza     -- Muribeca -- 1
        ( 12333222334, [( "AstraZeneca" , (01, 01, 2021))                                        ] ), -- Jose da Silva   -- Maracatu -- 1
        ( 44233424212, [( "AstraZeneca" , (01, 01, 2021))                                        ] ), -- Josefias Decan  -- Aracaju  -- 1
        ( 63867508057, [("Pfizer"       , (01, 12, 2020)) ,("Pfizer"        ,(03, 01, 2021))     ] ), -- Thiago Santiago -- Curitiba -- 1
        ( 77185804325, [("AstraZeneca" , (02, 11, 2020))                                         ] ), -- Yasmin Zanin    -- Juazero  -- 1
        ( 91010353917, [("CoronaVac"    , (17, 11, 2020)) ,("CoronaVac"     ,(30, 12, 2020))     ] ),
        ( 25969757764, [("AstraZeneca"  , (01, 03, 2021)) ,("AstraZeneca"   ,(30, 05, 2021))     ] ),
        ( 26184931860, [("CoronaVac"    , (19, 10, 2020)) ,("CoronaVac"     ,(30, 11, 2020))     ] ),
        ( 81102000772, [("Pfizer"      , (23, 11, 2020))                                         ] ),
        ( 59701483562, [("CoronaVac"   , (13, 09, 2020))                                         ] ),
        ( 91257829131, [("CoronaVac"   , (26, 06, 2020))                                         ] ),
        ( 79812945849, [("Pfizer"       , (27, 07, 2020)) ,("Pfizer"        ,(30, 09, 2020))     ] ),
        ( 84325650761, [("CoronaVac"    , (06, 12, 2020))                                        ] )
    ]



-- GETTERS E SETTERS ( CADASTRO SUS )
getCidadao :: CPF -> CadastroSUS -> Cidadao
getCidadao cpf cadSUS = head ( filter (\n -> getCPF n == cpf ) cadSUS )

getCPF :: (CPF,b,c,d,e,f,g,h,i) -> CPF
getCPF (cpf, _,_,_,_,_,_,_,_ ) = cpf

getMunicipio :: (a,b,c,d,e,Municipio,g,h,i) -> Municipio
getMunicipio (_,_,_,_,_,municipio, _,_,_) = municipio

getEstado :: (a,b,c,d,e,f,Estado,h,i) -> Estado
getEstado (_,_,_,_,_,_,estado,_,_) = estado

getIdade :: (a,b,c,DataNasc,e,f,g,h,i) -> Data -> Int
getIdade (_,_,_,( diaNasc, mesNasc, anoNasc ), _,_,_,_,_) (diaHoje, mesHoje, anoHoje)
        | mesHoje < mesNasc                             = anoHoje - anoNasc - 1
        | (mesNasc == mesHoje) && (diaNasc > diaHoje)   = anoHoje - anoNasc - 1
        | otherwise                                     = anoHoje - anoNasc

setEndereco :: Cidadao -> Endereco -> Cidadao
setEndereco (a, b, c, d, e, f, g, h, i)  endereco = (a, b, c, d, endereco, f, g, h, i)

-- GETTERS E SETTERS ( VACINADOS )
getCPFVacinado :: Vacinado -> CPF
getCPFVacinado vacinado = fst vacinado

getCidadaoVacinado :: Vacinado -> CadastroSUS -> Cidadao
getCidadaoVacinado vacinado cadSus = getCidadao cpf cadSus
    where
        cpf = getCPFVacinado vacinado

getTipoDoseVacinado :: Vacinado -> TipoDose
getTipoDoseVacinado vacinado = length (snd vacinado)

getMunicipioVacinado :: Vacinado -> CadastroSUS -> Municipio
getMunicipioVacinado vacinado  cadSus = getMunicipio cidadao
    where
        cpf = fst vacinado
        cidadao = getCidadao cpf cadSus

getEstadoVacinado :: Vacinado -> CadastroSUS -> Estado
getEstadoVacinado vacinado cadSus = getEstado cidadao
    where
        cpf = fst vacinado
        cidadao = getCidadao cpf cadSus

getVacinaTipoDose :: Vacinado -> TipoDose -> Vacina
getVacinaTipoDose vacinado tipo
    | tipo <= length doses = vacina
    | otherwise              = error "Esse Cidadão ainda não tomou essa dose"
    where
        doses = snd vacinado
        vacina  = fst( doses !! (tipo-1) )

-- Booleans

isIdadeBetween :: Idade -> FaixaIdade -> Bool
isIdadeBetween idade fxa
    | idade >= fst faixa && idade <= snd faixa  = True
    | otherwise                                 = False
    where
        faixa = formatarFaixaIdade fxa

-- Aux Functions
formatarFaixaIdade :: FaixaIdade -> FaixaIdade
formatarFaixaIdade fxa
    | prim < scnd = (prim, scnd)
    | otherwise   = (scnd, prim)
    where
        prim = fst fxa
        scnd = snd fxa

quantidadeFaixaMun :: FaixaIdade -> CadastroSUS -> Municipio -> (FaixaIdade, Quantidade)
quantidadeFaixaMun fxa cadSus municipio = (fxa , quantidade)
    where
        quantidade = length (filter (\n -> isIdadeBetween (getIdade n dataHoje) fxa && getMunicipio n == municipio ) cadSus)


insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys)
    | x < y = x: y: ys
    | otherwise = y: insert x ys

sort :: Ord a => [a] -> [a]
sort = foldr insert []