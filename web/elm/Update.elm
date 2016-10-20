module Update exposing (..)

import Model exposing (..)
import Material
import Commands.Request exposing (fetchMovies)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mdl msg' ->
            Material.update msg' model

        SelectTab tab ->
            ( { model | selectedTab = tab }
            , fetchMovies tab
            )

        Success movieList ->
            { model | movies = movieList } ! []

        Failed error ->
            model ! []

        OpenCard id ->
            { model | openedCard = id, isOpen = True } ! []

        CloseCard ->
            { model | isOpen = False } ! []

        NoOp ->
            model ! []
