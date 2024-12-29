module Frontend.HTTP where

import Reflex.Dom
import Data.Aeson (encode)

postSignUp :: SignUpData -> IO ()
postSignUp data = do
    -- Use a library like `http-client` to send a POST request
    -- Example: httpLBS (backendURL <> "/signup") (encode data)
    return ()
