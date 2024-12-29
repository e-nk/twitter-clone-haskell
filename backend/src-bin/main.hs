module Main where

import Obelisk.Backend -- Handles Obelisk backend setup
import API (server, API) -- Import your custom API and server
import Network.Wai.Handler.Warp (run) -- For running the backend server
import Servant (serve, Proxy(..)) -- Servant library for APIs
import Database (setupDatabase) -- Database initialization function

-- Entry point for the backend
main :: IO ()
main = do
    putStrLn "Setting up database..."
    setupDatabase
    putStrLn "Starting backend server on port 8080..."
    -- Use Obelisk's runBackend to combine frontend and backend
    runBackend (\_ -> run 8080 (serve (Proxy :: Proxy API) server)) frontend
