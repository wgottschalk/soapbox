module Main exposing (..)

import Html.App as App
import Html exposing (..)
import Html.Attributes exposing (..)


-- model


type alias Model =
    String


model : Model
model =
    "Hello"


initialModel : Maybe Int -> String
initialModel num =
    toString num



-- update


update : msg -> Model -> Model
update message model =
    model



-- view


view : Model -> Html.Html a
view model =
    let
        number =
            model
    in
        div
            []
            [ text number
            , div
                []
                [ img
                    [ src "http://i.imgur.com/R4bHgxi.jpg" ]
                    []
                ]
            ]


main : Program Never
main =
    App.beginnerProgram
        { view = view
        , model = model
        , update = update
        }
