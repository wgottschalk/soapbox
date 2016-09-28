module CardAnimations exposing (..)

import Animation.Model exposing (Animation)
import Animation exposing (style, left, opacity, px)


closedParentStyle : Animation
closedParentStyle =
    style [ left (px 0.0) ]


closedOverlayStyle : Animation
closedOverlayStyle =
    style [ opacity 0 ]
