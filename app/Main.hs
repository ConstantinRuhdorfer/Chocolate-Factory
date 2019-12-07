module Main where

import System.IO
import System.Environment

import qualified Factory1
import qualified Factory2
import qualified Factory3

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] ->    print "Please give atleast one command line argument like: [all|factory[1|2|3]]"
        [arg] -> handleArg arg 
        _ ->     error "too many arguments just 1 supported."

{-|
  The 'handleArg' function gets a arg and does something with it.
-}
handleArg :: String -> IO ()
handleArg arg = do
    case arg of
        "factory1" -> Factory1.run
        "factory2" -> Factory2.run
        "factory3" -> Factory3.run
        "all"      -> do
            Factory1.run
            Factory2.run
            Factory3.run
        _          -> print "Not supported try [all|factory[1|2|3]]"