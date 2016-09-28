module Main exposing (main)

import Html.App as App
import Model exposing (Model)
import Update exposing (update)
import View.App exposing (view)
import Types exposing (Msg(..))
import Commands.Request exposing (fetchMovies)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : ( Model, Cmd Msg )
init =
    Model "Now Playing" [] ! [ fetchMovies "Now Playing" ]


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
