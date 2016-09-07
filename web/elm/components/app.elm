module Components.App exposing (Model, Msg(..), init, view, update)

import Html exposing (Html, nav, ul, li, text, div)
import Html.App as App
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)
import Components.Feed as Feed
import Components.Navbar as Navbar
import Components.Movie as Movie
import Components.Friend as Friend
import Task exposing (Task)
import Http exposing (Error, Data)
import Json.Decode exposing (Decoder, (:=), string, object4, object3, list, int, oneOf)


type Msg
    = ChangeTab Navbar.Msg
    | Success (List Feed.Card)
    | Failed Error


type alias Model =
    { navbar : Navbar.Model
    , feed : Feed.Model
    }


init : ( Model, Cmd Msg )
init =
    Model "Now Playing" [] ! [ fetchMovies "Now Playing" ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeTab tabName ->
            let
                newTab =
                    Navbar.update tabName model.navbar
            in
                ( { model | navbar = newTab }, fetchMovies newTab )

        Success movieList ->
            { model | feed = movieList } ! []

        Failed error ->
            model ! []


fetchMovies : String -> Cmd Msg
fetchMovies tabName =
    case tabName of
        "Now Playing" ->
            getFeedItems "now_playing"
                |> Task.perform Failed Success

        "Coming Soon" ->
            getFeedItems "coming_soon"
                |> Task.perform Failed Success

        _ ->
            Cmd.none


getFeedItems : String -> Task Error (List Feed.Card)
getFeedItems url =
    Http.get movieListDecoder ("http://localhost:4000/api/" ++ url)


movieListDecoder : Decoder (List Feed.Card)
movieListDecoder =
    "movies"
        := list (oneOf [ movieObjects, friendObjects ])


movieObjects : Decoder Feed.Card
movieObjects =
    object4 (\a b c d -> Feed.Movie (Movie.init a b c d))
        ("title" := string)
        ("summary" := string)
        ("release_date" := string)
        ("img_url" := string)


friendObjects : Decoder Feed.Card
friendObjects =
    object3 (\a b c -> Feed.Friend (Friend.Model a b c))
        ("username" := string)
        ("age" := int)
        ("profile" := string)


view : Model -> Html Msg
view model =
    div []
        [ Navbar.view model.navbar |> App.map ChangeTab
        , Feed.view model.feed
        ]
