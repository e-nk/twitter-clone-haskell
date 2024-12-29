module Auth where

import Database.SQLite.Simple
import Crypto.KDF.BCrypt (hashPassword)
import Data.Text (Text)
import Data.Aeson (ToJSON, FromJSON)
import GHC.Generics (Generic)

data SignUpData = SignUpData
    { username :: Text
    , email :: Text
    , password :: Text
    } deriving (Generic, Show)

instance ToJSON SignUpData
instance FromJSON SignUpData

signUp :: SignUpData -> IO ()
signUp (SignUpData username email password) = do
    hashed <- hashPassword (encodeUtf8 password)
    conn <- open "twitter-clone.db"
    execute conn "INSERT INTO users (username, email, password_hash) VALUES (?, ?, ?)" (username, email, hashed)
    close conn
