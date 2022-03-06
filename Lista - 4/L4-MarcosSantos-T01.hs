-- Nome: Marcos Gabriel da Silva Santos
-- Matricula: 202100012053

---------- NOME DAS FUNCOES -----------
-- QUESTAO 1   : primeira 
-- QUESTAO 2.a : porcentagem
-- QUESTAO 2.b : segundaDose

-- Auxiliar da Arvore: buscarNo


import qualified Control.Monad

primeira :: CadastroSUS -> Vacinados -> IO ()
primeira cadSus cadVac = do
     putStr "Digite o CPF: "
     cpf <- getLine

     Control.Monad.when ((read cpf :: CPF)  /= 0) $ do
        putStr "NOME:  "
        putStrLn ( getNome ( getCidadao ( read cpf :: CPF ) cadSus ) )

        printDoses (getVacinado ( read cpf :: CPF ) cadVac )
        putStr "\n"

        primeira cadSus cadVac

porcentagem :: Municipio -> Arv a -> Vacinados -> CadastroSUS -> Float
porcentagem municipio cadArv cadVac cadSus = fromIntegral popVacinada / fromIntegral ( getPopulacaoPopMun popMun) * 100.00
    where
     popMun = buscarNo municipio cadArv
     popVacinada = length (filter (\vacinado -> getMunicipioVacinado vacinado cadSus == municipio) cadVac)

segundaDose :: Municipio -> Arv a -> Vacinados -> CadastroSUS -> Float
segundaDose municipio cadArv cadVac cadSus = fromIntegral popVacinada / fromIntegral ( getPopulacaoPopMun popMun) * 100.00
    where
        popMun = buscarNo municipio cadArv
        popVacinada = length (filter (\vacinado -> getMunicipioVacinado vacinado cadSus == municipio && length (getDosesVacinado vacinado) >= 2 ) cadVac)

type CPF       = Integer
type Nome      = String
type Genero    = Char
type Dia       = Int
type Mes       = Int
type Ano       = Int
type Data      = (Dia, Mes, Ano)
type DataNasc  = Data
type Endereco  = String
type Municipio = String
type Estado    = String
type Telefone  = String
type Email     = String

type Cidadao   = (CPF, Nome, Genero, DataNasc, Endereco, Municipio,Estado, Telefone, Email)
type CadastroSUS = [Cidadao]

type Idade        = Int
type IdadeInicial = Int
type IdadeFinal   = Int
type FaixaIdade   = (IdadeInicial, IdadeFinal)

type Quantidade   = Int

type QuantidadeFormatada = String
type LinhaFormatada      = String
type LinhasFormatadas    = String
type TotalFormatado      = String

type Vacina    = String
type TipoDose  = Int
type Dose      = (Vacina, Data)
type Doses     = [Dose]

type Vacinado  = ( CPF, Doses )
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
        ( 58759034572, [( "Pfizer"      , (04, 04, 2020)) ,("AstraZeneca" ,(09, 09, 2020))     ] ), -- Raimundo Jorge  -- Aracaju  -- 2
        ( 26716347665, [( "CoronaVac"   , (23, 08, 2021))                                        ] ), -- Paulo Souza     -- Muribeca -- 1
        ( 12333222334, [( "AstraZeneca" , (01, 01, 2021))                                        ] ), -- Jose da Silva   -- Maracatu -- 1
        ( 44233424212, [( "AstraZeneca" , (01, 01, 2021))                                        ] ), -- Josefias Decan  -- Aracaju  -- 1
        ( 63867508057, [("Pfizer"       , (01, 12, 2020)) ,("Pfizer"      ,(03, 01, 2021))     ] ), -- Thiago Santiago -- Curitiba -- 1
        ( 77185804325, [("AstraZeneca" , (02, 11, 2020))                                         ] ), -- Yasmin Zanin    -- Juazero  -- 1
        ( 91010353917, [("CoronaVac"    , (17, 11, 2020)) ,("CoronaVac"   ,(30, 12, 2020))     ] ),
        ( 25969757764, [("AstraZeneca"  , (01, 03, 2021)) ,("AstraZeneca" ,(30, 05, 2021))     ] ),
        ( 26184931860, [("CoronaVac"    , (19, 10, 2020)) ,("CoronaVac"   ,(30, 11, 2020))     ] ),
        ( 81102000772, [("Pfizer"      , (23, 11, 2020))                                         ] ),
        ( 59701483562, [("CoronaVac"   , (13, 09, 2020))                                         ] ),
        ( 91257829131, [("CoronaVac"   , (26, 06, 2020))                                         ] ),
        ( 79812945849, [("Pfizer"       , (27, 07, 2020)) ,("Pfizer"      ,(30, 09, 2020))     ] ),
        ( 84325650761, [("CoronaVac"    , (06, 12, 2020))                                        ] )
    ]

