{-# LANGUAGE OverloadedStrings #-}
import CodeWorld

{- 
  Nome : Marcos Gabriel da Silva Santos
  Matrícula: 202100012053

 * O projeto não foi feito em dupla *
 
******************************** 
*** Player 1 - Nave Vermelha ***
********************************

 * Aceleração          : W
 * Rotação Horária     : A
 * Rotação AntiHorária : D
 * Disparo de Projetil : G
 
**************************** 
*** Player 2 - Nave Azul ***
**************************** 

 * Aceleração          : 8 [ NumPad ]
 * Rotação Horária     : 4 [ NumPad ]
 * Rotação AntiHorária : 6 [ NumPad ]
 * Disparo de Projetil : + [ NumPad ]

-------------------------------------
=== Funçoes Relativas às questões ===
-------------------------------------

------------ Tópico Nave ------------

1 - playerMovement :: DeltaTime -> World -> World 
  ( shipMovement posVec dirVec time velMag accMag Accelerate inertia  )

2 - playerMovement :: DeltaTime -> World -> World 
  ( shipMovement posVec dirVec time velMag _ Forward inertia  )

3 - playerRotation :: DeltaTime -> World -> World

4 - update (KeyPress "G") world@Ship 
  ( Dentro das Guarda que verifica o "tempo de vida" de cada projetil )

5.1 - bulletCollision :: DeltaTime -> World -> World 
    ( Verificação da Colisão )

5.2 - playerHealthCheck :: DeltaTime -> World -> World

+ Opcionais:  

+ 7.1 - playerOutTime :: DeltaTime -> World -> World  
    ( Incrementa e Reseta , se necessário, o tempo em que cada nave esteja fora  )
    
+ 7.2 - playerOutDeath :: DeltaTime -> World -> World  
    ( Verifica o tempo que cada nave ficou fora e a mata "silenciosamente"  )


---------- Tópico Projeteis ---------

1 - bulletMovement :: DeltaTime -> World -> World
    ( Atualiza a posição de cada projétil )

2 - bulletVelocity :: VelocityVector -> VelocityVector -> Rotation -> PlayerRotation -> VelocityVector
    (
      * função que calcula o vetor velocidade de cada projétil.
      * Ele é utilizado dentro do bulletMovement
    )
    
4 - bulletWallDeath :: DeltaTime -> World -> World
    ( Verifica e mata, se necessário, os projéteis fora do "espaço visível" )
    
5 - bulletLifeTime :: DeltaTime -> World -> World
    ( Verifica o tempo de vida de cada projétil )
-}



main = do
  activityOf world update render
-- ============================================================== TYPES and Data  ==============================================================================

type Polygon = [Point]

type Velocity = Double
type VelocityVector = Vector
type Acceleration = Vector
type Health = Int
type Rotation = Double
type Spinning = Char
type DeltaTime = Double
type Time = Double

data PlayerMove = Forward | Stop | Accelerate
                deriving Show

data PlayerRotation = LeftRotation | RightRotation | NoRotation
                deriving Show
type Bullet = ( Point, Rotation, Time , VelocityVector )
data World =
        Ship  {
                ---------------------------  Player 1  ---------------------------------
                player1Position  :: Point,             -- Posição 
                player1Velocity  :: Velocity,          -- Magnitude da Velocidade 

                player1Direction :: Rotation,          -- Angulo da Direção em Radianos
                player1DirectionInertia :: Rotation, 
                
                player1Health    :: Health,            -- Vida do Player  

                player1Movement  :: PlayerMove,        -- Input do Movemento
                player1Rotation  :: PlayerRotation,    -- Input da Rotação
                
                
                player1Bullets   :: [Bullet],          -- Lista dos Projeteis do Player1
                player1OutTime   :: Time,              -- Tempo Corrido em que o Player está fora do Mapa
                
                ---------------------------  Player 2  ---------------------------------
                player2Position  :: Point,             -- Posição
                player2Velocity  :: Velocity,          -- Magnitude de Velocidade

                player2Direction :: Rotation,          -- Angulo da Direção em Radianos
                player2DirectionInertia :: Rotation, 

                player2Health    :: Health,            -- Vida do Player

                player2Movement  :: PlayerMove,        -- Input do Movemento
                player2Rotation  :: PlayerRotation,    -- Input da Rotação
                
                player2Bullets   :: [Bullet],          -- Lista dos Projeteis do Player1
                player2OutTime   :: Time               -- Tempo Corrido em que o Player está foda do Mapa
              
              } deriving Show

-- ********************************   Mundo Inicial   *******************************
world  =
   Ship {
           ---------------------------  Player 1  ---------------------------------
           
           player1Position = player1InitialPos,
           player1Velocity = shipVelocity,

           player1Direction = pi/4,
           player1DirectionInertia = pi/4,
           player1Health = shipHealth,

           player1Movement = Stop,
           player1Rotation = NoRotation,           
           
           player1Bullets = [],
           player1OutTime = 0.0,
           
           ---------------------------  Player 2  ---------------------------------
           
           player2Position = player2InitialPos,
           player2Velocity = shipVelocity,

           player2Direction = 5 * pi / 4,
           player2DirectionInertia = 5 * pi / 4,

           player2Health = shipHealth,

           player2Movement = Stop,
           player2Rotation = NoRotation,
           
           player2Bullets = [],
           player2OutTime = 0.0
           
        }


-- =================================================================== CONSTANTES ============================================================

-- Status Nave
shipHealth = 10           -- Vida das Naves
accNave = 600             -- Aceleração das Naves
velAngNave = pi/2         -- Velocidade Angular da Rotação da Nave
shipVelocity = 4          -- Velocidade de Locomoção da Nave

shipPol = [               -- Pontos da Nave do Poligono
            (  0.75, 0    ),
            ( -0.75, 0.70 ),
            ( -0.5 , 0    ),
            ( -0.75, -0.7 )
          ]                    
bulletPol = [             -- Pontos do Projétil do Poligono  
              (-0.2, -0.06 ),
              (-0.2, 0.06) ,
              (0.2, 0.06),
              (0.2, -0.06)
             ] 

-- Status Projétil
velSaidaArma = 10         -- Velocidade Do Projetil
durMaxProjetil = 5        -- Tempo de Vida do Projetil
cadArma = 6               -- Cadência da arma

player1InitialPos = ( -5, -5 )  -- Posição Inicial do Player 1
player2InitialPos = ( 5, 5 )    -- Posição Inicial do Player 2


-- Status Global
tempoMaxFora = 8          -- Tempo Maximo que a Nave Ficará fora do Limite do Mapa
worldLimit = 10           -- Distancia do centro ao Limite do Mapa

deathZone  = ( 200, 200 ) -- Local para onde as naves vão após morrer
  
-- ==================================================================== PICTURES ===============================================================================

-- Gera a " Picture " da nave a partir da constante < shipPol >
spaceShip :: Picture
spaceShip = translated (-x) (-y) (solidPolygon shipPol)
  where
    (x, y) = centroid shipPol

-- Gera a " Picture " do projétil a partir da constante da < bulletPol > 
bullet :: Picture
bullet = translated (-x) (-y) (solidPolygon bulletPol)
  where
    (x, y) = centroid bulletPol

-- ==================================================================== ACTIVITY ==============================================================================

update :: Event -> World -> World

-----------------------------  Player 1  ---------------------------------

-- Movimento de Acceleração   
update (KeyPress "W")   world = world { player1Movement = Accelerate }
update (KeyRelease "W") world = world { player1Movement = Forward }

-- Rotação Lateral ( Esquerda )
update (KeyPress "A")   world = world { player1Rotation = LeftRotation }
update (KeyRelease "A") world = world { player1Rotation = NoRotation }

-- Rotação Lateral ( Direita )
update (KeyPress "D")   world = world { player1Rotation = RightRotation }
update (KeyRelease "D") world = world { player1Rotation = NoRotation}

-- Disparo de Projeteis
update (KeyPress "G") world@Ship {
                                   player1Bullets   = p1Bullets,
                                   player1Position  = p1Position,
                                   player1Direction = p1Direction,
                                   player1Rotation = p1Rotation
                                 }
  | lifeTimeLB >= 1 / cadArma = world { player1Bullets = p1Bullets ++ [newBullet] }
  | otherwise                 = world
  where
    (_,_,lifeTimeLB, _) = if p1Bullets /= [] then last p1Bullets else ((0,0) , 0 , durMaxProjetil, (0,0)) 
    
    newBullet = ( position , p1Direction , 0.0, bulletVelocity shipVelocityVector bulletVelocityVector p1Direction p1Rotation)
    ( p1X, p1Y ) = p1Position 
    position = translatedPoint p1X p1Y ( rotatedPoint p1Direction ( head shipPol `vectorSum` (0.5,0) ) )
    
    shipVelocityVector = scaledVector shipVelocity (unitVector p1Direction)
    bulletVelocityVector = scaledVector velSaidaArma (unitVector p1Direction)

-----------------------------  Player 2  ---------------------------------

update (KeyPress "8")   world = world { player2Movement = Accelerate }
update (KeyRelease "8") world = world { player2Movement = Forward }

-- Rotação Lateral ( Esquerda )
update (KeyPress "4")   world = world { player2Rotation = LeftRotation }
update (KeyRelease "4") world = world { player2Rotation = NoRotation }

-- Rotação Lateral ( Direita )
update (KeyPress "6")   world = world { player2Rotation = RightRotation }
update (KeyRelease "6") world = world { player2Rotation = NoRotation}

-- Disparo de Projeteis
update (KeyPress "+") world@Ship {
                                   player2Bullets   = p2Bullets,
                                   player2Position  = p2Position,
                                   player2Direction = p2Direction,
                                   player2Rotation  = p2Rotation
                                 }
  | lifeTimeLB >= 1 / cadArma = world { player2Bullets = p2Bullets ++ [newBullet] }
  | otherwise                 = world
  where
    (_,_,lifeTimeLB, _) = if p2Bullets /= [] then last p2Bullets else ((0,0) , 0 , durMaxProjetil, (0,0)) 
    
    newBullet = ( position , p2Direction , 0.0, bulletVelocity shipVelocityVector bulletVelocityVector p2Direction p2Rotation)
    ( p1X, p1Y ) = p2Position 
    position = translatedPoint p1X p1Y ( rotatedPoint p2Direction ( head shipPol `vectorSum` (0.5,0) ) )
    
    shipVelocityVector = scaledVector shipVelocity (unitVector p2Direction)
    bulletVelocityVector = scaledVector velSaidaArma (unitVector p2Direction)

-------------------------------  WORLD  ---------------------------------

-- Função da Passagem do Tempo 
update (TimePassing t) world = 
      playerMovement t . playerRotation t  .  playerOutTime t  . playerOutDeath t  . playerHealthCheck t  . -- Funções Activity * Player

                         bulletMovement t  .  bulletLifeTime t . bulletWallDeath t . bulletCollision   t    -- Funções Activity * Bullet
      $ world 

-- Pattern Matching da Função < update >
update _ world = world

-- Função de Renderização das Imagens na Tela
render :: World -> Picture
render world@Ship {
                    player1Position  = (p1X , p1Y),
                    player1Direction = p1Dir,
                    player1Bullets   = p1Bullets,
                    
                    player2Position  = (p2X , p2Y),
                    player2Direction = p2Dir,
                    player2Bullets   = p2Bullets
                    
                  }
        
        -- RENDER PLAYER 1 e PROJETEIS
        = colored red 
           ( translated p1X p1Y (rotated p1Dir spaceShip))
        & colored red 
           ( pictures ( map (\(bulletPos, bulletAngle, _, _) -> translated (fst bulletPos) (snd bulletPos) (rotated bulletAngle bullet )) p1Bullets ))
        
        -- RENDER PLAYER 2 e PROJETEIS
        & colored blue 
           ( translated p2X p2Y (rotated p2Dir spaceShip))
        
        & colored blue 
           ( pictures ( map (\(bulletPos, bulletAngle, _, _) -> translated (fst bulletPos) (snd bulletPos) (rotated bulletAngle bullet )) p2Bullets ))
        

-- ============================================================== FUNCOES ACTIVITY ===================================================================== --

-----------------------------  Player Activity  --------------------------------

-- Resumo:
--      Essa função calcula a velocidade em MRU e MRUV 
--    , dependendo do Input de Locomoção ( playerXMovement )

-- Comentário do Avaliador : 
playerMovement :: DeltaTime -> World -> World
playerMovement delta world@Ship { 
                                  player1Position  = p1Pos,
                                  player1Movement  = p1Move,
                                  player1Velocity  = p1Vel,
                                  player1Direction = p1Dir,
                                  player1DirectionInertia = p1Inertia,
                                  
                                  player2Position  = p2Pos,
                                  player2Movement  = p2Move,
                                  player2Velocity  = p2Vel,
                                  player2Direction = p2Dir,
                                  player2DirectionInertia = p2Inertia

                                }
        
        = world { 
                  player1Position   = shipMovement p1Pos p1DirVec delta p1Vel accNave p1Move p1InertiaVec,
                  player2Position   = shipMovement p2Pos p2DirVec delta p2Vel accNave p2Move p2InertiaVec,
                  
                  player1DirectionInertia = inertiaMovement p1Move p1Inertia p1Dir,
                  player2DirectionInertia = inertiaMovement p2Move p2Inertia p2Dir
                  
                }
        where
          p1DirVec = unitVector p1Dir
          p2DirVec = unitVector p2Dir
          
          p1InertiaVec = unitVector p1Inertia
          p2InertiaVec = unitVector p2Inertia
          
          inertiaMovement Accelerate inertia dir = dir
          
          inertiaMovement Forward  inertia  dir = inertia
          
          inertiaMovement Stop inertia dir      = dir
          
          -- Cálculo de MRUV  < Função Auxiliar Interna >  
          shipMovement posVec dirVec time velMag accMag Accelerate inertia =
             posVec `vectorSum` scaledVector time ((scaledVector velMag dirVec)) `vectorSum` ( scaledVector ( 1/2 ) (scaledVector ( accNave * (time ** 2) ) dirVec) )

          -- Calculo de MRU < Função Auxiliar Interna >
          shipMovement posVec dirVec time velMag _ Forward inertia = 
             posVec `vectorSum` scaledVector time ((scaledVector velMag inertia))

          -- Mantém a posição em caso de evento " Stop "
          shipMovement posVec _ _ _ _ Stop _= posVec

-- Resumo:
--      Essa função calcula a velocidade em MRU angular
--    , dependendo do Input de Rotação ( playerXRotation )

-- Comentário do Avaliador :    
playerRotation :: DeltaTime -> World -> World
playerRotation delta world@Ship {
                                  player1Rotation  = p1Rot,
                                  player1Direction = p1Dir,
                                  
                                  player2Rotation  = p2Rot,
                                  player2Direction = p2Dir
                                }
            = world {
                       player1Direction = newDir1,
                       player2Direction = newDir2
                    }
            where
              newDir1 = shipRotation delta p1Dir p1Rot
              newDir2 = shipRotation delta p2Dir p2Rot
              
              shipRotation t dirAngle RightRotation = dirAngle - velAngNave * t
              shipRotation t dirAngle LeftRotation  = dirAngle + velAngNave * t
              shipRotation t dirAngle NoRotation    = dirAngle 


-- Resumo :
--      Essa Função adiciona tempo à propriedade playerXOutTime, enquanto ele estiver fora dos Limites do Mapa
--      Caso ele volta esse tempo é resetado

-- Comentário do Avaliador : 
playerOutTime :: DeltaTime -> World -> World
playerOutTime delta world@Ship {
                                 player1Position = ( p1X, p1Y ),
                                 player1OutTime  = p1OutTime,
                                 
                                 player2Position = ( p2X, p2Y ),
                                 player2OutTime  = p2OutTime 
                               }
         = world {
                   player1OutTime = newOutTime1,
                   player2OutTime = newOutTime2
                 }
         
         where
           newOutTime1 = if ( p1X > worldLimit || p1X < -worldLimit  || p1Y > worldLimit || p1Y < -worldLimit ) 
                         then
                           p1OutTime + delta
                         else
                           0 
           
           newOutTime2 = if ( p2X > worldLimit || p2X < -worldLimit  || p2Y > worldLimit || p2Y < -worldLimit ) 
                         then
                           p2OutTime + delta
                         else
                           0

-- Resumo :
--      Essa Função verifica o tempo em que a nave está fora do limite do mundo

-- Comentário do Avaliador : 
playerOutDeath :: DeltaTime -> World -> World
playerOutDeath delta world@Ship {
                                   player1Position = p1Position,
                                   player2Position = p2Position,
                                   
                                   player1Movement = p1Move,
                                   player2Movement = p2Move,
                                   
                                   player1OutTime = p1OutTime,
                                   player2OutTime = p2OutTime
                                }
               = world {
                         player1Position = newPosition p1OutTime p1Position,
                         player2Position = newPosition p2OutTime p2Position,
                         
                         player1Movement = newMovement p1OutTime p1Move,
                         player2Movement = newMovement p2OutTime p2Move
                         
                       }
  where
    newPosition outTime position = if (outTime >= tempoMaxFora) 
                                      then
                                        deathZone
                                      else
                                        position
    
    newMovement outTime movement = if (outTime >= tempoMaxFora) 
                                      then
                                        Stop
                                      else
                                        movement

-- Resumo :
--    Essa Função checa a vida das naves, caso uma ela reduza a 0 ou abaixo , o Player some, sendo enviado para DeathZone

-- Comentário do Avaliador : 
playerHealthCheck :: DeltaTime -> World -> World
playerHealthCheck delta world@Ship {
                                     player1Health = p1Health,
                                     player2Health = p2Health
                                   }
      | p1Health <= 0 = world { player1Position = deathZone }
      | p2Health <= 0 = world { player2Position = deathZone }
      | otherwise     = world

-----------------------------  Bullet Activity  --------------------------------

-- Resumo:
--     Essa Função verifica as posições de seu 

-- Comentário do Avaliador : 
bulletCollision :: DeltaTime -> World -> World
bulletCollision delta world@Ship {
                                    player1Position  = p1Position,
                                    player2Position = p2Position,
                                    
                                    player1Direction = p1Dir,
                                    player2Direction = p2Dir,
                                    
                                    player1Bullets   = p1Bullets,
                                    player2Bullets   = p2Bullets,
                                    
                                    player1Health    = p1Health,
                                    player2Health    = p2Health
                                 }
  = world {
            player1Health = newHealth p1Position p1Dir p1Health,
            player2Health = newHealth p2Position p2Dir p2Health,
            
            player1Bullets = filter (\bullet -> not (bulletIntersectShip bullet p2Position p2Dir)) p1Bullets,
            player2Bullets = filter (\bullet -> not (bulletIntersectShip bullet p1Position p1Dir)) p2Bullets

          }
  
  where
    
    allBullets = p1Bullets ++ p2Bullets 
    

    newHealth (posX, posY) playerDir health = if ( any (==True) (map (\bullet -> bulletIntersectShip bullet (posX,posY) playerDir) allBullets) )
                                                then
                                                  health - 1
                                                else
                                                  health
-- Resumo:
--      Atualiza a velocidade de todos os projéteis 

-- Comentário do Avaliador : 
bulletMovement :: DeltaTime -> World -> World
bulletMovement delta world@Ship {
                                  player1Bullets = p1Bullets,
                                  player2Bullets = p2Bullets
                                } 
                                = 
                                world {
                                          player1Bullets = newBulletsPlayer1,
                                          player2Bullets = newBulletsPlayer2
                                        }
  where
    newBulletsPlayer1 = map (\(bPos, bDir, time, bVel) -> (newPosition bPos bVel, bDir,time, bVel) ) p1Bullets
    newBulletsPlayer2 = map (\(bPos, bDir, time, bVel) -> (newPosition bPos bVel, bDir,time, bVel) ) p2Bullets

    newPosition s0 velVec = s0 `vectorSum` scaledVector delta velVec -- s0 + v * t 
    
-- Resumo:
--     Elimina os projeteis passam do tempo Máximo

-- Comentário do Avaliador : 
bulletLifeTime :: DeltaTime -> World -> World
bulletLifeTime delta world@Ship {
                                  player1Bullets = p1Bullets,
                                  player2Bullets = p2Bullets
                                  
                                }
      = world {
                player1Bullets = bullets p1Bullets,
                player2Bullets = bullets p2Bullets
              }
       where
         addedTime bulletList = map (\(bPos, bRot, bLifeTime, i) -> (bPos, bRot, bLifeTime + delta,i) ) bulletList
         bullets bulletList = filter (\(bPos, bRot, bLifeTime,i) -> bLifeTime <= durMaxProjetil ) (addedTime bulletList)

-- Resumo:
--     Elimina os projéteis que estão fora do limite visível

-- Comentário do Avaliador : 
bulletWallDeath :: DeltaTime -> World -> World
bulletWallDeath delta world@Ship {
                                   player1Bullets = p1Bullets
                                 }
     = world {
                player1Bullets = bullets
             }
     where
       bullets = filter (\((bX,bY), bRot, bLifeTime,_) -> bX < worldLimit && bX > -worldLimit && bY < worldLimit && bY > -worldLimit ) p1Bullets;


-- ========================================================= FUNCOES AUXILIARES PARA ACTIVITY ===================================================================== --

-- FUNÇÃO AUXILIAR QUE CALCULA O VETOR VELOCIDADE DO PROJETIL EM DIFERENTES ROTAÇÕES
bulletVelocity :: VelocityVector -> VelocityVector -> Rotation -> PlayerRotation -> VelocityVector
bulletVelocity sVelVec bVelVec angle NoRotation = sVelVec `vectorSum` bVelVec

bulletVelocity sVelVec bVelVec angle LeftRotation = sVelVec `vectorSum` bVelVec `vectorSum` tangVelVec
  where
    tangVelVec = scaledVector (velAngNave * raio) direcaoTang
    raio = fst (head (shipPol))

    direcaoTang = unitVector (angle + 90)

bulletVelocity sVelVec bVelVec angle RightRotation = sVelVec `vectorSum` bVelVec `vectorSum` tangVelVec
  where
    tangVelVec = scaledVector (velAngNave * raio) direcaoTang
    raio = fst (head (shipPol))

    direcaoTang = unitVector (angle - 90)

-- FUNÇÃO AUXILIAR DE INTERSEÇÃO ENTRE POLIGONO DA BALA E POLIGONO DA NAVE
bulletIntersectShip :: Bullet -> Point -> Rotation -> Bool
bulletIntersectShip ( (bPosX,bPosY), bRot, time, bVel ) shipPoint shipAngle
  | any (== True) ( map (\bSeg -> doesIntersectList bSeg shipSegments ) bulletSegments ) = True
  | otherwise                                                                            = False
  where
    bulletSegments = pontosPol (map (\point -> translatedPoint bPosX bPosY (rotatedPoint bRot point) ) bulletPol )
    shipSegments = pontosPol (map (\point -> translatedPoint (fst shipPoint) (snd shipPoint ) (rotatedPoint shipAngle point)) shipPol) 

-- FUNÇÃO AUXILIAR ENTRE SEGMENTO E POLIGONO
doesIntersectList :: ( Point, Point ) -> [( Point , Point )] -> Bool
doesIntersectList segment listSegment = any (== True) (map (\seg -> doesIntersect seg segment ) listSegment)

-- ============================================================== FUNCOES GEOMÉTRICAS ===================================================================== --

-- FUNÇÕES TRIGONOMÉTRICAS
radians dg = dg * (pi/180)

degrees rad = rad * (180/pi)

-- FUNÇÕES AUXILIARES DA FUNÇÃO DE INTERSEÇÃO
orientation :: Point -> Point -> Point -> Int
orientation p q r
   | val == 0  = 0
   | val > 0   = 1
   | otherwise = 2
   where
     pX = fst p
     pY = snd p
     
     qX = fst q
     qY = snd q
     
     rX = fst r
     rY = snd r
     
     val = ( (qY - pY ) * (rX - qX) ) - ( (qX - pX) * (rY - qY) )

onSegment :: Point -> Point -> Point -> Bool
onSegment p q r
  | qX <= max pX rX && qX >= min pX rX && qY <= max pY rY && qY >= min pY rY = True
  | otherwise                                                                = False
  where
    pX = fst p
    pY = snd p
    
    qX = fst q
    qY = snd q
    
    rX = fst r
    rY = snd r

-- FUNCÃO DE INTERSEÇÃO ENTRE 2 SEGMENTOS
doesIntersect :: ( Point , Point ) -> ( Point , Point ) -> Bool
doesIntersect ( p1, q1 ) (p2 , q2)
 | o1 /= o2 && o3 /= o4     = True
 | o1 == 0 && onSegment p1 p2 q1 = True
 | o2 == 0 && onSegment p1 p2 q1 = True
 | o3 == 0 && onSegment p2 p1 q2 = True
 | o4 == 0 && onSegment p2 q1 q2 = True
 | otherwise                = False
  
  where
     o1 = orientation p1 q1 p2
     o2 = orientation p1 q1 q2
     o3 = orientation p2 q2 p1
     o4 = orientation p2 q2 q1


-- FUNCOES DE SEGMENTO DO POLIGONO
pontosPol :: Polygon -> [(Point, Point)]
pontosPol polygon = zip polygon ( tail polygon ++ [head polygon] )

-- FUNCOES DE AREA DO POLIGONO
areaPol :: Polygon -> Double
areaPol polygon = abs ( (1/2) * (sum [(x1 * y2) - (x2 * y1) | ((x1, y1), (x2, y2)) <- pontos ]) )
  where
    pontos = pontosPol polygon

-- FUNCOES DE CENTROIDE DO POLIGONO
centroid :: Polygon -> Point
centroid polygon = (cx , cy)
  where
    cx = ( 1 / (6 * area)) * ( sum [ (x1 + x2) * ( (x1*y2)-(x2*y1) )  
                                                      | ((x1,y1),(x2,y2)) <- pontos ])
    
    cy = ( 1 / (6 * area)) * ( sum [ (y1 + y2) * ( (x1*y2)-(x2*y1) )  
                                                      | ((x1,y1),(x2,y2)) <- pontos ])
    
    
    area = areaPol polygon
    pontos = pontosPol polygon

-- FUNÇÃO QUE CRIA UM VETOR DIRETOR A PARTIR DE UM ANGULO EM RADIANOS
unitVector :: Double -> Vector
unitVector a = (cos a, sin a)