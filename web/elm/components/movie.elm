module Components.Movie exposing (..)

import Html exposing (Html, div, h2, p, hr, img, text, span)
import Html.App as App
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, src)


-- Model


type alias Model =
    { title : String
    , summary : String
    , release_date : String
    , img_url : String
    }


type alias Friend =
    { username : String
    , age : Int
    , profile_url : String
    }


type Msg
    = Msg



-- update


update : Msg -> Model -> Model
update msg model =
    model



-- view


view : Model -> Html a
view { title, summary, img_url, release_date } =
    div [ class "card" ]
        [ div []
            [ h2 [] [ text title ]
            , span [] [ text ("Release Date: " ++ release_date) ]
            ]
        , img [ src img_url ] []
        , p [ class "description" ] [ text summary ]
        ]
