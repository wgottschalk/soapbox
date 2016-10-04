module Movie.Decoders exposing (..)

import Movie.Movie exposing (Movie, initMovie)
import Json.Decode exposing (Decoder, (:=), string, object4, object3, list, int, oneOf)


movieListDecoder : Decoder (List Movie)
movieListDecoder =
    "movies"
        := list movieObjects


movieObjects : Decoder Movie
movieObjects =
    object4 initMovie
        ("title" := string)
        ("summary" := string)
        ("release_date" := string)
        ("img_url" := string)
