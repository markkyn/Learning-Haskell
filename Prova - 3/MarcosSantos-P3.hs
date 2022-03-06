import Data.Char ( toUpper )
import Data.Set ( toList, fromList )

separa :: Char -> String -> [[Char]]
separa _ "" = []
separa char str =
    let (x, xs) = break (== char) str
        (_, remain) = span (== char) xs
     in x : separa char remain

deletaDuplicados :: Ord a => [a] -> [a]
deletaDuplicados = toList . fromList


quarta :: IO()
quarta = do
    input <- getLine
    let lista = deletaDuplicados (map (map toUpper) ( separa ' ' input ))

    mapM putStrLn lista

    return ()