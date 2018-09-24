module View.Shows exposing (showsPage)

import Date
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Model exposing (Model, Show)
import View.Asset as Asset


showsPage : Model -> Html a
showsPage model =
    div [ class "shows-page" ]
        [ div [ class "subtitle" ] [ text "Upcoming" ]
        , shows model
        ]


shows : Model -> Html a
shows model =
    div [ class "shows-list" ] (List.map show model.shows)


show : Show -> Html a
show s =
    div [ class "shows-list-entry" ]
        [ div [] [ text s.name ]
        , div [] [ text (Date.format "MMMM ddd, y" s.startDate) ]
        , div [] [ text s.boothName ]
        ]
