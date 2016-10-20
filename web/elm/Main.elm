module Main exposing (main)

import Html.App as App
import Model exposing (Model, Msg, init)
import Update exposing (update)
import View exposing (view)
import Commands.Request exposing (fetchMovies)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : ( Model, Cmd Msg )
init =
    Model.init ! [ fetchMovies 0 ]


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
