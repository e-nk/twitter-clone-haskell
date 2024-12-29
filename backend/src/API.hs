module API where

import Servant
import Auth

type API = "signup" :> ReqBody '[JSON] SignUpData :> Post '[JSON] NoContent

server :: Server API
server = signUpHandler

signUpHandler :: SignUpData -> Handler NoContent
signUpHandler data = liftIO (signUp data) >> return NoContent
