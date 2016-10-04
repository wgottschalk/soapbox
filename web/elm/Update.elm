module Update exposing (..)

import Types exposing (..)
import Model exposing (Model)
import Commands.Request exposing (fetchMovies)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NowPlaying ->
            model ! [ fetchMovies "Now Playing" ]

        ComingSoon ->
            model ! [ fetchMovies "Coming Soon" ]

        -- ShowFriends will be implemented later
        ShowFriends ->
            model ! []

        ChangeTab tabName ->
            { model | navbar = tabName } ! []

        Success movieList ->
            { model | feed = movieList } ! []

        Failed error ->
            model ! []
