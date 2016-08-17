module Components.Feed exposing (..)

import Html exposing (Html, nav, ul, div, li, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)
import Components.Movie as Movie
import Components.Friend as Friend


type alias Model =
    List Card


type Card
    = Movie Movie.Model
    | Friend Friend.Model


view : Model -> Html a
view feed =
    div [ class "feed container" ] <| renderItems feed


renderItems : Model -> List (Html a)
renderItems feed =
    List.map movieOrFriend feed


movieOrFriend : Card -> Html a
movieOrFriend card =
    case card of
        Movie movieModel ->
            Movie.view movieModel

        Friend friendModel ->
            Friend.view friendModel
