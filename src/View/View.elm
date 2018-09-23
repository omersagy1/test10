module View.View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, a, div, text)
import Html.Attributes exposing (class, href, src)
import Html.Events exposing (onMouseOut, onMouseOver)
import Message exposing (Message)
import Model exposing (..)
import View.Asset as Asset
import View.Etsy as Etsy
import View.Home as Home
import View.Mezuzot as Mezuzot
import View.Shows as Shows


view : Model -> Document Message
view model =
    { title = "Fused Glass Art"
    , body =
        [ div [ class "top-level" ]
            [ sideBar model.sideBar
            , div [ class "main-title" ] [ text (pageTitle model.currentPage) ]
            , div [ class "main-body" ] [ body model ]
            ]
        ]
    }


body : Model -> Html Message
body model =
    case model.currentPage of
        Home ->
            Home.homePage

        Etsy ->
            Etsy.etsyPage

        Product Mezuzot ->
            Mezuzot.mezuzotPage

        Shows ->
            Shows.showsPage model

        other ->
            div [] [ text "page not implemented!" ]


sideBar : SideBar -> Html Message
sideBar sb =
    div [ class "sidebar" ]
        (List.map navButton sb.buttons)


navButton : Page -> Html Message
navButton page =
    let
        label =
            buttonLabel page
    in
    a [ href (Asset.link page) ]
        [ div [ class "nav-button" ] [ text label ] ]


buttonLabel : Page -> String
buttonLabel page =
    case page of
        Home ->
            "Home"

        Etsy ->
            "Etsy"

        Product Mezuzot ->
            "Mezuzot"

        Product Jewelry ->
            "Jewelry"

        Product Bottles ->
            "Wine Bottles"

        Product PhotoHolders ->
            "Photo Holders"

        Shows ->
            "Shows & Events"

        About ->
            "About Gila"

        Contact ->
            "Contact Us"


pageTitle : Page -> String
pageTitle p =
    case p of
        Home ->
            "Gila Sagy Fused Glass Art"

        Shows ->
            "Shows and Events"

        other ->
            "Not Implemented"
