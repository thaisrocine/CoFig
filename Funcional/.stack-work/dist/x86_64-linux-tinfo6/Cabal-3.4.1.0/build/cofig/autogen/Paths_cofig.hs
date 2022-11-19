{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_cofig (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/paulo/projeto-plp/CoFig/Funcional/.stack-work/install/x86_64-linux-tinfo6/d7bd698c8728b58f131ee1f5b236fd5fc67a055f09f01a9db21ee7e1e0b296e5/9.0.2/bin"
libdir     = "/home/paulo/projeto-plp/CoFig/Funcional/.stack-work/install/x86_64-linux-tinfo6/d7bd698c8728b58f131ee1f5b236fd5fc67a055f09f01a9db21ee7e1e0b296e5/9.0.2/lib/x86_64-linux-ghc-9.0.2/cofig-0.1.0.0-BqmdS029E2dJycRaMfY610-cofig"
dynlibdir  = "/home/paulo/projeto-plp/CoFig/Funcional/.stack-work/install/x86_64-linux-tinfo6/d7bd698c8728b58f131ee1f5b236fd5fc67a055f09f01a9db21ee7e1e0b296e5/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/paulo/projeto-plp/CoFig/Funcional/.stack-work/install/x86_64-linux-tinfo6/d7bd698c8728b58f131ee1f5b236fd5fc67a055f09f01a9db21ee7e1e0b296e5/9.0.2/share/x86_64-linux-ghc-9.0.2/cofig-0.1.0.0"
libexecdir = "/home/paulo/projeto-plp/CoFig/Funcional/.stack-work/install/x86_64-linux-tinfo6/d7bd698c8728b58f131ee1f5b236fd5fc67a055f09f01a9db21ee7e1e0b296e5/9.0.2/libexec/x86_64-linux-ghc-9.0.2/cofig-0.1.0.0"
sysconfdir = "/home/paulo/projeto-plp/CoFig/Funcional/.stack-work/install/x86_64-linux-tinfo6/d7bd698c8728b58f131ee1f5b236fd5fc67a055f09f01a9db21ee7e1e0b296e5/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cofig_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cofig_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "cofig_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "cofig_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cofig_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cofig_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
