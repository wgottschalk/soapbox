module Types exposing (..)

import Http exposing (Error, Data)
import Movie.Movie as Movie exposing (Movie)


type Msg
    = ChangeTab String
    | Success (List Movie)
    | Failed Error
    | NowPlaying
    | ComingSoon
    | ShowFriends
