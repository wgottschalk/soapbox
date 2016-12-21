module Rating.View exposing (..)

import Material
import Material.Button as Button
import Material.Icon as Icon
import Material.Options as Options
import Material.Color as Color
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Model exposing (Msg(Mdl))
import Rating.Model exposing (Rating)
import Model exposing (Msg(ShowRatings, HideRatings))


ratingButton : Material.Model -> Rating -> Html Msg
ratingButton mdl rating =
    let
        gradeBtn =
            renderGrade mdl rating

        openClass =
            if rating.isOpen then
                "open"
            else
                ""

        icon =
            if rating.isOpen then
                Icon.i "clear"
            else
                Icon.i "insert_comment"
    in
        div [ class ("rating-button " ++ openClass), onClick (toggleRatings rating) ]
            [ gradeBtn "A"
            , gradeBtn "B"
            , gradeBtn "C"
            , gradeBtn "D"
            , gradeBtn "F"
            , Button.render Mdl
                [ 0 ]
                mdl
                [ Button.fab
                , Button.raised
                , Button.colored
                , Button.ripple
                ]
                [ icon ]
            ]


toggleRatings : Rating -> Msg
toggleRatings { isOpen } =
    if isOpen then
        HideRatings
    else
        ShowRatings


renderGrade : Material.Model -> Rating -> String -> Html Msg
renderGrade mdl { isOpen } letter =
    Button.render Mdl
        [ 0 ]
        mdl
        [ Button.icon
        , Button.raised
        , Button.ripple
        , Button.accent
        , Options.id ("grade" ++ letter)
        , Options.cs "grade"
        ]
        [ text letter ]
