port module Main exposing (..)

import Html.App as App
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Task
import Json.Decode exposing (..)


-- types


type Msg
    = NowPlaying
    | ComingSoon
    | ShowFriends
    | FetchSucceed (List Movie)
    | FetchFail Http.Error
    | Date String
    | Convert


type alias Url =
    String


type alias Movie =
    { title : String
    , summary : String
    , img_url : String
    , release_date : String
    }


type alias Model =
    { movies : List Movie }



-- model


init : ( Model, Cmd Msg )
init =
    ( Model []
    , fetch "/api/now_playing"
    )



-- update


port dateString : String -> Cmd msg


fetch : Url -> Cmd Msg
fetch resource =
    let
        url =
            "http://localhost:4000" ++ resource
    in
        Task.perform FetchFail FetchSucceed (Http.get decoder url)


decoder : Decoder (List Movie)
decoder =
    "movies" := (Json.Decode.list <| movieDecoder)


movieDecoder : Decoder Movie
movieDecoder =
    object4 Movie
        ("title" := string)
        ("summary" := string)
        ("img_url" := string)
        ("release_date" := string)


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        NowPlaying ->
            ( model, fetch "/api/now_playing" )

        ComingSoon ->
            ( model, fetch "/api/coming_soon" )

        ShowFriends ->
            ( model, fetch "/api/friends" )

        FetchSucceed data ->
            ( Model data, Cmd.none )

        FetchFail _ ->
            ( model, Cmd.none )

        Convert ->
            ( model, Cmd.none )

        Date date ->
            let
                movies =
                    List.map
                        (\movie ->
                            { movie | release_date = date }
                        )
                        model.movies
            in
                ( { model | movies = movies }, Cmd.none )



-- view


navbar : Html Msg
navbar =
    nav [ class "navbar container-fluid" ]
        [ ul [ class "menu-items" ]
            [ li [ onClick NowPlaying, class "col-xs-4" ] [ text "Now Playing" ]
            , li [ onClick ComingSoon, class "col-xs-4" ] [ text "Coming Soon" ]
            , li [ onClick ShowFriends, class "col-xs-4" ] [ text "Friends" ]
            ]
        ]


createCard : Movie -> Html a
createCard cardInfo =
    div [ class "card" ]
        [ img [ width 160, src cardInfo.img_url ] []
        , h2 [] [ text cardInfo.title ]
        , p [] [ text cardInfo.release_date ]
        , p [] [ text cardInfo.summary ]
        ]


view : Model -> Html Msg
view model =
    let
        movies =
            List.map (\cardData -> createCard cardData) model.movies
    in
        div []
            [ navbar
            , ul [] (movies)
            ]



-- subscriptions


port moment : (String -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    moment Date


main : Program Never
main =
    App.program
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }
