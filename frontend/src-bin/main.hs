module Main where

import Frontend -- This imports your frontend code
import Obelisk.Frontend -- Obelisk's frontend entry point
import Obelisk.Route -- For routing

-- Entry point for the frontend
main :: IO ()
main = runFrontend frontend
