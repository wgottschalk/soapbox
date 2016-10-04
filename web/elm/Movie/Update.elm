module Movie.Update exposing (..)

import Movie.Model exposing (Movie)
import Types exposing (Id, Direction(..), Msg)


update : Direction -> Id -> Id -> Movie -> Movie
update direction target id movie =
    if id == target then
        case direction of
            Up ->
                { movie | expanded = True }

            Down ->
                { movie | expanded = False }
    else
        movie
