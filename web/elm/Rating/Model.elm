module Rating.Model exposing (..)


type alias Rating =
    { isOpen : Bool
    }


init : Rating
init =
    Rating False
