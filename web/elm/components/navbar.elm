module Components.Navbar exposing (..)

import Html exposing (Html, nav, ul, li, text, div, input)
import Html.Attributes exposing (class, placeholder)
import Html.Events exposing (onClick)


-- Actions


type Msg
    = NowPlaying
    | ComingSoon
    | ShowFriends



-- Model


type alias Model =
    String



-- Update


update : Msg -> Model -> Model
update msg model =
    case msg of
        NowPlaying ->
            "Now Playing"

        ComingSoon ->
            "Coming Soon"

        ShowFriends ->
            "Friends"



-- View


view : Model -> Html Msg
view navbar =
    nav [ class "navbar container-fluid" ]
        [ ul [ class "menu-items" ]
            [ li [ class (isActive navbar "Now Playing"), onClick NowPlaying ] [ text "Now Playing" ]
            , li [ class (isActive navbar "Coming Soon"), onClick ComingSoon ] [ text "Coming Soon" ]
            , li [ class (isActive navbar "Friends"), onClick ShowFriends ] [ text "Friends" ]
            ]
        ]


isActive : Model -> String -> String
isActive activeTab tabName =
    if activeTab == tabName then
        "active"
    else
        "inactive"
