import CodeWorld
import Data.List


main = do 
    print ( intersectionPoint segmento1 segmento2)
    print ( isVerticalSegment segmento2)
    print ( isVerticalSegment segmento4)
    print ( not( getX (getOrigin segmento2) == getX (getOrigin segmento4)))

    print ( isParallel segmento2 segmento4)
    
    print ( getX (getOrigin segmento4))
    print ( getX (getOrigin segmento2))

    drawingOf (
            coordinatePlane 
         & segmentPicture segmento4
         & segmentPicture segmento2
        -- &  segmentPicture segmento3 
        --  & translated (getX (intersectionPoint segmento1 segmento2))
        --               (getY (intersectionPoint segmento1 segmento2))
        --               (colored blue (solidCircle 0.3)) 
        -- & poligono1
            )


type Slope   = Double
type Linear  = Double
type Segment = (Point, Point)
-- Retas Colineares sem Intersecao
--segmento1 = ( (0,0), (5, 5) )
--segmento2 = ( (6,6), (10, 10) )

-- Retas Colineares com Intersecao
--segmento1 = ( (0,0), (5, 5) )
--segmento2 = ( (4,4), (10, 10) )

-- Intersecao com Segmento Vertical
segmento1 = ( (0,0), (5, 5) )
segmento2 = ( (4,1), (4, 10) )
segmento4 = ( (2,1), (2, 10) )


--Retas Paralelas
--segmento1 = ( (0,0), (5, 5) )
--segmento2 = ( (0,4), (5, 9) )

-- Poligonos
poligono1 = polygon pontosPoligono
pontosPoligono = [(4,4), (6,4), (6,8), (4,8)]

--segmento3 = ((5 , 5), (6 , 6))  -- Segmento que nao Intersecta
-- segmento3 = ((2 , 5), (6 , 6)) -- Segmento que Intersecta 1 lado
segmento3 = ((5 , 3), (6 , 7))   -- Segmento que Intersecta o ponto que une 2 segmentos

-- QUESTAO 1
-- Verifica se o ponto de Interseccao `p` esta entre as projecoes vertical e horizontal dos segmentos 
doesIntersect :: Segment -> Segment -> Bool
doesIntersect seg1 seg2
   | isBetween xAxisSeg1 pX && isBetween yAxisSeg1 pY -- Esta entre as projecoes de do Segmento 1 
  && isBetween xAxisSeg2 pX && isBetween yAxisSeg2 pY -- E tambem esta entre as projecoes do Segmento 2
                                     = True           -- , entao os 2 Segmentos se Intersectao
   | isColinear seg1 seg2                             -- é colinear 
  && doesOverlap xAxisSeg1 xAxisSeg2 = True           -- e sus pontos se sobrepoe na projeção X
  
   | isParallel seg1 seg2            = False          -- Paralelismo (Intersecao tendendo ao Infinito)
   | otherwise                       = False          -- caso contrario, e um ponto de intesecao fora das retas 
   where
        p = intersectionPoint seg1 seg2

        pX = getX (p)
        pY = getY (p)
        xAxisSeg1 = listOfX (getOrigin seg1) (getDestination seg1)
        xAxisSeg2 = listOfX (getOrigin seg2) (getDestination seg2)

        yAxisSeg1 = listOfY (getOrigin seg1) (getDestination seg1)
        yAxisSeg2 = listOfY (getOrigin seg2) (getDestination seg2)

--  ======================================================== FUNCOES AUXILIARES QUESTAO 1 =================================================================

-- FUNCOES AUXILIARES DE PONTO DE INTERSECÇÂO

-- Ponto de Intersecao entre 2 segmentos
intersectionPoint :: Segment -> Segment -> Point
intersectionPoint seg1 seg2
    | isVerticalSegment seg1 || isVerticalSegment seg2 = (1,1) 
    | otherwise  = ( intX, intY )
    where
        m = getSlope seg1
        c = getLinear seg1

        a = getSlope seg2
        b = getLinear seg2
        
        intX = ( c - b ) / ( a - m ) -- X do Ponto de Intersecao

        intY = ( m * intX) + c -- Y do Ponto de Intersecao = Equacao da Reta para X do Ponto de Intersecao

isBetween :: [Double] -> Double -> Bool
isBetween axis pt 
    | pt <= x && pt >= x0 = True
    | otherwise = False
    where
        x  = last (sort (axis))
        x0 = head (sort (axis))

