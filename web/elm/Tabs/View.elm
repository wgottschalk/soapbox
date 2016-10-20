module Tabs.View exposing (..)

import Html exposing (Html, div, text)


-- import Html.Attributes exposing (style)

import Model exposing (Model, Msg)


view : Model -> List (Html Msg)
view model =
    [ div [] [ text "Now Playing" ]
    , div [] [ text "Upcoming" ]
    , div [] [ text "Friends" ]
    ]
