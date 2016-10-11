module Types exposing (..)

import Http exposing (Error, Data)
import Movie.Model exposing (Movie)


type alias Id =
    Int


type Msg
    = ChangeTab String
    | Success (List Movie)
    | Failed Error
    | NowPlaying
    | ComingSoon
    | ShowFriends
    | OpenCard Id
    | CloseCard Id
