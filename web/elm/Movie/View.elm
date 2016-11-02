module Movie.View exposing (..)

import Material.Elevation as Elevation
import Material.Options exposing (css, cs)
import Material.Card as Card
import Material.Icon as Icon
import Material.Options as Options
import Movie.Model exposing (Movie)
import Model exposing (Msg(Mdl, OpenCard, CloseCard))
import Html.Attributes exposing (class, style, id)
import Html.Events exposing (onClick)
import Html exposing (Html, div, h2, h4, text, i, p, span, header)
import Rating.View as Rating
import Model exposing (Model)


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


renderDetails : Model -> Maybe Movie -> Html Msg
renderDetails { mdl, rating } movie =
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
                        [ header [ id "back-header", class "mdl-shadow--2dp" ]
                            [ span [ class "back", onClick CloseCard ]
                                [ Icon.i "chevron_left", text "BACK" ]
                            ]
                        , div [ class "overlay-container" ]
                            [ h2 [] [ text title ]
                            , h4 [] [ text releaseDate ]
                            , p [] [ text summary ]
                            , Rating.ratingButton mdl rating
                            ]
                        ]
                    ]

        Nothing ->
            div [ class "details" ] [ text "there is nothing here" ]
