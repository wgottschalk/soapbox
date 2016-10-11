module Movie.Update exposing (..)

import Movie.Model exposing (Movie)
import Types exposing (Msg, Id)


update : Movie -> Movie
update model =
    model
