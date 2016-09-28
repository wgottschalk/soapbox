module View.Movie exposing (..)

import Html exposing (Html, div, h2, p, hr, img, text, span)
import Html.Attributes exposing (class, src, style)
import Html.Events exposing (onClick)
import Model exposing (Movie)
import Types exposing (..)


-- view


view : Movie -> Int -> Html Msg
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
