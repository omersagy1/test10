module Model exposing (Model, Page(..), Product(..), SideBar, pathForPage)

import Browser.Navigation as Nav


type alias Model =
    { key : Nav.Key
    , currentPage : Page
    , sideBar : SideBar
    }


type alias SideBar =
    { buttons : List Page
    }


type Page
    = Home
    | Etsy
    | Product Product
    | Shows
    | About
    | Contact


type Product
    = Mezuzot
    | Jewelry
    | PhotoHolders
    | Bottles


pathForPage : Page -> String
pathForPage page =
    case page of
        Home ->
            "home"

        Etsy ->
            "etsy"

        Product Mezuzot ->
            "mezuzot"

        Product Jewelry ->
            "jewelry"

        Product Bottles ->
            "bottles"

        Product PhotoHolders ->
            "holders"

        Shows ->
            "shows"

        About ->
            "about"

        Contact ->
            "contact"
