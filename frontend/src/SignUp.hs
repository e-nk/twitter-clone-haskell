module Frontend.SignUp where

import Reflex.Dom

signUpForm :: MonadWidget t m => m ()
signUpForm = do
    el "h2" $ text "Sign Up"
    username <- inputElement def
    email <- inputElement def
    password <- inputElement $ def & inputElementConfig_elementConfig . elementConfig_initialAttributes .~ ("type" =: "password")
    submitButton <- button "Sign Up"

    -- Send data to backend
    let signUpData = liftA3 SignUpData (value username) (value email) (value password)
    performEvent_ $ ffor (tag (current signUpData) (domEvent Click submitButton)) $ \data -> do
        liftIO $ postSignUp data
    return ()
