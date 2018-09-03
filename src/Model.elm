module Model exposing (..)

import Browser.Navigation as Nav


type alias Model = 
  { key : Nav.Key
  , currentPage : Page
  , home : HomePage
  , sideBar : SideBar
  }


type alias SideBar =
  { buttons: List Page
  , highlightedPage: Maybe Page
  }


type Page = Home
            | Etsy
            | Product Product
            | Shows
            | About
            | Contact


type Product = Mezuzot
               | Jewelry
               | PhotoHolders
               | Bottles


type alias HomePage =
  { highlightedPhoto : Maybe Product
  }
