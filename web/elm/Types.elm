module Types exposing (..)

import Http exposing (Error, Data)
import Model exposing (Movie)
import Animation


type Msg
    = ChangeTab String
    | Success (List Movie)
    | Failed Error
    | NowPlaying
    | ComingSoon
    | ShowFriends
