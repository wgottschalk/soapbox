module Commands.Request exposing (..)

import Types exposing (Msg(..))
import Http exposing (Error, Data)
import Task exposing (Task)
import Movie.Model exposing (Movie)
import Movie.Decoders exposing (movieListDecoder)


fetchMovies : String -> Cmd Msg
fetchMovies tabName =
    case tabName of
        "Now Playing" ->
            getFeedItems "now_playing"
                |> Task.perform Failed Success

        "Coming Soon" ->
            getFeedItems "coming_soon"
                |> Task.perform Failed Success

        _ ->
            Cmd.none


getFeedItems : String -> Task Error (List Movie)
getFeedItems url =
    Http.get movieListDecoder ("http://localhost:4000/api/" ++ url)
