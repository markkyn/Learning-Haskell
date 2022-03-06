type Pessoa = (Nome , DataNascimento)
type DataNascimento = Data
 
type Data = (Int, Int, Int)
 
type FaixaIdade = (Int, Int)
type Nome = String
 
data Arvore pessoa = NoNulo | No Pessoa (Arvore Pessoa) (Arvore Pessoa) deriving (Eq, Show)
 
segunda :: Arvore p -> Data -> FaixaIdade -> Int
segunda arvore dataHoje fxa = length (filter (\(nomePessoa, nascPessoa) -> isIdadeBetween (calcIdade dataHoje nascPessoa ) fxa ) listaPessoas)
    where
        listaPessoas = percorrerArvore arvore
 
 
calcIdade :: Data -> DataNascimento -> Int
calcIdade (diaHoje, mesHoje , anoHoje ) ( diaNasc, mesNasc , anoNasc )
        | mesHoje < mesNasc                             = anoHoje - anoNasc - 1
        | (mesNasc == mesHoje) && (diaNasc > diaHoje)   = anoHoje - anoNasc - 1
        | otherwise                                     = anoHoje - anoNasc
 
formatarFaixaIdade :: FaixaIdade -> FaixaIdade
formatarFaixaIdade fxa
    | prim < scnd = (prim, scnd)
    | otherwise   = (scnd, prim)
    where
        prim = fst fxa
        scnd = snd fxa
 
isIdadeBetween :: Int -> FaixaIdade -> Bool
isIdadeBetween idade fxa
    | idade >= fst faixa && idade <= snd faixa  = True
    | otherwise                                 = False
    where
        faixa = formatarFaixaIdade fxa
 
 
 
percorrerArvore :: Arvore pessoa -> [Pessoa]
percorrerArvore NoNulo = []
percorrerArvore (No noPai subEsq subDir) = percorrerArvore subEsq ++ [noPai] ++ percorrerArvore subDir
