module Components.Friend exposing (Model, view, update)

import Html exposing (Html, div, h2, p, hr, img, text)
import Html.App as App
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, src)


-- Model


type alias Model =
    { username : String
    , age : Int
    , profile_url : String
    }



-- view


type Msg
    = Msg



-- update


update : Msg -> Model -> Model
update msg model =
    model


view : Model -> Html a
view { username, age, profile_url } =
    div [ class "card" ]
        [ h2 [] [ text username ]
        , img [ src profile_url ] []
        , hr [] []
        , p [] [ text (toString age) ]
        ]
