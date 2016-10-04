module Model exposing (..)

import Movie.Movie exposing (Movie)


type alias Model =
    { navbar : String
    , feed : List Movie
    }
