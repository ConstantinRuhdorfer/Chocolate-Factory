module Factory1 
    ( run
    ) where

{-|
    Programm entry point
-}
run :: IO ()
run = do
    let meltedChoc = mkChoc "melted" "dark"
    let wrappedDark = fabric meltedChoc

    print ("Factory V1: Converting some delicious " ++ (show meltedChoc) ++ " to: " ++ (show wrappedDark))
    
data Choc = Choc 
    { state :: String -- melted, solid, piece, wrapped
    , choctype :: String -- dark, milk
    }

instance Show Choc where 
    show (Choc state choctype) = state ++ " " ++ choctype ++ " chocolate"

mkChoc :: String -> String -> Choc
mkChoc state choctype = Choc state choctype

fabric :: Choc -> Choc
fabric meltedChoc = (wrapper.cutter.cooler) meltedChoc

cooler :: Choc -> Choc
cooler (Choc _ choctype) = mkChoc "solid" choctype

cutter :: Choc -> Choc
cutter (Choc _ choctype) = mkChoc "piece" choctype

wrapper :: Choc -> Choc
wrapper (Choc _ choctype) = mkChoc "wrapped" choctype