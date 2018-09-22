module View.Shows exposing (showsPage)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import View.Asset as Asset


showsPage : Html a
showsPage =
    div [ class "shows-page" ]
        [ div [ class "subtitle" ] [ text "Upcoming" ]
        , shows
        ]


shows : Html a
shows =
    text "some shows!"
