module Model exposing (Model, Page(..), Product(..), SideBar, pathForPage)

import Browser.Navigation as Nav
import Time exposing (Posix)


type alias Model =
    { key : Nav.Key
    , currentPage : Page
    , sideBar : SideBar
    , shows : List Show
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


type alias Show =
    { name : String -- Name of the show.
    , startDate : Posix -- Date the show is beginning.
    , endDate : Maybe Posix -- Date the show is ending, if the show is multi-day.
    , boothName : String -- The name of the location within the show, e.g. "Booth #101"
    }


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
