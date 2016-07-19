module Main exposing (..)

import Html.App as App
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type Msg
    = NowPlaying
    | ComingSoon
    | ShowFriends


type alias Card =
    { title : String
    , description : String
    , imgUrl : String
    }


type alias Model =
    { cards : List Card }


init : ( Model, Cmd a )
init =
    ( Model
        [ Card "Movie 1" "description One" "https://image.tmdb.org/t/p/w300_and_h450_bestv2/6FxOPJ9Ysilpq0IgkrMJ7PubFhq.jpg"
        , Card "Movie 2" "description Two" ""
        ]
    , Cmd.none
    )



-- update


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        NowPlaying ->
            ( model, Cmd.none )

        ComingSoon ->
            ( model, Cmd.none )

        ShowFriends ->
            ( model, Cmd.none )



-- view


navbar : Html Msg
navbar =
    div [ class "navbar" ]
        [ ul [ class "menu-items" ]
            [ li [ onClick NowPlaying ] [ text "Now Playing" ]
            , li [ onClick ComingSoon ] [ text "Coming Soon" ]
            , li [ onClick ShowFriends ] [ text "Friends" ]
            ]
        ]


card : Card -> Html a
card cardInfo =
    div [ class "card" ]
        [ img [ height 277, width 185, src cardInfo.imgUrl ] []
        , h4 [] [ text cardInfo.title ]
        , br [] []
        , p [] [ text cardInfo.description ]
        ]


view : Model -> Html Msg
view model =
    let
        cards =
            List.map (\cardData -> card cardData) model.cards
    in
        div []
            [ navbar
            , ul [] (cards)
            ]



-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never
main =
    App.program
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }
