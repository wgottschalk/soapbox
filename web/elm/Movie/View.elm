module Movie.View exposing (..)

import Material
import Material.Elevation as Elevation
import Material.Options exposing (css, cs)
import Material.Card as Card
import Material.Button as Button
import Material.Icon as Icon
import Material.Options as Options
import Movie.Model exposing (Movie)
import Model exposing (Msg(Mdl, OpenCard, CloseCard))
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Html exposing (Html, div, h2, h4, text, i, p, span)


renderCard : Int -> Movie -> Html Msg
renderCard id { title, summary, releaseDate, imgUrl } =
    Card.view
        [ css "background-image" ("url(" ++ imgUrl ++ ")")
        , css "background-position" "center center"
        , css "background-repeat" "no-repeat"
        , css "background-size" "cover"
        , cs "card"
        , Options.attribute (onClick (OpenCard id))
        , Elevation.e2
        ]
        []


renderDetails : Material.Model -> Maybe Movie -> Html Msg
renderDetails mdl movie =
    case movie of
        Just { title, summary, releaseDate, imgUrl } ->
            let
                backgroundCss =
                    style
                        [ ( "background-image", ("url(" ++ imgUrl ++ ")") )
                        , ( "background-position", "center center" )
                        , ( "background-repeat", "no-repeat" )
                        , ( "background-size", "cover" )
                        ]
            in
                div [ class "details", backgroundCss ]
                    [ div [ class "overlay" ]
                        [ div [ class "overlay-container" ]
                            [ span [ class "back", onClick CloseCard ] [ Icon.i "clear" ]
                            , h2 [] [ text title ]
                            , h4 [] [ text releaseDate ]
                            , p [] [ text summary ]
                            , ratingButton mdl
                            ]
                        ]
                    ]

        Nothing ->
            div [ class "details" ] [ text "there is nothing here" ]


ratingButton : Material.Model -> Html Msg
ratingButton mdl =
    div [ class "rating-button" ]
        [ Button.render Mdl
            [ 0 ]
            mdl
            [ Button.fab
            , Button.colored
            , Button.ripple
            ]
            [ Icon.i "insert_comment" ]
        ]
