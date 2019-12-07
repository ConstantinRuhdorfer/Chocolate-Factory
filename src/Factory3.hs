module Factory3 
    ( run
    ) where


{-|
    Programm entry point
-}
run :: IO ()
run = do
    let meltedChoc = mkChoc "melted" "dark" 32
    let wrappedDark = fabric meltedChoc

    print ("Factory V3: Converting some delicious " ++ (show meltedChoc) ++ " to: " ++ (show wrappedDark))
    
data Choc = Choc
    { state :: String -- Melted, Solid chunk, Piece, Wrapped
    , choctype :: String -- Dark, Milk
    , size :: Int
    }

instance Show Choc where 
    show (Choc state choctype size) = state ++ " " ++ choctype ++ " chocolate with size " ++ (show size)

mkChoc :: String -> String -> Int -> Choc
mkChoc state choctype size = Choc state choctype size

fabric :: Choc -> [Choc]
fabric meltedChoc = (wrapper.filterPieces.cutter.cooler) meltedChoc

cooler :: Choc -> Choc
cooler (Choc _ choctype size) = mkChoc "solid" choctype size

cutter :: Choc -> [Choc]
cutter (Choc state choctype size) = cutter' state choctype size []

cutter' :: String -> String -> Int -> [Choc] -> [Choc]
cutter' state choctype size result 
    | size < 6 = (mkChoc state choctype size):result 
    | otherwise = cutter' state choctype (size-6) ((mkChoc state choctype 6):result)

wrapper :: [Choc] -> [Choc]
wrapper chocList = map (\(Choc _ choctype size) -> mkChoc "Wrapped" choctype size) chocList

above5mm :: Choc -> Bool
above5mm choc = (size choc) > 5

filterPieces :: [Choc] -> [Choc]
filterPieces choclatePieces = filter above5mm choclatePieces