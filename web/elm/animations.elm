module Animations exposing (..)

import Style exposing (animate, to)
import Style.Properties exposing (..)


expandDownOut : PreAction
expandDownOut =
    animate
        |> to
            [ Width 100 Percent
            , Height 100 Percent
            ]
