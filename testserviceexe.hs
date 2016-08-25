
module Main where

import Transient.Base
import Transient.Internals((!>))
import Transient.Move
import Transient.Indeterminism
import Transient.Move.Utils
import Transient.Logged
import Transient.Move.Services
import Control.Applicative
import Control.Monad
import Data.Typeable
import Data.IORef
import Control.Concurrent (threadDelay)
import Control.Monad.IO.Class




main= do
    print "TESTSERVICE is running"
    keep' $ runCloud  $
      runService ("https://github.com/agocorona/testService","testserviceexe") serviceImplementation


serviceImplementation :: (String,String) -> Cloud String
serviceImplementation (x,y)=   do
      lliftIO $ print x  !> "SERVICEIMPLEMENtAtiON"
--      r <- local $ threads 1 . choose $ repeat y
--      localIO $ threadDelay 1000000
      return y







