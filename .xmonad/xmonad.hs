import XMonad
import XMonad.Util.EZConfig

main = do
  xmonad $ defaultConfig
    { modMask            = modMask'
    , terminal           = terminal'
    , borderWidth        = borderWidth'
    }
    `additionalKeysP`
    [ ("M-x f", spawn "firefox")
    , ("M-x e", spawn "emacs")
    ]

-- Use Super or Win key instead of Alt key in keybindings
modMask'  = mod4Mask
terminal' = "urxvt"

-- Aesthetics
borderWidth'        = 0
normalBorderColor'  = "#222222"
focusedBorderColor' = "#ff0000"
