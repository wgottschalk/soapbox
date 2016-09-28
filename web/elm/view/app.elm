module View.App exposing (..)

import Html exposing (Html, div, ul, li)
import Html.Attributes exposing (class)
import View.Navbar as Navbar
import View.Movie as Movie
import Types exposing (Msg)
import Model exposing (Model)


view : Model -> Html Msg
view model =
    let
        movies =
            List.indexedMap (\key feedItem -> li [] [ Movie.view feedItem key ]) model.feed
    in
        div []
            [ Navbar.view model.navbar
            , ul [ class "feed container" ] movies
            ]
