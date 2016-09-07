module Main exposing (main)

import Html.App as App
import Components.App exposing (Msg, Model, init, view, update)
import AnimationFrame


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
