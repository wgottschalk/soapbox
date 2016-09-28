module View.Navbar exposing (..)

import Html exposing (Html, nav, ul, li, text, div, input)
import Html.Attributes exposing (class, placeholder)
import Html.Events exposing (onClick)
import Types exposing (Msg(..))


-- View


view : String -> Html Msg
view navbar =
    nav [ class "navbar" ]
        [ ul [ class "menu-items row" ]
            [ li [ class ("col-4 " ++ (isActive navbar "Now Playing")), onClick NowPlaying ] [ text "Now Playing" ]
            , li [ class ("col-4 " ++ (isActive navbar "Coming Soon")), onClick ComingSoon ] [ text "Coming Soon" ]
            , li [ class ("col-4 " ++ (isActive navbar "Friends")), onClick ShowFriends ] [ text "Friends" ]
            ]
        ]


isActive : String -> String -> String
isActive activeTab tabName =
    if activeTab == tabName then
        "active"
    else
        "inactive"