-- CADASTRO SUS
getCidadao :: CPF -> CadastroSUS -> Cidadao
getCidadao cpf cadSus = head ( filter (\cidadao -> getCPF cidadao == cpf ) cadSus )

getVacinado :: CPF -> Vacinados -> Vacinado
getVacinado cpf cadVac = head( filter (\vacinado -> getCPFVacinado vacinado == cpf) cadVac )

-- CIDADAO
getCPF :: (CPF, Nome, Genero, DataNasc, Endereco, Municipio,Estado, Telefone, Email)  -> CPF
getCPF (cpf, _,_,_,_,_,_,_,_ ) = cpf

getNome :: (CPF, Nome, Genero, DataNasc, Endereco, Municipio,Estado, Telefone, Email) -> Nome
getNome (_, nome ,_,_,_,_,_,_,_ ) = nome

getMunicipio :: (CPF, Nome, Genero, DataNasc, Endereco, Municipio,Estado, Telefone, Email) -> Municipio
getMunicipio (_, _ ,_,_,_,municipio,_,_,_ ) = municipio

-- VACINADO
getDosesVacinado :: (CPF, Doses)  -> Doses
getDosesVacinado ( _ , doses ) = doses

getCPFVacinado :: ( CPF , Doses ) -> CPF
getCPFVacinado ( cpf , _ ) = cpf

getMunicipioVacinado :: Vacinado -> CadastroSUS -> Municipio
getMunicipioVacinado (cpf, _ ) cadSUS = getMunicipio (getCidadao cpf cadSUS)

printDoses :: Vacinado -> IO[()]
printDoses ( cpf, doses ) = mapM putStr linhas
    where
        (nomeDose, dataDose ) = head doses

        cauda = tail ( map ( \(nome, dataVac ) -> "       " ++ nome ++ " , " ++ show dataVac ++ "\n" ) doses )

        linhas = ( "DOSES: "++ nomeDose ++ " , " ++ show dataDose ++ "\n") : cauda



type Populacao = Int
type PopMun = (Municipio, Populacao)

data Arv a = NoNulo
           | No PopMun   ( Arv PopMun )    ( Arv PopMun )
--         [ Nó Atual ] [ Nó à Esquerda ] [ Nó à Direita ] 
           deriving (Eq, Ord, Show, Read)

-- Arvore Balanceada
cadastro:: Arv PopMun
cadastro = No ("Itabaiana", 100000 )       -- Nó Pai da Arvore Geral
            ( No ("Capela", 35000 )        -- Sub Arvore Esquerda
                ( No ("Aracaju", 675000) 
                        NoNulo
                        NoNulo )    -- Folha Esquerda-Esquerda
                ( No ( "Estancia", 70000 )
                             NoNulo
                             NoNulo )) -- Folha Direita-Esquerda

            ( No ("Sao Cristovao", 92100 ) -- Sub Arvore Direita
                ( No ("Lagarto", 107000) 
                               NoNulo
                               NoNulo )    -- Folha Esquerda-Direita
                ( No ( "Siriri"  , 10000 )
                               NoNulo
                               NoNulo )) -- Folha Direita-Direita

getMunicipioPopMun :: PopMun -> Municipio
getMunicipioPopMun (municipio, populacao) = municipio

getPopulacaoPopMun :: PopMun -> Populacao
getPopulacaoPopMun (municipio, populacao) = populacao

buscarNo :: Municipio -> Arv a ->  PopMun
buscarNo municipio ( No popMun arvEsq arvDir )
    | municipio == municipioPopMun = popMun
    | municipio <  municipioPopMun = buscarNo municipio arvEsq
    | municipio >  municipioPopMun = buscarNo municipio arvDir
    where
        municipioPopMun = getMunicipioPopMun popMun

buscarNo _ NoNulo = error "Municipio não encontrado"


