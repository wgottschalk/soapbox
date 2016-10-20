module Model exposing (..)

import Material
import Movie.Model exposing (Movie)
import Http exposing (Error)


type Msg
    = Mdl (Material.Msg Msg)
    | SelectTab Int
    | Success (List Movie)
    | Failed Error
    | NoOp
    | CloseCard
    | OpenCard Int


type alias Model =
    { mdl : Material.Model
    , selectedTab : Int
    , movies : List Movie
    , openedCard : Int
    , isOpen : Bool
    }


init : Model
init =
    Model
        Material.model
        0
        []
        0
        False
