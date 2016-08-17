module Components.Movie exposing (..)

import Html exposing (Html, div, h2, p, hr, img, text)
import Html.App as App
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, src)


-- Model


type alias Model =
    { title : String
    , summary : String
    , img_url : String
    , release_date : String
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
    div [ class "movie" ]
        [ h2 [] [ text title ]
        , p [] [ text release_date ]
        , hr [] []
        , img [ src img_url ] []
        , p [] [ text summary ]
        ]
