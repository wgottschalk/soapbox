module Movie.Model exposing (..)


type alias Movie =
    { title : String
    , summary : String
    , releaseDate : String
    , imgUrl : String
    , expanded : Bool
    }


initMovie : String -> String -> String -> String -> Movie
initMovie title summary release imgUrl =
    Movie
        title
        summary
        release
        imgUrl
        False
