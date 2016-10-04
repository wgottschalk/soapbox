module Movie.View exposing (..)

import Html exposing (Html, Attribute, div, h2, p, hr, img, text, span, button)
import Html.Attributes exposing (class, src, style)
import Html.Events exposing (onClick)
import Movie.Model exposing (Movie)
import Types exposing (Msg(Scale), Direction(..), Id)


view : Movie -> Int -> Html Msg
view { title, summary, releaseDate, imgUrl, expanded } key =
    div [ class "card", onClick (scalingMsg expanded key) ]
        [ div [ class "placeholder" ] []
        , div [ cardStyles expanded ]
            [ img [ src imgUrl ] []
            , div [ (overlayStyles expanded), class "card-overlay" ]
                [ h2 [] [ text title ]
                , span [] [ text releaseDate ]
                , p [ class "description" ] [ text summary ]
                , button [ class "review-button" ] [ text "review" ]
                ]
            ]
        ]


scalingMsg : Bool -> Id -> Msg
scalingMsg expanded key =
    if expanded then
        Scale Down key
    else
        Scale Up key


overlayStyles : Bool -> Attribute a
overlayStyles expanded =
    if expanded then
        style [ ( "opacity", "1" ) ]
    else
        style [ ( "opacity", "0" ) ]


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
