module Movie.Model exposing (..)


type alias Movie =
    { title : String
    , summary : String
    , releaseDate : String
    , imgUrl : String
    }


initMovie : String -> String -> String -> String -> Movie
initMovie title summary release imgUrl =
    Movie
        title
        summary
        release
        imgUrl


update : Movie -> Movie
update model =
    model
