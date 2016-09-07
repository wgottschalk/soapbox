module Components.Movie exposing (..)

import Html exposing (Html, div, h2, p, hr, img, text, span)
import Html.App as App
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, src)
import Style
import Style.Properties exposing (..)


-- Model


type alias Model =
    { title : String
    , summary : String
    , releaseDate : String
    , imgUrl : String
    , style : Style.Animation
    }


type Msg
    = Msg



-- init


init : String -> String -> String -> String -> Model
init title summary releaseDate imgUrl =
    let
        style =
            Style.init
                [ Opacity 0.0
                , Width 100.0 Px
                , Height 281.0 Px
                ]
    in
        Model title summary releaseDate imgUrl style



-- update


update : Msg -> Model -> Model
update msg model =
    model



-- view


view : Model -> Html a
view model =
    div [ class "card" ]
        [ img [ src model.imgUrl ] []
        , div [ class "card-overlay" ]
            [ h2 [] [ text model.title ]
            , span [] [ text model.releaseDate ]
            , p [ class "description" ] [ text model.summary ]
            ]
        ]
