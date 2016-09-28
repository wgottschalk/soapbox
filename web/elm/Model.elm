module Model exposing (..)

import Animation exposing (State, left, opacity, px)
import CardAnimations exposing (closedParentStyle, closedOverlayStyle)


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
    , style : CardStyle
    }


type alias CardStyle =
    { parentStyle : State
    , overlayStyle : State
    }


initMovie : String -> String -> String -> String -> Movie
initMovie title summary release imgUrl =
    Movie
        title
        summary
        release
        imgUrl
        False
        initMovieStyles


initMovieStyles : CardStyle
initMovieStyles =
    { parentStyle = closedParentStyle
    , overlayStyle = closedOverlayStyle
    }
