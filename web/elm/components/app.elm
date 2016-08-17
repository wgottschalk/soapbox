module Components.App exposing (Model, Msg, init, view, update)

import Html exposing (Html, nav, ul, li, text, div)
import Html.App as App
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)
import Components.Feed as Feed
import Components.Navbar as Navbar
import Components.Movie as Movie


type Msg
    = ChangeTab Navbar.Msg


type alias Model =
    { navbar : Navbar.Model
    , feed : Feed.Model
    }


init : ( Model, Cmd Msg )
init =
    Model "Now Playing" [ Feed.Movie <| Movie.Model "The Title!" "this is a summary" "none" "July 10" ] ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeTab tabName ->
            let
                newTab =
                    Navbar.update tabName model.navbar
            in
                (Model newTab <| List.repeat 5 <| Feed.Movie <| Movie.Model newTab "this is a summary" "none" "July 10") ! []


view : Model -> Html Msg
view model =
    div []
        [ Navbar.view model.navbar |> App.map ChangeTab
        , Feed.view model.feed
        ]
