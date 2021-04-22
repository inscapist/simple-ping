{-# LANGUAGE OverloadedStrings #-}

import           Network.HTTP.Types        (status200)
import           Network.HTTP.Types.Header (hContentType)
import           Network.Wai               (Application, responseLBS)
import           Network.Wai.Handler.Warp  (run)

main :: IO ()
main = do
    let port = 3000
    putStrLn $ "Listening on port " ++ show port
    run port app

app :: Application
app _ f =
    f $ responseLBS status200 [(hContentType, "text/plain")] "OK"
