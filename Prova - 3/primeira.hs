primQuest :: [(Int, Int, Int)] -> [(Int, Int, Int)]
primQuest lista = map mySort listaImpares
    where
     listaImpares = ( filter (\(a,b,c) -> odd ( a*b*c) ) lista )

mySort :: (Int , Int, Int ) -> (Int, Int, Int)
mySort (x,y,z)
    | x >= y && y >= z = ( x, y, z )
    | x >= y && y <= z = ( x, z, y )
    | x <= y && y >= z = ( y, x, z )
    | x >= y && y <= z = ( z, x, y )
    | x <= y && y >= z = ( y, z, x )
    | x <= y && y <= z = ( z, y, x )