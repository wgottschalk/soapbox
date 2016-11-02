module View exposing (..)

import Model exposing (Model, Msg(Mdl, SelectTab))
import Material.Layout as Layout
import Material.Scheme
import Material.Color as Color
import Html exposing (Html, h1, text, div)
import Html.Attributes exposing (class)
import Movie.Model exposing (Movie)
import Movie.View as Movie


-- import Html.Attributes exposing (style)

import Tabs.View as Tabs


view : Model -> Html Msg
view model =
    div [ class "app-view" ]
        [ div
            [ class <|
                if model.isOpen then
                    "wrapper open"
                else
                    "wrapper"
            ]
            [ Material.Scheme.topWithScheme Color.BlueGrey Color.Blue <|
                Layout.render Mdl
                    model.mdl
                    [ Layout.fixedHeader
                    , Layout.fixedTabs
                    , Layout.selectedTab model.selectedTab
                    , Layout.onSelectTab SelectTab
                    ]
                    { header = []
                    , drawer = []
                    , tabs = ( Tabs.view model, [] )
                    , main = [ div [ class "container" ] (renderMovies model.movies) ]
                    }
            , Movie.renderDetails model <|
                getActiveMovie model.openedCard 0 model.movies
            ]
        ]


renderMovies : List Movie -> List (Html Msg)
renderMovies movies =
    List.indexedMap Movie.renderCard movies


getActiveMovie : Int -> Int -> List Movie -> Maybe Movie
getActiveMovie activeId currentIdx movieList =
    case movieList of
        [] ->
            Nothing

        first :: [] ->
            Just first

        first :: rest ->
            if activeId == currentIdx then
                Just first
            else
                getActiveMovie activeId (currentIdx + 1) rest
