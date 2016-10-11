module Movie.View exposing (..)

import Html exposing (Html, Attribute, div, h2, p, hr, img, text, span, button, i, h4)
import Html.Attributes exposing (class, src, style)
import Html.Events exposing (onClick)
import Movie.Model exposing (Movie)
import Types exposing (Msg(OpenCard, CloseCard))


view : Movie -> Int -> Html Msg
view { title, summary, releaseDate, imgUrl, expanded } key =
    div [ class "card", onClick (OpenCard key) ]
        [ div [ class "placeholder" ] []
        , div [ cardStyles expanded, class "card-content" ]
            [ img [ src imgUrl ] []
            , div [ (overlayStyles expanded), class "card-overlay" ]
                [ div [ class "back-button", onClick (CloseCard key) ]
                    [ i [ class "material-icons" ] [ text "clear" ]
                    ]
                , h2 [] [ text title ]
                , h4 [] [ text releaseDate ]
                , p [ class "description" ] [ text summary ]
                , div [ class "button-container" ]
                    [ button [ class "review-button material-icons" ] [ text "insert_comment" ]
                    ]
                ]
            ]
        ]


overlayStyles : Bool -> Attribute a
overlayStyles expanded =
    if expanded then
        style [ ( "opacity", "1" ) ]
    else
        style []


cardStyles : Bool -> Attribute a
cardStyles expanded =
    if expanded then
        style
            [ ( "position", "fixed" )
            , ( "width", "100%" )
            , ( "height", "100%" )
            , ( "top", "0" )
            , ( "left", "0" )
            , ( "z-index", "5" )
            ]
    else
        style
            [ ( "position", "relative" )
            , ( "width", "100%" )
            , ( "height", "100%" )
            ]
