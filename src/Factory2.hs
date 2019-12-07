module Factory2
    ( run
    ) where


{-|
    Programm entry point
-}
run :: IO ()
run = do
    let meltedChoc = mkChoc "melted" "dark"
    let wrappedDark = fabric meltedChoc

    print ("Factory V3: Converting some delicious " ++ (show meltedChoc) ++ " to: " ++ (show wrappedDark))
    
data Choc = Choc 
    { state :: String -- melted, solid, piece, wrapped
    , choctype :: String -- dark, milk
    }

instance Show Choc where 
    show (Choc state choctype) = state ++ " " ++ choctype ++ " chocolate"

mkChoc :: String -> String -> Choc
mkChoc state choctype = Choc state choctype

fabric :: Choc -> Choc
fabric meltedChoc = (wrapper.cutter.mintMixer.cooler) meltedChoc

cooler :: Choc -> Choc
cooler (Choc _ choctype) = mkChoc "solid" choctype

cutter :: Choc -> Choc
cutter (Choc _ choctype) = mkChoc "piece" choctype

wrapper :: Choc -> Choc
wrapper (Choc _ choctype) = mkChoc "wrapped" choctype

mixer :: String -> Choc -> Choc
mixer flavour (Choc state choctype) = mkChoc state (choctype ++ flavour)

mintMixer :: Choc -> Choc
mintMixer choc = (mixer "Mint") choc