isVerticalSegment :: Segment -> Bool
isVerticalSegment seg
  | getX (getOrigin seg) == getX (getDestination seg) = True
  | otherwise = False

-- Recebe os pontos,inicial e final, de projecao dos segmentos no eixo(vertical ou horizontal) 
-- e calcula a soma dos tamanhos dos segmentos, dps compara com o tamanho de um segmento correspondente ao
-- ponto inicial do primeiro segmento ate o ponto final do maior segmento.
doesOverlap :: [Double] -> [Double] -> Bool
doesOverlap seg1 seg2
  | x + y >= z = True  
  | otherwise  = False
  where
    proj1 = sort seg1
    proj2 = sort seg2
    
    proj3 = sort (proj1 ++ proj2) -- Todos os pontos da projecao no eixo, sortidos
    
    x = (last proj1) - (head proj1)  
    y = (last proj2) - (head proj2)  
    
    menor = head proj3
    maior = last proj3
    
    z = maior - menor
    
    soma = x + y



-- FUNCOES AUXILIARES BOOLEANAS
isParallel :: Segment -> Segment -> Bool
isParallel seg1 seg2 
  | isVerticalSegment seg1 && isVerticalSegment seg2 
 && not( getX (getOrigin seg1) == getX (getOrigin seg2)) = True
  | otherwise = sameSlope seg1 seg2 && not(sameLinear seg1 seg2)

isColinear :: Segment -> Segment -> Bool
isColinear seg1 seg2 = sameSlope seg1 seg2 && sameLinear seg1 seg2

sameSlope :: Segment -> Segment -> Bool
sameSlope seg1 seg2 = getSlope seg1 == getSlope seg2

sameLinear :: Segment -> Segment -> Bool
sameLinear seg1 seg2 = getLinear seg1 == getLinear seg2


-- FUNCOES AUXILIARES DOS PONTOS
listOfX :: Point -> Point -> [Double]
listOfX orgn dest = [getX orgn, getX dest]

listOfY :: Point -> Point -> [Double]
listOfY orgn dest = [getY orgn, getY dest]

getX :: Point -> Double 
getX (x , _) = x

getY :: Point -> Double
getY (_, y) = y

-- FUNCOES AUXILIARES DOS SEGMENTOS
getOrigin :: Segment -> Point
getOrigin (origin, _) = origin

getDestination :: Segment -> Point
getDestination (_, destination ) = destination

getSlope  :: Segment -> Slope
getSlope seg = oposto / adjacente
  where
    oposto    = (getY (getDestination seg)) - (getY (getOrigin seg))
    adjacente = (getX (getDestination seg)) - (getX (getOrigin seg))
    
getLinear :: Segment -> Slope
getLinear seg = y - ( m * x )
  where
    y = getY (getDestination seg)
    m = getSlope seg
    x = getX (getDestination seg)

segmentToList :: Segment -> [Point]
segmentToList seg = zip (listOfX origin destination) 
                        (listOfY origin destination)
   where
        origin      = (getOrigin seg)
        destination = (getDestination seg)

-- FUNCOES QUE RETORNAM FIGURAS
segmentPicture :: Segment -> Picture
segmentPicture seg = polyline (segmentToList seg)

--TODO :: RETA VERTICAL
-- QUESTAO 2
doesIntersectPolygon :: [Point] -> Segment -> Bool
doesIntersectPolygon pol seg = not (null [ x | x <- getListOfSegments pol , doesIntersect seg x ])

--  ======================================================== FUNCOES AUXILIARES QUESTAO 2 =================================================================
createSegment :: Point -> Point -> Segment
createSegment pt1 pt2 = (pt1, pt2)

getListOfSegments :: [Point] -> [Segment]
getListOfSegments pol = (zip pol (drop 1 pol)) ++ [(head pol, last pol)]


-- QUESTAO 4
areaPolygon :: [Point] -> Double
areaPolygon pol = (sum [ calcDet z w | z <- pol, w <- listPol]) / 2
  where
    listPol = drop 1 pol

calcDet :: Point -> Point -> Double
calcDet z w = ( x1 * y2 - x2 * y1 )
  where
    x1 = fst z
    x2 = fst w
    
    y1 = snd z
    y2 = snd w
    

