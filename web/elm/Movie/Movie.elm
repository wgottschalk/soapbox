module Movie.Movie exposing (Movie, initMovie, view)

import Html exposing (Html, div, h2, p, hr, img, text, span)
import Html.Attributes exposing (class, src, style)


-- import Html.Events exposing (onClick)


type alias Movie =
    { title : String
    , summary : String
    , releaseDate : String
    , imgUrl : String
    , expanded : Bool
    }


initMovie : String -> String -> String -> String -> Movie
initMovie title summary release imgUrl =
    Movie
        title
        summary
        release
        imgUrl
        False



-- view


view : Movie -> Int -> Html a
view model key =
    div [ class "card" ]
        [ div [ class "placeholder" ] []
        , div []
            [ img [ src model.imgUrl ] []
            , div [ class "card-overlay" ]
                [ h2 [] [ text model.title ]
                , span [] [ text model.releaseDate ]
                , p [ class "description" ] [ text model.summary ]
                ]
            ]
        ]
