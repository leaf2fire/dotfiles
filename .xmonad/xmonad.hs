import XMonad

main = do
  xmonad $ defaultConfig
    { modMask            = modMask'
    , terminal           = terminal'
    , borderWidth        = borderWidth'
    , normalBorderColor  = normalBorderColor'
    , focusedBorderColor = focusedBorderColor' }

-- Use Super or Win key instead of Alt key in keybindings
modMask'  = mod4Mask
terminal' = "urxvt"

-- Aesthetics
borderWidth'        = 0
normalBorderColor'  = "#222222"
focusedBorderColor' = "#ff0000"