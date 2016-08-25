
module Main where

import Transient.Base
--import Transient.Internals((!>))
import Transient.Move
import Transient.Move.Utils
import Transient.Logged
import Transient.Move.Services
import Control.Applicative
import Control.Monad
import Data.Typeable
import Data.IORef
import Control.Concurrent (threadDelay)
import Control.Monad.IO.Class

import TestService

main= keep $ runCloud $ do

      runTestNodes [2001]
      local $ option "s" "start"

      r <- clientStub' "hello" "world"
      lliftIO $ print (r :: String)
      r <- clientStub "aaaa" "bbbb"
      lliftIO $ print ( r :: String)


clientStub' param1 param2= do
--      serviceNode <- onAll $ liftIO $ createNodeServ "localhost" 3001 []
      callService  ""  ("https://github.com/agocorona/testService","testserviceexe")
            (param1, param2)





