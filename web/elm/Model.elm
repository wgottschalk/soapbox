module Model exposing (..)


type alias Model =
    { navbar : String
    , feed : List Movie
    }


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
