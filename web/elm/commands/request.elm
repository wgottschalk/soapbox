module Commands.Request exposing (..)

import Http exposing (Error, Data)
import Task exposing (Task)
import Movie.Decoders exposing (movieListDecoder)
import Movie.Model exposing (Movie)
import Model exposing (Msg(Failed, Success))


fetchMovies : Int -> Cmd Msg
fetchMovies tabId =
    case tabId of
        0 ->
            getFeedItems "now_playing"
                |> Task.perform Failed Success

        1 ->
            getFeedItems "coming_soon"
                |> Task.perform Failed Success

        _ ->
            Cmd.none


getFeedItems : String -> Task Error (List Movie)
getFeedItems url =
    Http.get movieListDecoder ("http://localhost:4000/api/" ++ url)
