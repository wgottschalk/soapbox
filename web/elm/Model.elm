module Model exposing (..)

import Movie.Model exposing (Movie)


type alias Model =
    { navbar : String
    , feed : List Movie
    }
